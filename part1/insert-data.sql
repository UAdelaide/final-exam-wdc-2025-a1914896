-- 插入 5 个用户
INSERT INTO Users (username, email, password_hash, role)
VALUES
('alice123', 'alice@example.com', 'hashed123', 'owner'),
('bobwalker', 'bob@example.com', 'hashed456', 'walker'),
('carol123', 'carol@example.com', 'hashed789', 'owner'),
('daniel321', 'daniel@example.com', 'hashed654', 'walker'),
('fiona999', 'fiona@example.com', 'hashed321', 'owner');

-- 插入 5 条狗（Max 属于 alice123，Bella 属于 carol123，其余你自定义）
INSERT INTO Dogs (owner_id, name, size)
VALUES
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Max', 'medium'),
((SELECT user_id FROM Users WHERE username = 'carol123'), 'Bella', 'small'),
((SELECT user_id FROM Users WHERE username = 'fiona999'), 'Charlie', 'large'),
((SELECT user_id FROM Users WHERE username = 'daniel321'), 'Buddy', 'medium'),
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Milo', 'small');

-- 插入 5 条遛狗请求（两条题目指定的 + 三条自定义）
INSERT INTO WalkRequests (dog_id, requested_time, duration_minutes, location, status)
VALUES
((SELECT dog_id FROM Dogs WHERE name = 'Max' AND owner_id = (SELECT user_id FROM Users WHERE username = 'alice123')), '2025-06-10 08:00:00', 30, 'Parklands', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Bella' AND owner_id = (SELECT user_id FROM Users WHERE username = 'carol123')), '2025-06-10 09:30:00', 45, 'Beachside Ave', 'accepted'),
((SELECT dog_id FROM Dogs WHERE name = 'Charlie'), '2025-06-11 11:00:00', 60, 'Sunny Street', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Buddy'), '2025-06-12 10:15:00', 40, 'Lakeview Trail', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Milo'), '2025-06-13 13:30:00', 35, 'Eastside Garden', 'open');
