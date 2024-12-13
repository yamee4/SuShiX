const controller = {}
const models = require('../models');

controller.init = async (req, res, next) => {
    next();
}

controller.showPage = async (req, res) => {
    let limit = 5;
    let page = isNaN(req.query.page) ? 1 : parseInt(req.query.page);
    let offset = (page - 1) * limit;
    page = isNaN(page) ? 1 : parseInt(page);

    let options = {
        attributes: ['DishName', 'CurrentPrice', 'DishSection', 'DeliveryAvailable'],
        where: {}
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
    res.render('menu', { dishes: dishes, layout: 'layout', title: 'Menu', name: 'Menu' });
};

module.exports = controller;
