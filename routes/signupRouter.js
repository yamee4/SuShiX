const express = require('express');
const router = express.Router();

const {showPage, signUp} = require('../controllers/signupController');

router.get('/', showPage);
router.post('/', signUp);

module.exports = router;