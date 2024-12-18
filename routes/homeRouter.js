const express = require('express');
const router = express.Router();

const {showHome, logout} = require('../controllers/homeController');

router.get('/', showHome);

router.get('/logout', logout);

module.exports = router;