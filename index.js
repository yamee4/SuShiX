const express = require("express");
const expressHbs = require("express-handlebars");
const { createPagination } = require("express-handlebars-paginate");
const port = 3000;

const app = express();

app.use("/node_modules", express.static("node_modules"));
app.use(express.static(__dirname + "/Assets"));

app.engine(
    'hbs',
    expressHbs.engine({
        extname: 'hbs',
        defaultLayout: 'layout',
        layoutsDir: __dirname + '/views/layouts',
        partialsDir: __dirname + '/views/partials',
        runtimeOptions: {
            allowProtoPropertiesByDefault: true,
        },
        helpers: {
            createPagination,
        },
    })

);

app.set("view engine", "hbs");

app.get("/", (req, res) => res.redirect("/home"));

app.use("/home", require("./routes/homeRouter"));
app.use("/menu", require("./routes/menuRouter"));

app.use("/signin", require("./routes/signinRouter"));
app.use("/signup", require("./routes/signupRouter"));
app.use("/profile", require("./routes/profileRouter"));

app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.listen(port, () => {
    console.log("Server is running on port 3000");
});

const Handlebars = require("handlebars");

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

