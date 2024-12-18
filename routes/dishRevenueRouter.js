const express = require("express");
const router = express.Router();
const controller = require("../controllers/dishRevenueController");

// Route to show the branch revenue page
router.get("/", controller.showDishRevenue);

// Route to handle form submission for branch revenue
router.post("/", controller.getDishRevenue);

module.exports = router;