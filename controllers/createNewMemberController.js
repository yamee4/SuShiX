const controller = {};
const { sequelize } = require('../models');

controller.showCreateNewMember = async (req, res) => {
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
    res.render('createNewMember', {
        layout,
        title: 'Create New Member',
        name: 'Create New Member',
    });
}

controller.insertNewMember = async (req, res) => {
    const { MCCCD, CardNumber, CreateDate, SupportEmp } = req.body;

    try {
        // Execute the stored procedure to add a new member
        const [results, metadata] = await sequelize.query(
            `EXEC [dbo].[usp_ADD_MEMBER_CUSTOMER]
                @MCCCD = :MCCCD,
                @CardNumber = :CardNumber,
                @CreateDate = :CreateDate,
                @SupportEmp = :SupportEmp`,
            {
                replacements: { MCCCD, CardNumber, CreateDate, SupportEmp },
                type: sequelize.QueryTypes.RAW,
            }
        );

        // Check if there is a success message
        if (results.length > 0 && results[0].SuccessMessage) {
            res.render("createNewMember", {
                layout: "layout",
                title: "Create New Member",
                name: "Create New Member",
                successMessage: results[0].SuccessMessage,
            });
        } else {
            // If no success message, handle it as an error
            res.render("createNewMember", {
                layout: "layout",
                title: "Create New Member",
                name: "Create New Member",
                error: 'Failed to create new member. Please try again.',
            });
        }
    } catch (error) {
        console.error('Error executing stored procedure:', error);
        res.render("createNewMember", {
            layout: "layout",
            title: "Create New Member",
            name: "Create New Member",
            error: error.message || 'Failed to create new member. Please try again.',
        });
    }
}

module.exports = controller;