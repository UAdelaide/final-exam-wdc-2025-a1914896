const mysql = require('mysql2/promise');

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',  // ← 如果你有 MySQL 密码，填在这里
  database: 'DogwalkService'
});

module.exports = pool;