const userService = require('../services/userService');
const { catchAsync } = require('../middleware/error');

const signInKakao = catchAsync(async (req,res) => {
    const { kakaoToken } = req.body;

    if(!kakaoToken) throw new Error(401, 'need_kakaotoken');

    const { accessToken } = await userService.signInKakao(kakaoToken);

    return res.status(200).json({token: accessToken});
});

module.exports = {
    signInKakao,

};