const controller = {};
const { SELECT } = require('sequelize/lib/query-types');
const { sequelize } = require('../models')

controller.showSearchEmp = async (req, res) => {
    res.render("searchEmp", {
        layout: "layout",
        title: "Employee Searcher",
        name: "Employee Searcher"
    });
}

controller.getSearchEmp = async (req, res) => {
    const {BranchID, EmpID} = req.body;
    try {
        const results = await sequelize.query(
            `EXEC [dbo].[usp_SearchEmployee]
                @BranchID = :BranchID,
                @EmpID = :EmpID`,
            {
                replacements: { BranchID,EmpID },
                type: sequelize.QueryTypes.SELECT,
            }
        );

        console.log(results);

        // Render the view with results
        res.render("searchEmp", {
            layout: "layout",
            title: "Employee Searcher",
            name: "Employee Searcher",
            results: results,
            EmpID: EmpID,
            BranchID: BranchID,
        });
    } catch (error) {
        console.error('Error executing stored procedure:', error);
        res.render("searchEmp", {
            layout: "layout",
            title: "Employee Searcher",
            name: "Employee Searcher",
            error: 'Failed to employee data.',
        });
    }
}

module.exports = controller;