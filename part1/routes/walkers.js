const express = require('express');
const router = express.Router();
const db = require('../db');

// GET /api/walkers/summary
router.get('/summary', async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT Walkers.username, COUNT(*) AS total_walks
      FROM Walks
      JOIN Walkers ON Walks.walker_id = Walkers.walker_id
      GROUP BY Walks.walker_id
    `);
    res.json(rows);
  } catch (err) {
    console.error('Error fetching walker summary:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
