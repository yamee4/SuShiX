const { sequelize } = require("../models");

const controller = {};

controller.showProfile = async (req, res) => {
    const user = req.session.user;
    if (!user) {
        return res.render("profile/default", {
            layout: "layout",
            title: "Profile"
        });
    }

    try {
        const { id, username, usertype, role } = user;
        let profileData = { layout: "layout", title: "Profile", username, role };

        switch (role) {
            case "employee": {
                const employeeInfo = await controller.getEmployeeInfo(id);
                profileData = {
                    ...profileData,
                    layout: usertype ? "manager" : "emp",
                    ...employeeInfo
                };
                return res.render("profile/employee", profileData);
            }
            case "customer": {
                const customerInfo = await controller.getCustomerInfo(id);
                profileData = {
                    ...profileData,
                    layout: "customer",
                    ...customerInfo
                };
                return res.render("profile/customer", profileData);
            }
            case "admin":
                return res.render("profile/admin", {
                    ...profileData,
                    layout: "admin",
                    username: "Admin"
                });
            default:
                return res.render("profile/default", profileData);
        }
    } catch (error) {
        console.error("Profile fetch error:", error);
        res.status(500).render("error", { 
            error: "Failed to load profile information" 
        });
    }
};

// Helper methods remain the same
controller.getEmployeeInfo = async (EmpID) => {
    const results = await sequelize.query(
        "SELECT * FROM Employee WHERE EmpID = :EmpID",
        {
            replacements: { EmpID },
            type: sequelize.QueryTypes.SELECT
        }
    );
    return results[0];
};

controller.getCustomerInfo = async (CCCD) => {
    const results = await sequelize.query(
        "SELECT * FROM CUSTOMER WHERE CCCD = :CCCD",
        {
            replacements: { CCCD },
            type: sequelize.QueryTypes.SELECT
        }
    );
    return results[0];
};

module.exports = controller;