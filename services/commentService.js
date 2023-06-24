const commentDao = require("../models/commentDao");

const createComment = async (userId, postId, content, postTypes) => {
  const comment = await commentDao.createComment(
    userId,
    postId,
    content,
    postTypes
  );
  return comment;

};

const updateComment = async (userId, commentId, content) => {
  const comment = await commentDao.updateComment(userId, commentId, content);
  return comment;
};

const deleteComment = async (userId, commentId) => {
  await commentDao.deleteComment(userId, commentId);
};

const getCommentList = async (postId) => {
  const comments = await commentDao.getCommentList(postId);
  return comments;
};

module.exports = {
  createComment,
  updateComment,
  deleteComment,
  getCommentList,
  
};
