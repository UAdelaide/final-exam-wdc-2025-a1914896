const express = require('express');
const router = express.Router();
const db = require('../db');

// GET /api/walkrequests/open
router.get('/open', async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT wr.id AS request_id, d.name AS dog_name, wr.requested_time,
             wr.duration_minutes, wr.location, u.username AS owner_username
      FROM walk_requests wr
      JOIN dogs d ON wr.dog_id = d.id
      JOIN users u ON d.owner_id = u.id
      WHERE wr.status = 'open'
    `);
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to fetch open walk requests' });
  }
});

module.exports = router;

