const { dataSource } = require("./dataSource");

const getUserById = async (userId) => {
  try {
    const [user] = await dataSource.query(
      `SELECT
      id,
      email,
      name,
      phone_number,
      kakao_id,
      point
      FROM users u
    WHERE id = ?
    `,[userId]
    );
    return user;
  } catch (err) {
    const error = new Error("INVALID_DATA_INPUT");
    error.statusCode = 400;
    throw error;
  }
};

const getUserByKakaoId = async (kakaoId) => {
  try {
    const [user] = await dataSource.query(
      `SELECT
        id,
        email,
        name
      FROM users
      WHERE kakao_id = ?
      `,[kakaoId]
    );
    return user;
  } catch (err) {
    const error = new Error("INVALID_DATA_INPUT");
    error.statusCode = 400;
    throw error;
  }
};

const createUser = async (kakaoId, email) => {
  try {
    await dataSource.query(
      `
      INSERT INTO
        users(
        kakao_id,
        email
        )VALUES (?, ?)
        `,
      [kakaoId, email]
    );
    const user = await dataSource.query(
      `
      SELECT * FROM
      users
      WHERE
      kakao_id = ?
      `,
      [kakaoId]
    );
    return user;
  } catch (err) {
    const error = new Error("INVALID_DATA_INPUT");
    error.statusCode = 400;
    throw error;
  }
};

const paymentUser = async (name, email) => {
  try {
    await dataSource.query(
      `
      INSERT INTO
      users(
        name,
        email
      )VALUES ( ?, ?)
      `,
      [name, email]
    );
  } catch (err) {
    const error = new Error("INVALID_DATA_INPUT");
    error.statusCode = 400;
    throw error;
  }
};

module.exports = {
  getUserById,
  getUserByKakaoId,
  createUser,
  paymentUser,
};
