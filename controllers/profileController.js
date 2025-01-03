const e = require("express");
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
                const employeeOrders = await controller.getEmployeeOrders(id);
                profileData = {
                    ...profileData,
                    layout: usertype ? "manager" : "emp",
                    ...employeeInfo,
                    ...employeeOrders
                };
                return res.render("profile/employee", profileData);
            }
            case "customer": {
                const customerInfo = await controller.getCustomerInfo(id);
                const bills = await controller.getCustomerBill(id);
                profileData = {
                    ...profileData,
                    layout: "customer",
                    ...customerInfo,
                    ...bills
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

controller.getCustomerBill = async (CCCD) => {
    const results = await sequelize.query(
        `   SELECT TicketID , EmpID, CreatedDate, TotalPrice, Discount
            FROM ORDER_TICKET 
            WHERE CCCD = :CCCD
            ORDER BY CreatedDate DESC`,
        {
            replacements: { CCCD },
            type: sequelize.QueryTypes.SELECT
        }
    );
    return results[0];
}

controller.getEmployeeOrders = async (EmpID) => {
    const results = await sequelize.query(
        `   SELECT TicketID, CCCD, CreatedDate, TotalPrice, Discount
            FROM ORDER_TICKET
            WHERE EmpID = :EmpID
            ORDER BY CreatedDate DESC`,
        {
            replacements: { EmpID },
            type: sequelize.QueryTypes.SELECT
        }
    );
    return results[0];
}

module.exports = controller;