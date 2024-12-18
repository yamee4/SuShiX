const controller = {};
const { SELECT } = require('sequelize/lib/query-types');
const { sequelize } = require('../models')

controller.showEmpScore = async (req, res) => {
    const user = req.session.user;

    if (!user) {
        res.render('index', {
            layout: 'layout',
            title: 'Home',
            name: 'Home',
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

    res.render('empScore', {
        layout,
        title: 'Home',
        name: 'Home',
    });
}

controller.getEmpScore = async (req, res) => {
    const {EmpID} = req.body;
    try {
        const results = await sequelize.query(
            `EXEC [dbo].[usp_GetEmpServiceScore ]
                @EmpID = :EmpID`,
            {
                replacements: { EmpID },
                type: sequelize.QueryTypes.SELECT,
            }
        );

        console.log(results);

        // Render the view with results
        res.render("empScore", {
            layout: "layout",
            title: "Employee Score",
            name: "Employee Score",
            results: results,
            EmpID: EmpID,
        });
    } catch (error) {
        console.error('Error executing stored procedure:', error);
        res.render("empScore", {
            layout: "layout",
            title: "Employee Score",
            name: "Employee Score",
            error: 'Failed to score revenue data.',
        });
    }
}

module.exports = controller;