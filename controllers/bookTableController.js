const { sequelize } = require("../models");

let controller = {};

controller.init = async (req, res, next) => {
    next();
}

controller.showForm = async (req, res) => {
    const user = req.session.user;
    const branches = await sequelize.query("SELECT * FROM BRANCH", { type: sequelize.QueryTypes.SELECT });
    const dishes = await sequelize.query("SELECT TOP10 * FROM DISH", { type: sequelize.QueryTypes.SELECT });

    if (!user) {
        res.render("bookTable", {
            layout: "layout",
            title: "Book Table",
            name: "Book Table",
            branches,
            dishes,
        });
        return;
    }

    const { role } = user;

    let layout;
    switch (role) {
        case "employee":
            layout = user.usertype != null ? "manager" : "emp";
            break;
        case "customer":
            layout = "customer";
            break;
        case "admin":
            layout = "admin";
            break;
        default:
            layout = "layout";
    }

    res.render("bookTable", {
        layout,
        title: "Book Table",
        name: "Book Table",
        branches,
        dishes,
    });
}

controller.bookTable = async (req, res) => {
    
}

module.exports = controller;