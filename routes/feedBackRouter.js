const express = require("express");
const router = express.Router();
const controller = require("../controllers/feedBackController");

// Route to show the feedback form
router.get("/", controller.showFeedBackForm);

// Route to handle form submission for branch revenue
router.post("/", controller.addFeedback);

module.exports = router;
