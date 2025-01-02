const express = require("express");
const router = express.Router();
const controller = require("../controllers/createNewMemberController");

// Route to show the branch revenue page
router.get("/", controller.showCreateNewMember);

// Route to handle form submission for branch revenue
router.post("/", controller.insertNewMember);

module.exports = router;