const express = require('express');
const router = express.Router();
const db = require('../db'); // 引入数据库连接

// GET /api/walkrequests/open
router.get('/open', async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT
        WalkRequests.request_id,
        WalkRequests.dog_id,
        WalkRequests.request_time,
        Owners.username AS owner_username
      FROM WalkRequests
      JOIN Owners ON WalkRequests.owner_id = Owners.owner_id
      WHERE WalkRequests.status = 'open'
    `);
    res.json(rows);
  } catch (err) {
    console.error('Error fetching open walk requests:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;


