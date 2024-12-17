let controller = {};
const { sequelize } = require('../models');

controller.showPage = (req, res) => {
    res.render("signin", {
        layout: "layout",
        title: "Sign In",
        name: "Sign In"
    });
};

controller.signIn = async (req, res) => {
    const { username, password } = req.body;
    console.log(req.body);

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
        if (results.length === 0) {
            res.render("signin", {
                layout: "layout",
                title: "Sign In",
                name: "Sign In",
                message: 'Sign in failed'
            });
        } else {
           req.session.user = {
                
           };
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