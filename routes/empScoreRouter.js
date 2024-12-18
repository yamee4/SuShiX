const express = require("express");
const router = express.Router();
const controller = require("../controllers/empScoreController");

// Route to show the branch revenue page
router.get("/", controller.showEmpScore);

// Route to handle form submission for branch revenue
router.post("/", controller.getEmpScore);

module.exports = router;