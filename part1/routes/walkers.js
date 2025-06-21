const express = require('express');
const router = express.Router();
const db = require('../db');

router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT u.username AS walker_username,
             0 AS total_ratings,
             NULL AS average_rating,
             0 AS completed_walks
      FROM Users u
      WHERE u.role = 'walker'
    `);
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: 'Database error' });
  }
});

module.exports = router;