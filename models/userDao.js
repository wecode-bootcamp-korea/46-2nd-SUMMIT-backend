const dataSource = require('./dataSource')

const getUserByIdDao = async(userId) => {
    try {
        const [user] = await dataSource.query(
            `
            SELECT
            id,
            email,
            name,
            phone_number,
            grad_id,
            kakao_id,
            point
            FROM users u
            WHERE id = ?
            `,
            [userId]
        )
        return user;
    } catch(err) {
        const error = new Error('INVALID_DATA_INPUT')
        error.statusCode = 400
        throw error
    }
}

module.exports = {
    getUserByIdDao,
    
}