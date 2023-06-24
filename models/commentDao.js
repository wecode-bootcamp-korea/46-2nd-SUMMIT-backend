const { dataSource } = require('./dataSource');

const createComment = async (userId, postId, content, postTypes) => {
  try {
    const result = await dataSource.query(
      `
      INSERT INTO post_comments(
        user_id,
        post_id,
        content,
        post_type_id
        )VALUES (?, ?, ?, ?)
      `,
      [userId, postId, content, postTypes]
    );
    return result;
  } catch (err) {
    const error = new Error('INVALID_DATA_INPUT');
    error.statusCode = 400;
    throw error;
  }
};

const updateComment = async (userId, commentId, content) => {
  try {
    const result = await dataSource.query(
      `
      UPDATE
      post_comments
      SET content = ?
      WHERE id = ?
      AND user_id = ?
      `,
      [content, commentId, userId]
    );
    return result;
  } catch (err) {
    const error = new Error('INVALID_DATA_INPUT');
    error.statusCode = 400;
    throw error;
  }
};

const deleteComment = async (userId, commentId) => {
  try {
    const result = await dataSource.query(
      `
      DELETE FROM post_comments
      WHERE id = ? AND user_id = ?
      `,
      [commentId, userId]
    );
    return result;
  } catch (err) {
    const error = new Error('INVALID_DATA_INPUT');
    error.statusCode = 400;
    throw error;
  }
};

const getCommentList = async (postId) => {
  try {
    const result = await dataSource.query(
      `
      SELECT *
      FROM post_comments
      WHERE post_id = ?
      `,
      [postId]
    );
    return result;
  } catch (err) {
    const error = new Error('INVALID_DATA_INPUT');
    error.statusCode = 400;
    throw error;
  }
};

module.exports = {
  createComment,
  updateComment,
  deleteComment,
  getCommentList
};
