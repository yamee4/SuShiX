const express = require('express');
const router = express.Router();

const {showPage} = require('../controllers/signinController');

router.get('/', showPage);
router.post('/', (req, res) => {
    res.send('Sign in');
});

module.exports = router;