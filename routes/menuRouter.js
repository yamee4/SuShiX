const express = require('express');
const router = express.Router();
const {showPage, init, searchDish, CheckOut} = require('../controllers/menuController');
const { isAuthenticate } = require('../middlewares/auth');


router.use("/", init);

router.get('/', showPage);

router.post('/', searchDish);

router.post('/checkout', isAuthenticate, CheckOut);

//protected route
router.get("/login", (req, res) => {
    res.render("login", { title: "Login" });
});
module.exports = router;