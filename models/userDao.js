const dataSource = require("./dataSource");

const getUserByIdDao = async (userId) => {
  try {
    const [user] = await dataSource.query(
      `SELECT id, email, name, phone_number, grad_id, kakao_id, point FROM users u WHERE id = ?`,
      [userId]
    );
    return user;
  } catch (err) {
    const error = new Error("INVALID_DATA_INPUT");
    error.statusCode = 400;
    throw error;
  }
};

const getUserByKakaoIdDao = async (kakaoId) => {
  try {
    const [user] = await dataSource.query(
      `SELECT id, email, user_name FROM users WHERE kakao_id  = ?`,
      [kakaoId]
    );
    return user;
  } catch (err) {
    throw new DatabaseError("DataSource_Error");
  }
};

const createUserDao = async (kakaoId, userName, email) => {
  try {
    await dataSource.query(
      `INSERT INTO users(kakao_id, user_name, email)VALUES (?, ?, ?)`,
      [kakaoId, userName, email]
    );
    const user = await dataSource.query(
      `SELECT * FROM users WHERE kakao_id = ?`,
      [kakaoId]
    );
    return user;
  } catch (err) {
    throw new DatabaseError("DataSource_Error: " + err.message);
  }
};

module.exports = {
  getUserByIdDao,
  getUserByKakaoIdDao,
  createUserDao,

};
