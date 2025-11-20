const express = require('express');
const app = express();
const PORT = 8080;

app.get('/', (req, res) => {
  res.send('Helló DevOps! Üdv a Node.js + Express alkalmazásból!');
});

app.get('/version', (req, res) => {
  res.send('App version 1.0.1');
});

app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`);
});
