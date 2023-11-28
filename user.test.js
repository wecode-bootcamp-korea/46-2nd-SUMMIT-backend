const request = require("supertest");
const axios = require("axios");
const { createApp } = require("../46-2nd-SUMMIT-backend/app");
const { dataSource } = require("../46-2nd-SUMMIT-backend/models/dataSource");
jest.mock("axios");

describe("/users/kakao-login", () => {
  let app;
  let kakaoToken = "kakao_token";

  beforeAll(async () => {
    app = createApp();
    await dataSource.initialize();
  });

  afterAll(async () => {
    await dataSource.query(`SET foreign_key_checks = 0`);
    await dataSource.query(`TRUNCATE users`);
    await dataSource.query(`SET foreign_key_checks = 1`);
    await dataSource.destroy();
  });

  test("SUCCESS: kakao signin", async () => {
    axios.get = jest.fn().mockResolvedValueOnce({
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
          profile: {},
          has_email: true,
          email_needs_agreement: false,
          is_email_valid: true,
          is_email_verified: true,
          email: "unit@hanmail.net",
        },
      },
      status: 200,
    });
    const res = await request(
      app.use((err, __, ___, next) => {
        console.error(err.stack);
        next(err);
      })
    )
      .post("/users/kakao-login")
      .set("Authorization", `Bearer ${kakaoToken}`)
      .expect(200);
  });

  test("FAILED: kakaoToken does not exist", async () => {
    axios.get = jest.fn().mockResolvedValueOnce({
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
          profile: {},
          has_email: true,
          email_needs_agreement: false,
          is_email_valid: true,
          is_email_verified: true,
          email: "unit@hanmail.net",
        },
      },
      status: 200,
    });

    await request(app).post("/users/kakao-login").expect(401);
  });
});
