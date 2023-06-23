const express = require("express");

const userRouter = require("./userRouter");
const showRouter = require("./showRouter");
const wishRouter = require("./wishRouter");

const router = express.Router();

router.use("/users", userRouter.router);
router.use("/shows", showRouter.router);
router.use("/wishs", wishRouter.router);

module.exports = router;
