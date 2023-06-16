const express = require("express");
const cors = require("cors");
const morgan = require("morgan");

const routers = require("./routes");
const { globalErrorHandler } = require("./middleware/error");

const createApp = () => {
  const app = express();

  app.use(cors());
  app.use(morgan("dev"));
  app.use(express.json());

  app.use(routers);
  app.use(globalErrorHandler);

  app.get("/ping", (req, res) => {
    res.json({ message: "pong" });
  });

  return app;
};

module.exports = { createApp };
