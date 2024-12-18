const controller = {};
const { SELECT } = require('sequelize/lib/query-types');
const { sequelize } = require('../models')

controller.showBranchRevenue = async (req, res) => {
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

    res.render('branchRevenue', {
        layout,
        title: 'Home',
        name: 'Home',
    });
}

controller.getBranchRevenue = async (req, res) => {
    const { branchID, startDate, endDate } = req.body;
    try {
        const results = await sequelize.query(
            `EXEC [dbo].[usp_GetBranchRevenue]
                @BranchID = :branchID,
                @startDate = :startDate,
                @endDate = :endDate`,
            {
                replacements: { branchID, startDate, endDate },
                type: sequelize.QueryTypes.SELECT,
            }
        );

        console.log(results);

        // Render the view with results
        res.render("branchRevenue", {
            layout: "layout",
            title: "Branch Revenue",
            name: "Branch Revenue",
            results: results,
            branchID: branchID,
        });
    } catch (error) {
        console.error('Error executing stored procedure:', error);
        res.render("branchRevenue", {
            layout: "layout",
            title: "Branch Revenue",
            name: "Branch Revenue",
            error: 'Failed to fetch revenue data.',
        });
    }
}

module.exports = controller;