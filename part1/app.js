const express = require('express');
const app = express();
const dogsRouter = require('./routes/dogs');
const db = require('./db'); // 假设你已经有 db.js 连接池文件

app.use(express.json());
app.use('/api/dogs', dogsRouter);

// 启动服务器
const PORT = 8080;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
