const jwt = require("jsonwebtoken");
const { catchAsync } = require('../middleware/error')


const checkLogInToken = async (req, res, next) => {
  try {
    const accessToken = req.headers.authorization;
    const secretKey = process.env.SECRET_KEY;

    if (!accessToken) {
      const error = new Error("NEED_ACCESS_TOKEN", 401);
      return res.status(error.statusCode).json({ message: error.message });
    }

    const decoded = jwt.verify(accessToken, secretKey);

    const user = await userDao.getUserById(decoded.id);

    if (!user) {
      const error = new BaseError("INVALID_USER", 401);
      return res.status(error.statusCode).json({ message: error.message });
    }

    req.user = user;
    next();
  } catch (err) {
    return res.status(401).json({
      message: "INVALID_TOKEN",
    });
  }
};

module.exports = {
  checkLogInToken,
};
