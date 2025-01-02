const controller = {};
const { SELECT } = require("sequelize/lib/query-types");
const { sequelize } = require("../models");

controller.showFeedBackForm = async (req, res) => {
    const user = req.session.user;

    if (!user) {
        res.render('feedback', {
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

    res.render('feedback', {
        layout,
        title: 'Feedback',
        name: 'Feedback',
    });
};

controller.addFeedback = async (req, res) => {
    const {
        TicketID,
        "Feedback Service": FeedbackService,
        "Feedback Food Quality": FeedbackFoodQuality,
        "Feedback Price": FeedbackPrice,
        "Feedback Location": FeedbackLocation,
        FeedbackNote,
    } = req.body;

    try {
        const results = await sequelize.query(
            `EXEC [dbo].[usp_AddFeedbackDetail]
                @TicketID = :TicketID,
                @FeedbackService = :FeedbackService,
                @FeedbackFoodQuality = :FeedbackFoodQuality,
                @FeedbackPrice = :FeedbackPrice,
                @FeedbackLocation = :FeedbackLocation,
                @FeedbackNote = :FeedbackNote`,
            {
                replacements: {
                    TicketID,
                    FeedbackService,
                    FeedbackFoodQuality,
                    FeedbackPrice,
                    FeedbackLocation,
                    FeedbackNote,
                },
                type: sequelize.QueryTypes.INSERT,
            }
        );

        // Render the view with results
        res.render("feedback", {
            layout: "layout",
            title: "Feedback Form",
            name: "Feedback Form",
            results: "1",
            TicketID: TicketID,
        });
    } catch (error) {
        console.error("Error executing stored procedure:", error);
        res.render("feedback", {
            layout: "layout",
            title: "Feedback Form",
            name: "Feedback Form",
            error: "Failed to add feedback.",
        });
    }
};

module.exports = controller;
