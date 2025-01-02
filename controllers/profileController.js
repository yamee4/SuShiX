const { SELECT } = require("sequelize/lib/query-types");
const { sequelize } = require("../models");

let controller = {};

controller.showProfile = async (req, res) => {
    const user = req.session.user;

    if (!user) {
        res.render("profile", {
            layout: "layout",
            title: "Home",
            name: "Home",
        });
        return;
    }

    let { id, username, usertype, role } = user;

    console.log(user);

    let layout;
    switch (role) {
        case "employee":
            layout = user.usertype != null ? "manager" : "emp";
            try {
                const employeeInfo = await controller.getEmployeeInfo(id);

                let {
                    EmpID,
                    EmpFirstName,
                    EmpLastName,
                    EmpBirthDate,
                    EmpGender,
                    Salary,
                    BranchManager,
                } = employeeInfo;

                res.render("employeeProfile", {
                    layout,
                    title: "Home",
                    name: "Home",
                    username: username,
                    role: role,
                    EmpID: EmpID,
                    EmpFirstName: EmpFirstName,
                    EmpLastName: EmpLastName,
                    EmpBirthDate: EmpBirthDate,
                    EmpGender: EmpGender,
                    Salary: Salary,
                    BranchManager: BranchManager,
                });
            } catch (error) {
                console.error(error);
                res.render("error", {
                    error: "An error occurred while fetching employee information",
                });
            }
            break;
        case "customer":
            layout = "customer";
            try {
                const customerInfo = await controller.getCustomerInfo(id);

                let {
                    CCCD,
                    CustomerFirstName,
                    CustomerLastName,
                    PhoneNumber,
                    Email,
                    Gender,
                    isMember,
                    isRegistered,
                } = customerInfo;

                res.render("customerProfile", {
                    layout,
                    title: "Home",
                    name: "Home",
                    username: username,
                    role: role,
                    CCCD: CCCD,
                    CustomerFirstName: CustomerFirstName,
                    CustomerLastName: CustomerLastName,
                    PhoneNumber: PhoneNumber,
                    Email: Email,
                    Gender: Gender,
                    isMember: isMember,
                    isRegistered: isRegistered,
                });
            } catch (error) {
                console.error(error);
                res.render("error", {
                    error: "An error occurred while fetching employee information",
                });
            }
            break;
        case "admin":
            layout = "admin";
            username = "Admin";
            res.render("profile", {
                layout,
                title: "Home",
                name: "Home",
                username: username,
                role: role,
            });
            break;
        default:
            layout = "layout";
            res.render("profile", {
                layout,
                title: "Home",
                name: "Home",
                username: username,
                role: role,
            });
    }
};

module.exports = controller;

controller.getEmployeeInfo = async (EmpID) => {
    try {
        const results = await sequelize.query(
            "SELECT * FROM Employee WHERE EmpID = :EmpID",
            {
                replacements: {
                    EmpID,
                },
                type: sequelize.QueryTypes.SELECT,
            }
        );
        return results[0];
    } catch (error) {
        console.error(error);
        throw new Error(
            "An error occurred while fetching employee information"
        );
    }
};

controller.getCustomerInfo = async (CCCD) => {
    try {
        const results = await sequelize.query(
            "select * from CUSTOMER where CCCD = :CCCD",
            {
                replacements: {
                    CCCD,
                },
                type: sequelize.QueryTypes.SELECT,
            }
        );
        return results[0];
    } catch (error) {
        console.error(error);
        throw new Error(
            "An error occurred while fetching customer information"
        );
    }
};

module.exports = controller;
