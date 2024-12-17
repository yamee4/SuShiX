const express = require("express");
const router = express.Router();
const controller = require("../controllers/searchEmpController");

// Route to show the branch revenue page
router.get("/", controller.showSearchEmp);

// Route to handle form submission for branch revenue
router.post("/", controller.getSearchEmp);

module.exports = router;