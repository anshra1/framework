module.exports = {
  root: true,
  env: {
    es6: true,
    node: true,
  },
  extends: [
    "eslint:recommended",
    "google", // Or your preferred style guide
  ],
  rules: {
    "indent": ["error", 2], // Enforce 2-space indentation
    "quotes": ["error", "double"], // Enforce double quotes
    "eol-last": ["error", "always"], // Require newline at end of file
  },
};
