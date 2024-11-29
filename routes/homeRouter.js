const express = require('express');
const router = express.Router();

const {showHome} = require('../controllers/homeController');

router.get('/', showHome);

module.exports = router;