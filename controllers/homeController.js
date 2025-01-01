const { sequelize } = require("../models");

let controller = {};

controller.init = async (req, res, next) => {
    next();
};

controller.showHome = async (req, res) => {
    const user = req.session.user;

    const branches = await sequelize.query(
        `SELECT BranchID, BranchName FROM BRANCH`,
        { type: sequelize.QueryTypes.SELECT }
    );

    if (!user) {
        res.render("index", {
            layout: "layout",
            title: "Home",
            name: "Home",
            branches,
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

    res.render("index", {
        layout,
        title: "Home",
        name: "Home",
        branches,
    });
};

controller.logout = (req, res) => {
    req.session.destroy();
    res.redirect("/signin");
};

module.exports = controller;
