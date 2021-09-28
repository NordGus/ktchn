// const colors = require('tailwindcss/colors')
const plugin = require('tailwindcss/plugin')

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
      plugin(({addBase, theme }) => {
        addBase({
          'h1': { fontSize: theme('fontSize.2xl') },
          'h2': { fontSize: theme('fontSize.xl') },
          'h3': { fontSize: theme('fontSize.lg') },
        })
      })
  ],
}
