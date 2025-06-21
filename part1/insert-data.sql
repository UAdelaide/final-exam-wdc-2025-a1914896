
INSERT INTO Users (username, email, password_hash, role)
VALUES
('alice123', 'alice@example.com', 'hashed123', 'owner'),
('bobwalker', 'bob@example.com', 'hashed456', 'walker'),
('carol123', 'carol@example.com', 'hashed789', 'owner'),
('lucy2025', 'lucy@example.com', 'hashed987', 'walker'),
('jamesX', 'jamesx@example.com', 'hashed654', 'owner');


INSERT INTO Dogs (owner_id, name, size)
VALUES
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Max', 'medium'),
((SELECT user_id FROM Users WHERE username = 'carol123'), 'Bella', 'small'),
((SELECT user_id FROM Users WHERE username = 'jamesX'), 'Buddy', 'large'),
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Daisy', 'small'),
((SELECT user_id FROM Users WHERE username = 'lucy2025'), 'Shadow', 'medium');


INSERT INTO WalkRequests (dog_id, requested_time, duration_minutes, location, status)
VALUES
((SELECT dog_id FROM Dogs WHERE name = 'Max' AND owner_id = (SELECT user_id FROM Users WHERE username = 'alice123')),
 '2025-06-10 08:00:00', 30, 'Parklands', 'open'),

((SELECT dog_id FROM Dogs WHERE name = 'Bella' AND owner_id = (SELECT user_id FROM Users WHERE username = 'carol123')),
 '2025-06-10 09:30:00', 45, 'Beachside Ave', 'accepted'),

((SELECT dog_id FROM Dogs WHERE name = 'Buddy'),
 '2025-06-11 10:15:00', 60, 'Glenelg Park', 'open'),

((SELECT dog_id FROM Dogs WHERE name = 'Daisy'),
 '2025-06-12 13:00:00', 40, 'Riverside Walk', 'open'),

((SELECT dog_id FROM Dogs WHERE name = 'Shadow'),
 '2025-06-13 16:45:00', 25, 'Hillside Track', 'pending');
