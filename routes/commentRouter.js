const express = require('express');
const { checkLogInToken } = require("../middlewares/auth");
const commentController = require("../controllers/commentComtroller")
const router = express.Router();

router.post('/', checkLogInToken, commentController.createComment);
router.put('/put/:commentId', checkLogInToken, commentController.updateComment);
router.delete('/delete/:commentId', checkLogInToken, commentController.deleteComment);
router.get('/:postId', commentController.getCommentList);

module.exports = { router };
