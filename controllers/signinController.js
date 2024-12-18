let controller = {};
const e = require('express');
const { sequelize } = require('../models');
const { use } = require('../routes/homeRouter');

controller.showPage = (req, res) => {
    res.render("signin", {
        layout: "layout",
        title: "Sign In",
        name: "Sign In",
        username: req.cookies.username,
        password: req.cookies.password
    });
};

controller.signIn = async (req, res) => {
    const { username, password, rememberMe } = req.body;

    const sanitizeInput = (value) => (value === undefined || value === '') ? null : value;

    // Sanitize inputs
    const sanitizedInputs = {
        username: sanitizeInput(username),
        password: sanitizeInput(password),
    };

    sequelize.query(
        `EXEC [dbo].[UserLogin]
            @username = :username,
            @password = :password`,
        {
            replacements: sanitizedInputs,
            type: sequelize.QueryTypes.SELECT,
        }
    ).then(results => {
        if (results.length > 0 && results[0].Role) {
            const { ID, Username, userType, Role } = results[0];
            console.log(results[0]);
    
            // Store user session data
            req.session.user = { id: ID, username: Username, usertype: userType, role: Role };

            if(rememberMe) {
                // Set cookie
                res.cookie("username", results[0].Username);
                res.cookie("password", results[0].Password);
            }
    
            // Redirect based on role
            res.redirect('/home');
        } 
            
        else {
                res.render("signin", {
                    layout: "layout",
                    title: "Sign In",
                    name: "Sign In",
                    message: 'Invalid username or password'
                });
         }

    }).catch(error => {
       res.render("signin", {
            layout: "layout",
            title: "Sign In",
            name: "Sign In",
            message: error.message
        });
    });
}

module.exports = controller;