const express = require('express');
const expressHbs = require('express-handlebars');
const port = 3000;

const app = express();

app.use(express.static('public'));

app.engine(
    "hbs",
    expressHB.engine({
        layoutsDir: __dirname + "/views/layouts",
        partialsDir:  __dirname + "/views/partials",
        extname: "hbs",
        defaultLayout: "layout"
    })
);

app.set("view engine", "hbs");



app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(port, () => {    
  console.log('Server is running on port 3000');
});