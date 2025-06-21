const express = require('express');
const app = express();

// 引入数据库连接池
const db = require('./db');

// 引入各个路由模块
const dogsRouter = require('./routes/dogs');
const walkRequestsRouter = require('./routes/walkrequests');
const walkerSummaryRouter = require('./routes/walkers'); // ✅ 第8题需要的路由

// 让 express 能处理 JSON 请求体
app.use(express.json());

// 使用路由
app.use('/api/dogs', dogsRouter); // 已完成的狗狗数据路由
app.use('/api/walkrequests', walkRequestsRouter); // 第7题：开放请求路由
app.use('/api/walkers', walkerSummaryRouter); // 第8题：summary 路由

// 启动服务器
const PORT = 8080;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

