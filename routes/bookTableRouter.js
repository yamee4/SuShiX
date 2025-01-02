const express = require('express');
const router = express.Router();

const{showForm, bookTable, init} = require('../controllers/bookTableController');

router.use('/', init);

router.get('/', showForm);

router.post('/', bookTable);

module.exports = router;