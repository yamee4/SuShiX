const controller = {};
const { SELECT } = require('sequelize/lib/query-types');
const { sequelize } = require('../models')

controller.showCompRevenue = async (req, res) => {
    res.render("compRevenue", {
        layout: "layout",
        title: "Company Revenue",
        name: "Company Revenue"
    });
}

controller.getCompRevenue = async (req, res) => {
    const {startDate, endDate } = req.body;
    try {
        const results = await sequelize.query(
            `EXEC [dbo].[usp_GetCompanyRevenue]
                @startDate = :startDate,
                @endDate = :endDate`,
            {
                replacements: {startDate, endDate },
                type: sequelize.QueryTypes.SELECT,
            }
        );

        console.log(results);

        // Render the view with results
        res.render("compRevenue", {
            layout: "layout",
            title: "Company Revenue",
            name: "Company Revenue",
            results: results,
        });
    } catch (error) {
        console.error('Error executing stored procedure:', error);
        res.render("compRevenue", {
            layout: "layout",
            title: "Company Revenue",
            name: "Company Revenue",
            error: 'Failed to fetch revenue data.',
        });
    }
}

module.exports = controller;