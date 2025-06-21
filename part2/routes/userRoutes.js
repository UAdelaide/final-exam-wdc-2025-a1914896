const express = require('express');
const router = express.Router();
const pool = require('../models/db');

// 登录路由
router.post('/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    const [rows] = await pool.query(
      'SELECT * FROM Users WHERE username = ? AND password_hash = ?',
      [username, password]
    );

    if (rows.length === 1) {
      const user = rows[0];
      req.session.user = {
        user_id: user.user_id,
        username: user.username,
        role: user.role
      };
      res.json({ success: true, role: user.role });
    } else {
      res.status(401).json({ success: false, message: 'Invalid credentials' });
    }
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;
