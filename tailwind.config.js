const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/views/**/*.{erb,haml,html,slim}',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        primary: colors.emerald,
      }
    },
  },
  plugins: [],
  safelist: [
    {
      pattern: /(bg|text|border)-emerald-(50|100|200|300|400|500|600|700|800|900|950)/,
    }
  ]
} 