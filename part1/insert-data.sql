-- insert-data.sql

-- 1. 插入用户
INSERT INTO Users (username, email, password_hash, role) VALUES
('alice123', 'alice@example.com', 'hashed123', 'owner'),
('bobwalker', 'bob@example.com', 'hashed456', 'walker'),
('carol123', 'carol@example.com', 'hashed789', 'owner'),
('david456', 'david@example.com', 'hashed000', 'walker'),
('emily789', 'emily@example.com', 'hashed999', 'owner');

-- 2. 插入狗狗
INSERT INTO Dogs (owner_id, name, size) VALUES
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Max', 'medium'),
((SELECT user_id FROM Users WHERE username = 'carol123'), 'Bella', 'small'),
((SELECT user_id FROM Users WHERE username = 'emily789'), 'Rocky', 'large'),
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Buddy', 'small'),
((SELECT user_id FROM Users WHERE username = 'carol123'), 'Luna', 'medium');

-- 3. 插入 WalkRequests
INSERT INTO WalkRequests (dog_id, requested_time, duration_minutes, location, status) VALUES
((SELECT dog_id FROM Dogs WHERE name = 'Max'), '2025-06-10 08:00:00', 30, 'Parklands', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Bella'), '2025-06-10 09:30:00', 45, 'Beachside Ave', 'accepted'),
((SELECT dog_id FROM Dogs WHERE name = 'Rocky'), '2025-06-11 10:00:00', 60, 'City Park', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Buddy'), '2025-06-12 14:00:00', 25, 'River Walk', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Luna'), '2025-06-13 11:30:00', 40, 'East Oval', 'cancelled');
