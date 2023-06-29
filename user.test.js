const request = require("supertest");
const axios = require("axios");
const { createApp } = require("../46-2nd-SUMMIT-backend/app");
const { dataSource } = require("../46-2nd-SUMMIT-backend/models/dataSource");
jest.mock("axios");

describe("kakao signin", () => {
  let app;
  let kakaoToken = "pv9XYpx_EG3q8G5DlKKC_aolZBZWZnPtXDsjbStuCisNHwAAAYkFZJQB";

beforeAll(async () => {
    app = createApp();
    await dataSource.initialize();
  });

  afterAll(async () => {
    app = createApp();
    await dataSource.query(`SET foreign_key_checks = 0`);
    await dataSource.query(`TRUNCATE users`);
    await dataSource.query(`SET foreign_key_checks = 1`);
    await dataSource.destroy();
  });
  // test("SUCCESS: kakao signin", async () => {
  //   axios.get = jest.fn().mockReturnValue({
  //     data: {
  //       id: 1351615615,
  //       connected_at: "2022-08-30T14:41:02Z",
  //       properties: {
  //         nickname: "위코딩",
  //         profile_image: "~~~",
  //         thumbnail_image: "!!!!",
  //       },
  //       kakao_account: {
  //         profile_nickname_needs_agreement: false,
  //         profile_image_needs_agreement: false,
  //         profile: [Object],
  //         has_email: true,
  //         email_needs_agreement: false,
  //         is_email_valid: true,
  //         is_email_verified: true,
  //         email: "unit@hanmail.net",
  //         has_age_range: true,
  //         age_range_needs_agreement: false,
  //         age_range: "30~39",
  //         has_gender: true,
  //         gender_needs_agreement: false,
  //         gender: "male",
  //       },
  //     },
  //     status: 200,
  //   });
  //   const res = await request(app)
  //     .post("/users/kakao-login")
  //     .set("Authorization", `Bearer ${kakaoToken}`)
  //     .expect(200);
  //   // expect(res.body).toHaveProperty("accessToken");
  // });

  test('🚀 SUCCESS: create User', async () => {
    const response = {
      status: 200,
      data: {
        id: '123456',
        properties: {
          nickname: '테스트',
          profile_image: 'http://chill_play.com',
        },
        kakao_account: {
          email: 'test@test.com',
          birthday: '0923',
          gender: 'male',
          age_range: '10~19',
        },
      },
    };

    axios.get = jest.fn().mockReturnValue(response);

    const res = await request(app).post('/users/kakao-login').send({
      Authorization: 'kakaoAccessToken',
    });
    
    console.log(res.body, 123123123)
    
    await expect(res.statusCode).toEqual(200);
  }); 

  test("FAILED: kakaoToken not exist", async () => {
    axios.get = jest.fn().mockReturnValue({
      data: {
        id: 1351615615,
        connected_at: "2022-08-30T14:41:02Z",
        properties: {
          nickname: "위코딩",
          profile_image: "~~~",
          thumbnail_image: "!!!!",
        },
        kakao_account: {
          profile_nickname_needs_agreement: false,
          profile_image_needs_agreement: false,
          profile: [Object],
          has_email: true,
          email_needs_agreement: false,
          is_email_valid: true,
          is_email_verified: true,
          email: "unit@hanmail.net",
          has_age_range: true,
          age_range_needs_agreement: false,
          age_range: "30~39",
          has_gender: true,
          gender_needs_agreement: false,
          gender: "male",
        },
      },
    });
    return await request(app).post("/users/kakao-login").expect(400);
  });
});
