const { sequelize } = require('../models'); // Adjust the path as needed

let contoller = {}

contoller.showPage = (req, res) => {
    res.render("signup", {
        layout: "layout",
        title: "Sign Up",
        name: "Sign Up"
    });
};

contoller.signUp = async (req, res) => {
    const { 
        citizenId,
        memberCard, 
        firstname,
        lastname, 
        gender,
        phonenumber,
        email,
        password } = req.body;

    const sanitizeInput = (value) => (value === undefined || value === '') ? null : value;

        // Sanitize inputs
    const sanitizedInputs = {
        citizenId: sanitizeInput(citizenId),
        memberCard: sanitizeInput(memberCard),
        firstname: sanitizeInput(firstname),
        lastname: sanitizeInput(lastname),
        gender: sanitizeInput(gender),
        phonenumber: sanitizeInput(phonenumber),
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
        res.status(200).send({ message: 'Sign up successful', results });
    }).catch(error => {
        console.error('Error executing stored procedure:', error);
        res.status(500).send({ message: 'Sign up failed', error });
    });
}

module.exports = contoller;