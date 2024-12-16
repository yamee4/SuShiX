const contoller = {};
const { sequelize } = require('../models');

contoller.showPage = (req, res) => {
    res.render("signin", {
        layout: "layout",
        title: "Sign In",
        name: "Sign In"
    });
};

contoller.signIn = async (req, res) => {
    const { cccd, password } = req.body;

    const sanitizeInput = (value) => (value === undefined || value === '') ? null : value;

    // Sanitize inputs
    const sanitizedInputs = {
        cccd: sanitizeInput(cccd),
        password: sanitizeInput(password),
    };

    sequelize.query(
        `EXEC [dbo].[UserSignIn]
            @cccd = :cccd,
            @password = :password`,
        {
            replacements: sanitizedInputs,
            type: sequelize.QueryTypes.SELECT,
        }
    ).then(results => {
        if (results.length === 0) {
            res.status(401).send({ message: 'Sign in failed', results });
        } else {
            res.status(200).send({ message: 'Sign in successful', results });
        }
    }).catch(error => {
        console.error('Error executing stored procedure:', error);
        res.status(500).send({ message: 'Sign in failed', error });
    });
}

module.exports = contoller;