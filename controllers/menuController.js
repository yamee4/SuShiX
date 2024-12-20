const controller = {};
const models = require("../models");

controller.init = async (req, res, next) => {
    res.locals.branches = await models.BRANCH.findAll();
    next();
};

controller.showPage = async (req, res) => {
    let limit = 5;
    let page = isNaN(req.query.page) ? 1 : parseInt(req.query.page);
    let offset = (page - 1) * limit;
    page = isNaN(page) ? 1 : parseInt(page);

    let options = {
        attributes: [
            "DishName",
            "CurrentPrice",
            "DishSection",
            "DeliveryAvailable",
        ],
        where: {},
    };

    let totalRows = await models.sequelize.query(
        `SELECT COUNT(*) AS count FROM (SELECT DISTINCT DishName, CurrentPrice, DishSection, DeliveryAvailable FROM DISH) AS temp`,
        { type: models.sequelize.QueryTypes.SELECT }
    );

    res.locals.pagination = {
        page,
        limit,
        totalRows,
        queryParams: req.query,
    };

    let dishes = await models.DISH.findAll({ ...options, limit, offset });
    
    const user = req.session.user;

    if (!user) {
        res.render('menu', {
            layout: 'layout',
            title: 'Menu',
            name: 'Menu',
            dishes,
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

    res.render('menu', {
        layout,
        title: 'Menu',
        name: 'Menu',
        dishes,
    });
};

module.exports = controller;