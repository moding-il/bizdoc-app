const PROXY_CONFIG = [
  {
    context: [
      '/api'
    ],
    target: "https://localhost:7134",
    secure: false
  }
]

module.exports = PROXY_CONFIG;
