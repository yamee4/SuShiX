const express = require('express');
const expressHbs = require('express-handlebars');
const port = 3000;

const app = express();

app.use('/node_modules', express.static('node_modules'));
app.use(express.static(__dirname + "/Assets"));


app.engine(
    "hbs",
    expressHbs.engine({
        layoutsDir: __dirname + "/views/layouts",
        partialsDir:  __dirname + "/views/partials",
        extname: "hbs",
        defaultLayout: "layout"
    })
);

app.set("view engine", "hbs");



app.get('/', (req, res) => res.redirect('/home'));

app.use('/home', require('./routes/homeRouter'));
app.use('/signin', require('./routes/signinRouter'));
app.use('/signup', require('./routes/signupRouter'));

app.listen(port, () => {    
  console.log('Server is running on port 3000');
});