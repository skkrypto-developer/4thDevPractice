const express = require('express');
const router = express.Router();

// 3. index page 열기
router.get('/', function(req, res) {
    res.render('../views/index.ejs');
});

module.exports = router;