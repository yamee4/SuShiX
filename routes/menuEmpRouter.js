const express = require('express');
const router = express.Router();
const { showPage, init, searchDish, searchBySection, CheckOut } = require('../controllers/menuEmpController');
const { isAuthenticate } = require('../middlewares/auth');

// Initialize middleware
router.use("/", init);

// GET request to show the main page
router.get('/', showPage);

// POST request to search for dishes
router.post('/', searchDish);

// POST request to search by section
router.post('/searchBySection', searchBySection);

// POST request for checkout, protected route
router.post('/checkout', isAuthenticate, CheckOut);

// Protected route for sign-in
router.get("/signin", (req, res) => {
    res.render("signin", { title: "Sign In" });
});

module.exports = router;