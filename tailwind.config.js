let cjkFallback = [
  "Noto Sans CJK TC",
  "Microsoft Jhenghei",
  "Microsoft Yahei",
  "Meiryo",
  "Malgun Gothic",
];

module.exports = {
  purge: {
    content: ["./layouts/**/*.html", "./content/**/*"],
  },
  mode: "jit",
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      sans: ["Inter", ...cjkFallback, "sans-serif"],
      // serif: ["Equity"],
      mono: ["Noto Sans Mono CJK", ...cjkFallback, "monospace"],
    },
    extend: {
      colors: {
        inherit: "inherit",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
