const express = require("express");
const router = express.Router();
const controller = require("../controllers/updateMemberCardController");

// Route to show the branch revenue page
router.get("/", controller.getMemberCard);

// Route to handle form submission for branch revenue
router.post("/", controller.updateMemberCard);

module.exports = router;