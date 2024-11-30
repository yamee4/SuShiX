const express = require('express');
const router = express.Router();

const {showPage} = require('../controllers/signinController');

router.get('/', showPage);

module.exports = router;