import js from "@eslint/js";
import jest from "eslint-plugin-jest";

export default [
  // Base recommended rules
  js.configs.recommended,

  // Node.js environment for source code
  {
    files: ["src/**/*.js"],
    languageOptions: {
      globals: {
        console: "readonly",
        process: "readonly",
      },
    },
  },

  // Jest environment for test files
  {
    files: ["**/*.test.js"],
    plugins: {
      jest,
    },
    languageOptions: {
      globals: {
        test: "readonly",
        expect: "readonly",
        describe: "readonly",
      },
    },
    rules: {
      "no-undef": "off",
    },
  },
];
