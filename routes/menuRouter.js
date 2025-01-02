const express = require('express');
const router = express.Router();
const {showPage, init, searchDish, CheckOut, searchBySection} = require('../controllers/menuController');
const { isAuthenticate } = require('../middlewares/auth');


router.use("/", init);

router.get('/', showPage);

router.post('/', searchDish);

// POST request to search by section
router.post('/searchBySection', searchBySection);

router.post('/checkout', isAuthenticate, CheckOut);

//protected route
router.get("/signin", (req, res) => {
    res.render("signin", { title: "Sign In" });
});
module.exports = router;