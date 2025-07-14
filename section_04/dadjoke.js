// joke.js

const axios = require("axios");

axios("https://icanhazdadjoke.com", {
  headers: { Accept: "text/plain" }
})
  .then(response => {
    console.log(response.data);
  })
  .catch(error => {
    console.error("Error fetching joke:", error.message);
    process.exit(1);
  });


