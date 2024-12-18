const express = require("express");
const router = express.Router();
const controller = require("../controllers/cardRecoveryController");

// Route to show the feedback form
router.get("/", controller.showCardRecoverForm);

// Route to handle form submission for branch revenue
router.post("/", controller.replaceMemberCard);

module.exports = router;
