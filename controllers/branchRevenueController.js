const controller = {};
const { SELECT } = require('sequelize/lib/query-types');
const { sequelize } = require('../models')
var layout;

controller.showBranchRevenue = async (req, res) => {
    const user = req.session.user;

    if (!user) {
        res.render('branchRevenue', {
            layout: 'layout',
            title: 'Branch Revenue',
            name: 'Branch Revenue',
        });
        return;
    }

    const { role } = user;

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
        title: 'Branch Revenue',
        name: 'Branch Revenue',
    });
}

controller.getBranchRevenue = async (req, res) => {
    const { branchID, startDate, endDate } = req.body;
    const user = req.session.user;

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

        const { role } = user;

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
            title: 'Branch Revenue',
            name: 'Branch Revenue',
            results: results,
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