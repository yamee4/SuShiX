const controller = {};
const { SELECT } = require("sequelize/lib/query-types");
const { sequelize } = require("../models");

controller.showCardRecoverForm = async (req, res) => {
    res.render("card_recover", {
        layout: "layout",
        title: "Card Recover Form",
        name: "Card Recover Form",
    });
};

controller.replaceMemberCard = async (req, res) => {
    const { citizenId, issuedDate, EmpID } = req.body;

    try {
        const results = await sequelize.query(
            `EXEC [dbo].[usp_ReplaceMemberShipCard]
                @mcccd = :citizenId,
                @issueDate = :issuedDate,
	            @employeeID = :EmpID`,
            {
                replacements: {
                    citizenId,
                    issuedDate,
                    EmpID,
                },
                type: sequelize.QueryTypes.INSERT,
            }
        );

        // Render the view with results
        res.render("card_recover", {
            layout: "layout",
            title: "Card Recovery Form",
            name: "Card Recovery Form",
            results: "1",
            citizenId: citizenId,
        });
    } catch (error) {
        console.error("Error executing stored procedure:", error);
        res.render("card_recover", {
            layout: "layout",
            title: "Card Recovery Form",
            name: "Card Recovery Form",
            error: "Replace Member Card failed!",
        });
    }
};

module.exports = controller;
