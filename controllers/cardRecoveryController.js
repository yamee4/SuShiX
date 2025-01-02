const controller = {};
const { SELECT } = require("sequelize/lib/query-types");
const { sequelize } = require("../models");

controller.showCardRecoverForm = async (req, res) => {
    const user = req.session.user;

    if (!user) {
        res.render('card_recover', {
            layout: 'layout',
            title: 'Card Recovery',
            name: 'Card Recovery',
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

    res.render('card_recover', {
        layout,
        title: 'Card Recovery',
        name: 'Card Recovery',
    });
};

controller.replaceMemberCard = async (req, res) => {
    const { citizenId, issuedDate, EmpID } = req.body;
    const user = req.session.user;

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
    
        res.render('card_recover', {
            layout,
            title: 'Card Recovery',
            name: 'Card Recovery',
            message: 'Replace Member Card successful!',
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
