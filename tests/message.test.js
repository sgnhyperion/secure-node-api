import request from "supertest";
import app from "../src/app.js";

test("GET /api/message returns message", async () => {
  const res = await request(app).get("/api/message");

  expect(res.statusCode).toBe(200);
  expect(res.body.message).toBe("Hello from secure node api!!");
});
