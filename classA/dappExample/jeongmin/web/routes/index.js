const express = require('express');
const router = express.Router();


// 3. index page 열기
router.get('/', function(req, res, next) {
    res.render('../views/index.ejs');
});
  
module.exports = router;