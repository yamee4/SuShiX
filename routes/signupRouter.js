const express = require('express');
const router = express.Router();

const {showPage} = require('../controllers/signupController');

router.get('/', showPage);

module.exports = router;