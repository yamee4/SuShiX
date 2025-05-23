require("dotenv").config();
const path = require("path");

const express = require("express");
const expressHbs = require("express-handlebars");
const { createPagination } = require("express-handlebars-paginate");
const session = require("express-session");
const cookieParser = require("cookie-parser");
const Handlebars = require("handlebars");
const moment = require("moment");

const port = 3000;

const app = express();

//Cấu hình các thư mục static
app.use("/node_modules", express.static("node_modules"));
app.use(express.static(__dirname + "/public"));

//Thiết lập Template Engine
app.engine(
    "hbs",
    expressHbs.engine({
        extname: "hbs",
        defaultLayout: "layout",
        layoutsDir: __dirname + "/views/layouts",
        partialsDir: __dirname + "/views/partials",
        runtimeOptions: {
            allowProtoPropertiesByDefault: true,
        },
        helpers: {
            createPagination,
            getFirstLetter: function (name) {
                return name.charAt(0).toUpperCase();
            },

            getRandomColor: function () {
                const letters = "0123456789ABCDEF";
                let color = "#";
                for (let i = 0; i < 6; i++) {
                    color += letters[Math.floor(Math.random() * 16)];
                }
                return color;
            },

            formatDate: function (date) {
                return moment(date).format("DD/MM/YYYY");
            },
        },
    })
);

app.set("view engine", "hbs");

//Cấu hình cho phép đọc dữ liệu bằng phương thức POST
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//Cấu hình cho việc sử dụng cookie
app.use(cookieParser(process.env.COOKIE_SECRET || "keyboard cat"));

//Cấu hình cho việc sử dụng session
app.use(
    session({
        secret: process.env.SESSION_SECRET || "keyboard dog",
        resave: false,
        saveUninitialized: false,
        cookie: {
            maxAge: 20 * 60 * 1000,
            httpOnly: true,
            secret: false,
        },
    })
);

Handlebars.registerHelper("formatCurrency", function (price) {
    return `${price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")} VND`;
});

Handlebars.registerHelper("formatDelivery", function (deliveryAvailable) {
    if (deliveryAvailable === 1 || deliveryAvailable === true) {
        return "Can deliver";
    } else if (deliveryAvailable === 0 || deliveryAvailable === false) {
        return "Can't deliver";
    }
    return "Unknown";
});

Handlebars.registerHelper("formatDate", function (date) {
    return new Date(date).toLocaleDateString(); // Example date formatting
});

Handlebars.registerHelper('firstChar', function(str) {
    return str ? str.charAt(0) : '?';
});

Handlebars.registerHelper('formatDate', function(date) {
    return new Date(date).toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
    });
});

//middleware lay thong tin user da dang nhap
app.use((req, res, next) => {
    res.locals.user = req.session.user;
    next();
});

//Cấu hình các router
app.get("/", (req, res) => res.redirect("/home"));

app.use("/home", require("./routes/homeRouter"));
app.use("/menu", require("./routes/menuRouter"));
app.use("/menuEmp", require("./routes/menuEmpRouter"));

app.use("/signin", require("./routes/signinRouter"));
app.use("/signup", require("./routes/signupRouter"));
app.use("/profile", require("./routes/profileRouter"));
app.use("/branchRevenue", require("./routes/branchRevenueRouter"));
app.use("/empScore", require("./routes/empScoreRouter"));
app.use("/searchEmp", require("./routes/searchEmpRouter"));
app.use("/compRevenue", require("./routes/compRevenueRouter"));
app.use("/dishRevenue", require("./routes/dishRevenueRouter"));
app.use("/createNewMember", require("./routes/createNewMemberRouter"));
app.use("/updateMemberCard", require("./routes/updateMemberCardRouter"))
app.use("/bookTable", require("./routes/bookTableRouter"));


app.use("/feedback", require("./routes/feedBackRouter"));
app.use("/cardRecover", require("./routes/cardRecoveryRouter"));

app.listen(port, () => {
    console.log(`Server is running on ${port}`);
});
