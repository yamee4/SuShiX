const express = require("express");
const router = express.Router();
const controller = require("../controllers/compRevenueController");

// Route to show the branch revenue page
router.get("/", controller.showCompRevenue);

// Route to handle form submission for branch revenue
router.post("/", controller.getCompRevenue);

module.exports = router;