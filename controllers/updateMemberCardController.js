const controller = {};
const { sequelize } = require('../models');

controller.getMemberCard = async (req, res) => {
    const user = req.session.user;

    // Determine layout based on user role
    let layout = 'layout'; // Default layout
    if (user) {
        const { role, usertype } = user;
        switch (role) {
            case 'employee':
                layout = usertype ? 'manager' : 'emp';
                break;
            case 'customer':
                layout = 'customer';
                break;
            case 'admin':
                layout = 'admin';
                break;
        }
    }

    // Render the create new member page
    res.render('updateMemberCard', {
        layout,
        title: 'Update Member Card',
        name: 'Update Member Card',
    });
}

controller.updateMemberCard = async (req, res) => {
    const { CCCD } = req.body;

    try {
        // Execute the stored procedure to update member rank
        await sequelize.query(
            `EXEC [dbo].[usp_UPDATE_MEMBER_RANK] @CCCD = :CCCD`,
            {
                replacements: { CCCD },
                type: sequelize.QueryTypes.RAW,
            }
        );

        // If execution reaches here, it means the stored procedure was successful
        res.render("updateMemberCard", {
            layout: "layout",
            title: "Update Member Card",
            name: "Update Member Card",
            successMessage: 'Member rank updated successfully.',
        });
    } catch (error) {
        console.error('Error executing stored procedure:', error);
        res.render("updateMemberCard", {
            layout: "layout",
            title: "Update Member Card",
            name: "Update Member Card",
            error: error.message || 'Failed to update member rank. Please try again.',
        });
    }
}

module.exports = controller;