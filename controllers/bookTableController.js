const { sequelize } = require("../models");

let controller = {};

controller.init = async (req, res, next) => {
    next();
}

controller.showForm = async (req, res) => {
    const user = req.session.user;
    const branches = await sequelize.query("SELECT * FROM BRANCH", { type: sequelize.QueryTypes.SELECT });
    const dishes = await sequelize.query("SELECT TOP 15 * FROM DISH", { type: sequelize.QueryTypes.SELECT });

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
    const cartItems = req.body.cartItems; // Array of cart items sent from the frontend
    const branchID = req.body.branchID;
    const numberOfCustomers = req.body.numberOfCustomers;
    const preOrderNote = req.body.preOrderNote;

    const userInfo = req.session.user; // User information stored in the session

    if (!branchID) {
        return res.status(400).json({ message: "Branch ID is required." });
    }

    else if (!cartItems || cartItems.length === 0) {
        return res.status(400).json({ message: "Cart is empty." });
    }

    else if (!numberOfCustomers) {
        return res.status(400).json({ message: "Number of customers is required." });
    }

    else if (!preOrderNote) {
        return res.status(400).json({ message: "Pre-order note is required." });
    }

    const cartInsert = cartItems.map(item => ({
        DishID: item.id,
        Quantity: item.quantity,
        Price: item.price,
    }));

    try {
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
        const TicketType = 'PRE';
        const EmpID = null;
        const BranchResult = await sequelize.query(
            `SELECT BranchID FROM BRANCH WHERE BranchID = :branchID`,
            {
                replacements: { branchID },
                type: sequelize.QueryTypes.SELECT,
            }
        );
        
        const BranchID = BranchResult[0]?.BranchID; // Extract BranchID value from the result

        const NumberOfCustomer = numberOfCustomers;
        const PreOrderNote  =  preOrderNote;
        const TableName = null;


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
        await sequelize.query('DELETE FROM DSDONHANG');
        return res.json({ message: "Order processed successfully." })
    } catch (error) {
        console.error("Error during checkout:", error);
        res.status(500).json({ message: "An error occurred while processing the order." });
    }
}

module.exports = controller;