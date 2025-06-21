-- 插入用户
INSERT INTO Users (username, email, password_hash, role)
VALUES
('alice123', 'alice@example.com', 'hashed123', 'owner'),
('bobwalker', 'bob@example.com', 'hashed456', 'walker'),
('carol123', 'carol@example.com', 'hashed789', 'owner'),
('david456', 'david@example.com', 'hashed111', 'owner'),
('emily789', 'emily@example.com', 'hashed222', 'walker');

-- 插入狗
INSERT INTO Dogs (owner_id, name, size)
VALUES
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Max', 'medium'),
((SELECT user_id FROM Users WHERE username = 'carol123'), 'Bella', 'small'),
((SELECT user_id FROM Users WHERE username = 'carol123'), 'Rocky', 'large'),
((SELECT user_id FROM Users WHERE username = 'david456'), 'Coco', 'small'),
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Luna', 'medium');

-- 插入遛狗请求
INSERT INTO WalkRequests (dog_id, requested_time, duration_minutes, location, status)
VALUES
((SELECT dog_id FROM Dogs WHERE name = 'Max' AND owner_id = (SELECT user_id FROM Users WHERE username = 'alice123')), '2025-06-10 08:00:00', 30, 'Parklands', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Bella' AND owner_id = (SELECT user_id FROM Users WHERE username = 'carol123')), '2025-06-10 09:30:00', 45, 'Beachside Ave', 'accepted'),
((SELECT dog_id FROM Dogs WHERE name = 'Rocky'), '2025-06-11 10:00:00', 60, 'Hilltop Park', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Coco'), '2025-06-12 14:00:00', 40, 'Downtown Trail', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Luna'), '2025-06-13 16:30:00', 35, 'Green Park', 'open');