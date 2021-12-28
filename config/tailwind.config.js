const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        trap: ['Trap']
      },
      colors: {
        'off-black': '#685A4D',
        'polaroid-dark': '#BFBFBF',
        'generic-blue': '#0000FF',
        'generic-yellow': '#FFFF00',
        'black-2F': '#2F2F2F'

      },
      margin: {
        'nav': '37rem',
        'nav-project': '36rem'
      },
      top: {
        'far': '36rem',
      },
      maxWidth: {
        'xxs': '14rem',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
