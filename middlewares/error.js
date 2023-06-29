const catchAsync = (func) => {
  return (req, res, next) => {
    func(req, res, next).catch((error) => next(error));
  };
};

const globalErrorHandler = (err, req, res, next) => {
  return res.status(err.statusCode || 500).json({ message: err.message });
};

module.exports = {
  catchAsync,
  globalErrorHandler,
};
