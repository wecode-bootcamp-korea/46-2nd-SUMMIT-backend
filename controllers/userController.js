
const userService = require('../services/userService');
const { catchAsync } = require('../middlewares/error');

const signInKakao = catchAsync(async (req,res) => {

    const kakaoToken = req.headers.authorization;

    if (!kakaoToken) throw new Error(401, 'need_kakaotoken');

    const { accessToken } = await userService.signInKakao(kakaoToken);

    return res.status(200).json({ token: accessToken });
});

const getUserById = catchAsync(async (req, res) => {
    const userId = req.user.id;
    const userInfo = await userService.getUserById(userId);
  
    return res.status(200).json(userInfo);
  });

const paymentUser = catchAsync(async (req, res) => {
    const { name, email } = req.body;
    await userService.paymentUser(name, email);
    res.status(200).json({ message: "User Successful" });
});
  
module.exports = {
    signInKakao,
    getUserById,
    paymentUser
};