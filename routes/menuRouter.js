const express = require('express');
const router = express.Router();
const {showPage, init, searchDish} = require('../controllers/menuController');


router.use("/", init);

router.get('/', showPage);

router.post('/', searchDish);

module.exports = router;