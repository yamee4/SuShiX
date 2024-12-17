const controller = {};
const { SELECT } = require('sequelize/lib/query-types');
const { sequelize } = require('../models')

controller.showBranchRevenue = async (req, res) => {
    res.render("branchRevenue", {
        layout: "layout",
        title: "Branch Revenue",
        name: "Branch Revenue"
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