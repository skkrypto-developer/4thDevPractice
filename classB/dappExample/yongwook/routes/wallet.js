const express = require('express');
const router = express.Router();

// 4. wallet page 열기
router.get('/', (req, res)=> {
    res.render('wallet.ejs');
})
module.exports = router;