const express = require('express');
const app = express();
const dogsRouter = require('./routes/dogs');
const walkRequestsRouter = require('./routes/walkrequests');
const db = require('./db');

app.use(express.json());

app.use('/api/dogs', dogsRouter);
app.use('/api/walkrequests', walkRequestsRouter); // 👈 加上这一行

const PORT = 8080;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

