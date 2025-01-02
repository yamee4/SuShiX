const controller = {};
const { raw } = require("body-parser");
const { sequelize } = require("../models");
const { fn, col } = require('sequelize'); // Ensure you import fn and col from Sequelize

controller.init = async (req, res, next) => {
    //res.locals.branches = await models.BRANCH.findAll();
    next();
};

controller.showPage = async (req, res) => {
    let limit = 5;
    let page = isNaN(req.query.page) ? 1 : parseInt(req.query.page);
    page = isNaN(page) ? 1 : parseInt(page);

    let offset = (page - 1) * limit;

    try {
        // Fetch the total number of rows in the DISH table
        const totalRowsResult = await sequelize.query(
            `SELECT COUNT(*) AS totalRows FROM DISH`,
            { type: sequelize.QueryTypes.SELECT }
        );
        const totalRows = totalRowsResult[0]?.totalRows || 0;

        // Fetch paginated data
        const dishes = await sequelize.query(
            `SELECT * FROM DISH ORDER BY DishID OFFSET :offset ROWS FETCH NEXT :limit ROWS ONLY`,
            {
                type: sequelize.QueryTypes.SELECT,
                replacements: { limit, offset }, // Use replacements for parameterized queries
            }
        );

        const totalPages = Math.ceil(totalRows / limit);

        res.locals.pagination = {
            page,
            limit,
            totalRows,
            totalPages,
            queryParams: req.query,
        };

        const user = req.session.user;

        if (!user) {
            res.render('menu', {
                layout: 'layout',
                title: 'Menu',
                name: 'Menu',
                dishes,
                pagination: res.locals.pagination,
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

        // Render the menu view with the appropriate layout
        res.render('menu', {
            layout,
            title: 'Menu',
            name: 'Menu',
            dishes,
            pagination: res.locals.pagination,
        });
    } catch (error) {
        console.error("Error fetching paginated data:", error);
        res.status(500).send("An error occurred while fetching the menu.");
    }
};

controller.searchDish = async (req, res) => {
    const { keyword } = req.body;
    let limit = 5;
    let page = isNaN(req.query.page) ? 1 : parseInt(req.query.page);
    let offset = (page - 1) * limit;
    page = isNaN(page) ? 1 : parseInt(page);
    let layout;

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

controller.searchBySection = async (req, res) => {
    const { DishSection } = req.body;
    console.log("Selected Dish Section:", DishSection);
    
    let limit = 5;
    let page = isNaN(req.query.page) ? 1 : parseInt(req.query.page);
    let offset = (page - 1) * limit;
    page = isNaN(page) ? 1 : parseInt(page);
    let layout;

    let dishes = await sequelize.query(
        `EXEC [dbo].[usp_SearchBySection]
            @DishSection = :DishSection`,
        {
            replacements: { DishSection },
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

controller.CheckOut = async (req, res) => {
    const cartItems = req.body.cartItems; // Array of cart items sent from the frontend
    const userInfo = req.session.user; // User information stored in the session

    if (!cartItems || cartItems.length === 0) {
        return res.status(400).json({ message: "Cart is empty." });
    }

    const cartInsert = cartItems.map(item => ({
        DishID: item.id,
        Quantity: item.quantity,
        Price: item.price,
    }));

    try {
        await sequelize.query('DELETE FROM DSDONHANG');
        for (const item of cartInsert) {
            await sequelize.query(
                `INSERT INTO DSDONHANG (DishID, OrderTime, Quantity, Price) VALUES (:DishID, GETDATE(), :Quantity, :Price)`,
                {
                    replacements: {
                        DishID: item.DishID,
                        Quantity: item.Quantity,
                        Price: item.Price,
                    },
                    type: sequelize.QueryTypes.INSERT,
                }
            );
        }

        const cccd = userInfo.id;
        const TicketType = 'ONL';
        const BranchID = null;
        const EmpID = null;
        const NumberOfCustomer = 0;
        const PreOrderNote  = '';
        const TableName = '';


        await sequelize.query(
            `EXEC [dbo].[usp_ADD_ORDER_TICKET]
            @CCCD = :cccd,
            @TicketType = :ticketType,
            @BranchID = :branchID,
            @EmpID = :empID,
            @NumberOfCustomer = :numberOfCustomer,
            @PreOrderNote = :preOrderNote,
            @TableName = :tableName`,
                {
                    replacements: {
                        cccd,
                        ticketType: TicketType,
                        branchID: BranchID,
                        empID: EmpID,
                        numberOfCustomer: NumberOfCustomer,
                        preOrderNote: PreOrderNote,
                        tableName: TableName,
                    },
                    type: sequelize.QueryTypes.INSERT,
                }
            );
            
        console.log("Order processed successfully.");
        return res.json({ message: "Order processed successfully." })
    } catch (error) {
        console.error("Error during checkout:", error);
        res.status(500).json({ message: "An error occurred while processing the order." });
    }
};

module.exports = controller;