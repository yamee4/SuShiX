const express = require('express');
const router = express.Router();

const {showHome, logout, init} = require('../controllers/homeController');

router.use('/', init);

router.get('/', showHome);

router.get('/logout', logout);

module.exports = router;