const controller = {};
const { sequelize } = require("../models");

controller.init = async (req, res, next) => {
    //res.locals.branches = await models.BRANCH.findAll();
    next();
};

controller.showPage = async (req, res) => {
    let limit = 5;
    let page = isNaN(req.query.page) ? 1 : parseInt(req.query.page);
    let offset = (page - 1) * limit;
    page = isNaN(page) ? 1 : parseInt(page);

    let options = {
        where: {},
    };
   
    
   
    let totalRows = await sequelize.query(
        `SELECT COUNT(*) AS totalRows FROM DISH`,
        {
            type: sequelize.QueryTypes.SELECT,
        }
    );


    res.locals.pagination = {
        page,
        limit,
        totalRows,
        queryParams: req.query,
    };

    let dishes = await sequelize.query(
       `SELECT * FROM DISH`,
       {
            type: sequelize.QueryTypes.SELECT,
       }
    );

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

controller.searchDish = async (req, res) => {
    const { keyword } = req.body;
    let limit = 5;
    let page = isNaN(req.query.page) ? 1 : parseInt(req.query.page);
    let offset = (page - 1) * limit;
    page = isNaN(page) ? 1 : parseInt(page);
    let layout;

    console.log(keyword);

    let dishes = await sequelize.query(
        `EXEC [dbo].[usp_SearchMenu]
            @DishName = :keyword`,
        {
            replacements: { keyword },
            type: sequelize.QueryTypes.SELECT,
        }
    );


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