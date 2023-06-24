const commentService = require("../services/commentService");
const { catchAsync } = require("../middlewares/error");

const createComment = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const { postId, content, postTypes } = req.body;
  const comment = await commentService.createComment(
    userId,
    postId,
    content,
    postTypes
  );
  return res
    .status(201)
    .json({ message: "Comment created successfully", comment });
});

const updateComment = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const { commentId } = req.params;
  const { content } = req.body;
  const comment = await commentService.updateComment(
    userId,
    commentId,
    content
  );
  return res
    .status(200)
    .json({ message: "Comment updated successfully", comment });
});

const getCommentsByPostId = catchAsync(async (req, res) => {
  const { postId } = req.params;
  const comments = await commentService.getCommentsByPostId(postId);
  return res.status(200).json(comments);
});

const deleteComment = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const { commentId } = req.params;
  await commentService.deleteComment(userId, commentId);
  return res.status(204).json({ message: "Comment deleted successfully" });
});

const getCommentList = catchAsync(async (req, res) => {
  const { postId } = req.params;
  const comments = await commentService.getCommentList(postId);
  return res.status(200).json(comments);
});

module.exports = {
  createComment,
  updateComment,
  deleteComment,
  getCommentsByPostId,
  getCommentList,

};
