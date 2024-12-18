const express = require('express');
const router = express.Router();

const {showPage, signIn} = require('../controllers/signinController');

router.get('/', showPage);
router.post('/', signIn);

module.exports = router;