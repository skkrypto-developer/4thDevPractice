const express = require('express');
const router = express.Router();

// 4. wallet page 열기
router.get('/', function(req, res) {
    res.render('../views/wallet.ejs');
});

module.exports = router;