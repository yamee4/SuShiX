const { sequelize } = require('../models'); // Adjust the path as needed

let controller = {}

controller.showPage = (req, res) => {
    const user = req.session.user;

    if (!user) {
        res.render('signup', {
            layout: 'layout',
            title: 'Sign Up',
            name: 'sign up',
        });
        return;
    }

    const { role } = user;

    let layout;
    switch (role) {
        case 'employee':
            layout = user.usertype != null ? 'manager' : 'emp';
            break;
        case 'customer':
            layout = 'customer';
            break;
        case 'admin':
            layout = 'admin';
            break;
        default:
            layout = 'layout';
    }

    res.render('signup', {
        layout,
        title: 'Sign Up',
        name: 'Sign Up',
    });
};

controller.signUp = async (req, res) => {
    const { 
        citizenId,
        memberCard, 
        firstname,
        lastname, 
        gender,
        phone,
        email,
        password } = req.body;
        

    const sanitizeInput = (value) => (value === undefined || value === '') ? null : value;
    console.log (req.body);

        // Sanitize inputs
    const sanitizedInputs = {
        citizenId: sanitizeInput(citizenId),
        memberCard: sanitizeInput(memberCard),
        firstname: sanitizeInput(firstname),
        lastname: sanitizeInput(lastname),
        gender: sanitizeInput(gender),
        phonenumber: sanitizeInput(phone),
        email: sanitizeInput(email),
        password: sanitizeInput(password),
    };

    sequelize.query(
        `EXEC [dbo].[UserSignUp]
            @cccd = :citizenId,
            @firstname = :firstname,
            @lastname = :lastname,
            @password = :password,
            @phone = :phonenumber,
            @email = :email,
            @gender = :gender,
            @membercard = :memberCard`,
        {
            replacements: sanitizedInputs,
            type: sequelize.QueryTypes.INSERT,
        }
    ).then(results => {
        res.render("signup", {
            layout: "layout",
            title: "Sign Up",
            name: "Sign Up",
            message: 'Sign up successful' 
        });

    }).catch(error => {;
        res.render("signup", {
            layout: "layout",
            title: "Sign Up",
            name: "Sign Up",
            message: error.message
        });
    });
}

module.exports = controller;