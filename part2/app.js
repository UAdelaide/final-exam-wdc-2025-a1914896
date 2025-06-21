const express = require('express');
const session = require('express-session');
const path = require('path');
const userRoutes = require('./routes/userRoutes');

const app = express();
const PORT = 8080;

// 添加中间件
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// 设置 session
app.use(session({
  secret: 'mySecretKey',
  resave: false,
  saveUninitialized: true
}));

// 路由
app.use('/api/users', userRoutes);

// 默认页面
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public/index.html'));
});

app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`);
});
