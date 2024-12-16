const express = require('express');
const router = express.Router();
const {showPage, init} = require('../controllers/menuController');


router.use("/", init);
router.get('/', showPage);

module.exports = router;