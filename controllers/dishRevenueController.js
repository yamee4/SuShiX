const controller = {};
const { SELECT } = require('sequelize/lib/query-types');
const { sequelize } = require('../models')

controller.showDishRevenue = async (req, res) => {
    const user = req.session.user;

    if (!user) {
        res.render('dishRevenue', {
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

    res.render('dishRevenue', {
        layout,
        title: 'Dish Revenue',
        name: 'Dish Revenue',
    });
}

controller.getDishRevenue = async (req, res) => {
    const {startDate, endDate } = req.body;
    try {
        const results = await sequelize.query(
            `EXEC [dbo].[usp_CalculateStandardOrderRevenue]
                @startDate = :startDate,
                @endDate = :endDate`,
            {
                replacements: {startDate, endDate },
                type: sequelize.QueryTypes.SELECT,
            }
        );

        const results1 = await sequelize.query(
            `EXEC [dbo].[usp_CalculatePreOrderRevenue]
                @startDate = :startDate,
                @endDate = :endDate`,
            {
                replacements: {startDate, endDate },
                type: sequelize.QueryTypes.SELECT,
            }
        );

        const results2 = await sequelize.query(
            `EXEC [dbo].[usp_CalculateOnlineOrderRevenue]
                @startDate = :startDate,
                @endDate = :endDate`,
            {
                replacements: {startDate, endDate },
                type: sequelize.QueryTypes.SELECT,
            }
        );

        // Render the view with results
        res.render("dishRevenue", {
            layout: "layout",
            title: "Dish Revenue",
            name: "Dish Revenue",
            results: results,
            results1: results1,
            results2: results2,
        });
    } catch (error) {
        console.error('Error executing stored procedure:', error);
        res.render("dishRevenue", {
            layout: "layout",
            title: "Dish Revenue",
            name: "Dish Revenue",
            error: 'Failed to fetch revenue data.',
        });
    }
}

module.exports = controller;