USE crickstatz;

-- ----------------------------------------------------------------
-- 1) Teams (10 IPL teams) - explicit team_id so we can reference
-- ----------------------------------------------------------------
INSERT INTO teams (team_id, name, captain, coach, home_ground) VALUES
(1, 'Chennai Super Kings', 'MS Dhoni', 'Stephen Fleming', 'MA Chidambaram Stadium, Chennai'),
(2, 'Delhi Capitals', 'Rishabh Pant', 'David Warner', 'Arun Jaitley Stadium, Delhi'),
(3, 'Gujarat Titans', 'Hardik Pandya', 'Ashish Nehra', 'Narendra Modi Stadium, Ahmedabad'),
(4, 'Kolkata Knight Riders', 'Shreyas Iyer', 'Abhishek Nayar', 'Eden Gardens, Kolkata'),
(5, 'Lucknow Super Giants', 'KL Rahul', 'Justin Langer', 'BRSABV Ekana Cricket Stadium, Lucknow'),
(6, 'Mumbai Indians', 'Rohit Sharma', 'Mark Boucher', 'Wankhede Stadium, Mumbai'),
(7, 'Punjab Kings', 'Sam Curran', 'Trevor Bayliss', 'Punjab Cricket Association IS Bindra Stadium, Mohali'),
(8, 'Rajasthan Royals', 'Sanju Samson', 'Kumar Sangakkara', 'Sawai Mansingh Stadium, Jaipur'),
(9, 'Royal Challengers Bangalore', 'Faf du Plessis', 'Sanath Jayasuriya', 'M Chinnaswamy Stadium, Bangalore'),
(10,'Sunrisers Hyderabad', 'Aiden Markram', 'Trevor Bayliss', 'Rajiv Gandhi Intl. Cricket Stadium, Hyderabad');

-- ----------------------------------------------------------------
-- 2) Venues
-- ----------------------------------------------------------------
INSERT INTO venues (venue_id, name, location, capacity) VALUES
(1, 'MA Chidambaram Stadium', 'Chennai', 38000),
(2, 'Arun Jaitley Stadium', 'Delhi', 41000),
(3, 'Narendra Modi Stadium', 'Ahmedabad', 132000),
(4, 'Eden Gardens', 'Kolkata', 68000),
(5, 'Ekana Stadium', 'Lucknow', 50000),
(6, 'Wankhede Stadium', 'Mumbai', 33000),
(7, 'M Chinnaswamy Stadium', 'Bangalore', 35000),
(8, 'Rajiv Gandhi Intl. Cricket Stadium', 'Hyderabad', 55000);

-- ----------------------------------------------------------------
-- 3) Umpires
-- ----------------------------------------------------------------
INSERT INTO umpires (umpire_id, name, experience) VALUES
(1, 'Kumar Dharmasena', 18),
(2, 'Aleem Dar', 22),
(3, 'Richard Kettleborough', 15),
(4, 'Marais Erasmus', 14),
(5, 'Michael Gough', 12),
(6, 'Paul Reiffel', 20),
(7, 'Nitin Menon', 8),
(8, 'K. N. Anantha', 10);

-- ----------------------------------------------------------------
-- 4) Players (150 players) - assigned player_id 1..150
--    15 players per team (team assignment via team_players below)
-- ----------------------------------------------------------------
INSERT INTO players (player_id, name, age, role, batting_style, bowling_style) VALUES
-- Team 1: Chennai Super Kings (players 1-15)
(1, 'MS Dhoni', 43, 'Wicketkeeper', 'Right-hand bat', 'Right-arm medium'),
(2, 'Ruturaj Gaikwad', 27, 'Batsman', 'Right-hand bat', ''),
(3, 'Devon Conway', 31, 'Batsman', 'Left-hand bat', ''),
(4, 'Ajinkya Rahane', 35, 'Batsman', 'Right-hand bat', ''),
(5, 'Moeen Ali', 36, 'All-rounder', 'Left-hand bat', 'Off break'),
(6, 'Simarjeet Singh', 26, 'Bowler', 'Right-hand bat', 'Right-arm medium-fast'),
(7, 'Maheesh Theekshana', 25, 'Bowler', 'Right-hand bat', 'Right-arm off-break'),
(8, 'Matheesha Pathirana', 22, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(9, 'Daryl Mitchell', 31, 'All-rounder', 'Right-hand bat', 'Right-arm medium'),
(10, 'Subhranshu Senapati', 28, 'Batsman', 'Right-hand bat', ''),
(11, 'Ravindra Jadeja', 36, 'All-rounder', 'Left-hand bat', 'Left-arm orthodox'),
(12, 'Bhagath Varma', 25, 'Bowler', 'Right-hand bat', 'Left-arm orthodox'),
(13, 'Shivam Dube', 30, 'All-rounder', 'Left-hand bat', 'Right-arm medium-fast'),
(14, 'Simranjeet Singh', 24, 'Bowler', 'Right-hand bat', 'Right-arm medium-fast'),
(15, 'Sai Kishore', 27, 'Bowler', 'Left-hand bat', 'Left-arm orthodox'),

-- Team 2: Delhi Capitals (players 16-30)
(16, 'Rishabh Pant', 26, 'Wicketkeeper', 'Left-hand bat', 'Right-arm medium'),
(17, 'Prithvi Shaw', 24, 'Batsman', 'Right-hand bat', ''),
(18, 'David Warner', 38, 'Batsman', 'Left-hand bat', ''),
(19, 'Kuldeep Yadav', 29, 'Bowler', 'Left-hand bat', 'Left-arm chinaman'),
(20, 'Rovman Powell', 31, 'All-rounder', 'Right-hand bat', 'Right-arm medium'),
(21, 'Anrich Nortje', 30, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(22, 'Axar Patel', 30, 'All-rounder', 'Left-hand bat', 'Left-arm orthodox'),
(23, 'Kagiso Rabada', 29, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(24, 'David Willey', 34, 'All-rounder', 'Left-hand bat', 'Left-arm fast-medium'),
(25, 'Mustafizur Rahman', 29, 'Bowler', 'Left-hand bat', 'Left-arm fast-medium'),
(26, 'Naman Dhir', 25, 'Batsman', 'Right-hand bat', ''),
(27, 'Manish Pandey', 35, 'Batsman', 'Right-hand bat', ''),
(28, 'Yash Dhull', 21, 'Batsman', 'Right-hand bat', ''),
(29, 'Ravi Bishnoi', 23, 'Bowler', 'Right-hand bat', 'Leg break'),
(30, 'Tim Southee', 35, 'Bowler', 'Right-hand bat', 'Right-arm fast-medium'),

-- Team 3: Gujarat Titans (players 31-45)
(31, 'Hardik Pandya', 31, 'All-rounder', 'Right-hand bat', 'Right-arm medium-fast'),
(32, 'Shubman Gill', 25, 'Batsman', 'Right-hand bat', ''),
(33, 'Wriddhiman Saha', 38, 'Wicketkeeper', 'Right-hand bat', ''),
(34, 'Rashid Khan', 26, 'Bowler', 'Right-hand bat', 'Leg break'),
(35, 'Mohammed Shami', 33, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(36, 'Rahul Tewatia', 31, 'All-rounder', 'Left-hand bat', 'Right-arm leg-break'),
(37, 'Sai Sudharsan', 21, 'Batsman', 'Left-hand bat', ''),
(38, 'Yash Dayal', 27, 'Bowler', 'Right-hand bat', 'Right-arm fast-medium'),
(39, 'Darshan Nalkande', 26, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(40, 'Matthew Wade', 36, 'Wicketkeeper', 'Right-hand bat', ''),
(41, 'Rovman Powell', 31, 'All-rounder', 'Right-hand bat', 'Right-arm medium'),
(42, 'Alzarri Joseph', 29, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(43, 'David Miller', 36, 'Batsman', 'Left-hand bat', ''),
(44, 'Shahrukh Khan', 26, 'All-rounder', 'Right-hand bat', 'Left-arm orthodox'),
(45, 'Mohit Sharma', 33, 'Bowler', 'Right-hand bat', 'Right-arm medium-fast'),

-- Team 4: Kolkata Knight Riders (players 46-60)
(46, 'Shreyas Iyer', 29, 'Batsman', 'Right-hand bat', ''),
(47, 'Venkatesh Iyer', 28, 'All-rounder', 'Left-hand bat', 'Right-arm medium'),
(48, 'Andre Russell', 36, 'All-rounder', 'Right-hand bat', 'Right-arm fast'),
(49, 'Sunil Narine', 34, 'All-rounder', 'Left-hand bat', 'Off break'),
(50, 'Nitish Rana', 30, 'Batsman', 'Left-hand bat', 'Right-arm off-break'),
(51, 'Varun Chakravarthy', 31, 'Bowler', 'Right-hand bat', 'Right-arm leg-break'),
(52, 'Harshit Rana', 24, 'Bowler', 'Right-hand bat', 'Right-arm fast-medium'),
(53, 'Lockie Ferguson', 33, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(54, 'Rinku Singh', 28, 'Batsman', 'Left-hand bat', ''),
(55, 'Rakesh Babu', 25, 'All-rounder', 'Right-hand bat', 'Right-arm medium'),
(56, 'Shivam Mavi', 26, 'Bowler', 'Right-hand bat', 'Right-arm fast-medium'),
(57, 'Ajinkya Rahane', 35, 'Batsman', 'Right-hand bat', ''), -- duplicated name appears in CSK earlier; acceptable as distinct DB row
(58, 'Campher', 28, 'All-rounder', 'Right-hand bat', 'Right-arm medium'),
(59, 'Rahmanullah Gurbaz', 23, 'Wicketkeeper', 'Right-hand bat', ''),
(60, 'Suyash Sharma', 21, 'Bowler', 'Right-hand bat', 'Right-arm leg-break'),

-- Team 5: Lucknow Super Giants (players 61-75)
(61, 'KL Rahul', 31, 'Batsman', 'Right-hand bat', ''),
(62, 'Quinton de Kock', 31, 'Wicketkeeper', 'Left-hand bat', ''),
(63, 'Mark Wood', 34, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(64, 'Marcus Stoinis', 33, 'All-rounder', 'Left-hand bat', 'Right-arm medium-fast'),
(65, 'Kushagra Sharma', 21, 'Batsman', 'Right-hand bat', ''),
(66, 'Deepak Hooda', 29, 'All-rounder', 'Right-hand bat', 'Right-arm off-break'),
(67, 'Avesh Khan', 26, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(68, 'Mohsin Khan', 27, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(69, 'Ayush Badoni', 23, 'Batsman', 'Right-hand bat', ''),
(70, 'Nicholas Pooran', 28, 'Wicketkeeper', 'Left-hand bat', 'Right-arm medium'),
(71, 'Ravi Bishnoi', 23, 'Bowler', 'Right-hand bat', 'Leg break'),
(72, 'Yash Thakur', 26, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(73, 'Evin Lewis', 31, 'Batsman', 'Left-hand bat', ''),
(74, 'K Gowtham', 33, 'All-rounder', 'Right-hand bat', 'Right-arm off-break'),
(75, 'Rahul Tewatia', 31, 'All-rounder', 'Left-hand bat', 'Right-arm leg-break'),

-- Team 6: Mumbai Indians (players 76-90)
(76, 'Rohit Sharma', 37, 'Batsman', 'Right-hand bat', ''),
(77, 'Ishan Kishan', 26, 'Wicketkeeper', 'Left-hand bat', ''),
(78, 'Suryakumar Yadav', 33, 'Batsman', 'Right-hand bat', ''),
(79, 'Jasprit Bumrah', 30, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(80, 'Tilak Varma', 21, 'Batsman', 'Left-hand bat', ''),
(81, 'Nehal Wadhera', 24, 'All-rounder', 'Left-hand bat', 'Right-arm medium'),
(82, 'Cameron Green', 25, 'All-rounder', 'Right-hand bat', 'Right-arm fast-medium'),
(83, 'Piyush Chawla', 36, 'Bowler', 'Right-hand bat', 'Leg break'),
(84, 'Daniel Sams', 30, 'All-rounder', 'Right-hand bat', 'Right-arm fast-medium'),
(85, 'Mohammed Siraj', 30, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(86, 'Arshad Khan', 24, 'Bowler', 'Right-hand bat', 'Left-arm orthodox'),
(87, 'Tim David', 30, 'Batsman', 'Right-hand bat', ''),
(88, 'Carlos Brathwaite', 35, 'All-rounder', 'Right-hand bat', 'Right-arm medium'),
(89, 'Nathan Coulter-Nile', 35, 'Bowler', 'Right-hand bat', 'Right-arm fast-medium'),
(90, 'Sandeep Warrier', 32, 'Bowler', 'Right-hand bat', 'Right-arm medium-fast'),

-- Team 7: Punjab Kings (players 91-105)
(91, 'Sam Curran', 26, 'All-rounder', 'Left-hand bat', 'Left-arm fast-medium'),
(92, 'Shikhar Dhawan', 38, 'Batsman', 'Left-hand bat', ''),
(93, 'Jonny Bairstow', 35, 'Wicketkeeper', 'Right-hand bat', ''),
(94, 'Liam Livingstone', 31, 'All-rounder', 'Right-hand bat', 'Off break'),
(95, 'Mohammed Shami', 33, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(96, 'Harpreet Brar', 27, 'All-rounder', 'Left-hand bat', 'Slow left-arm orthodox'),
(97, 'Jitesh Sharma', 29, 'Wicketkeeper', 'Right-hand bat', ''),
(98, 'Harpreet Singh', 24, 'Bowler', 'Right-hand bat', 'Right-arm medium-fast'),
(99, 'Rahul Chahar', 26, 'Bowler', 'Right-hand bat', 'Leg break'),
(100, 'Prabhsimran Singh', 25, 'Batsman', 'Right-hand bat', ''),
(101, 'Shahrukh Khan', 26, 'All-rounder', 'Right-hand bat', 'Left-arm orthodox'),
(102, 'Shivam Mavi', 26, 'Bowler', 'Right-hand bat', 'Right-arm fast-medium'),
(103, 'Siddarth Kaul', 31, 'Bowler', 'Right-hand bat', 'Right-arm fast-medium'),
(104, 'Samarth Vyas', 27, 'Batsman', 'Right-hand bat', ''),
(105, 'Chris Jordan', 35, 'Bowler', 'Right-hand bat', 'Right-arm fast-medium'),

-- Team 8: Rajasthan Royals (players 106-120)
(106, 'Sanju Samson', 30, 'Wicketkeeper', 'Right-hand bat', ''),
(107, 'Jos Buttler', 33, 'Batsman', 'Right-hand bat', ''),
(108, 'Yashasvi Jaiswal', 22, 'Batsman', 'Left-hand bat', ''),
(109, 'Riyan Parag', 23, 'All-rounder', 'Right-hand bat', 'Right-arm off-break'),
(110, 'Trent Boult', 33, 'Bowler', 'Left-hand bat', 'Left-arm fast'),
(111, 'Kuldeep Sen', 28, 'Bowler', 'Right-hand bat', 'Right-arm fast-medium'),
(112, 'Kartik Tyagi', 25, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(113, 'Shimron Hetmyer', 27, 'Batsman', 'Left-hand bat', ''),
(114, 'Devdutt Padikkal', 25, 'Batsman', 'Left-hand bat', ''),
(115, 'Obed McCoy', 29, 'Bowler', 'Right-hand bat', 'Left-arm fast-medium'),
(116, 'Rahul Tewatia', 31, 'All-rounder', 'Left-hand bat', 'Right-arm leg-break'),
(117, 'Anukul Roy', 25, 'All-rounder', 'Left-hand bat', 'Left-arm orthodox'),
(118, 'Yuzvendra Chahal', 32, 'Bowler', 'Right-hand bat', 'Leg break'),
(119, 'Ravichandran Ashwin', 37, 'All-rounder', 'Right-hand bat', 'Off break'),
(120, 'S. Samson Jr', 24, 'Batsman', 'Right-hand bat', ''),

-- Team 9: Royal Challengers Bangalore (players 121-135)
(121, 'Faf du Plessis', 39, 'Batsman', 'Right-hand bat', ''),
(122, 'Virat Kohli', 36, 'Batsman', 'Right-hand bat', ''),
(123, 'Glenn Maxwell', 36, 'All-rounder', 'Right-hand bat', 'Right-arm off-break'),
(124, 'Mahipal Lomror', 27, 'All-rounder', 'Left-hand bat', 'Right-arm medium'),
(125, 'Dinesh Karthik', 39, 'Wicketkeeper', 'Right-hand bat', ''),
(126, 'Suyash Prabhudessai', 26, 'Batsman', 'Right-hand bat', ''),
(127, 'Mohammed Siraj', 30, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(128, 'Kyle Jamieson', 30, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(129, 'Wanindu Hasaranga', 27, 'Bowler', 'Right-hand bat', 'Right-arm leg-break'),
(130, 'Noor Ahmad', 20, 'Bowler', 'Right-hand bat', 'Left-arm chinaman'),
(131, 'Josh Hazlewood', 33, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(132, 'Mahesh Theekshana', 25, 'Bowler', 'Right-hand bat', 'Right-arm off-break'),
(133, 'Shahbaz Ahmed', 29, 'All-rounder', 'Right-hand bat', 'Right-arm off-break'),
(134, 'Harris}(dummy)', 27, 'Batsman', 'Right-hand bat', ''), -- placeholder: if you want real name, replace
(135, 'Furbaz Khan', 23, 'Bowler', 'Right-hand bat', 'Right-arm medium'),

-- Team 10: Sunrisers Hyderabad (players 136-150)
(136, 'Aiden Markram', 30, 'Batsman', 'Right-hand bat', ''),
(137, 'Pat Cummins', 31, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(138, 'Heinrich Klaasen', 31, 'Wicketkeeper', 'Right-hand bat', ''),
(139, 'Abhishek Sharma', 24, 'All-rounder', 'Left-hand bat', 'Left-arm orthodox'),
(140, 'Mayank Agarwal', 31, 'Batsman', 'Right-hand bat', ''),
(141, 'Bhuvneshwar Kumar', 33, 'Bowler', 'Right-hand bat', 'Right-arm medium-fast'),
(142, 'Marco Jansen', 25, 'All-rounder', 'Left-hand bat', 'Left-arm fast-medium'),
(143, 'T. Natarajan', 33, 'Bowler', 'Left-hand bat', 'Left-arm medium-fast'),
(144, 'Umran Malik', 24, 'Bowler', 'Right-hand bat', 'Right-arm fast'),
(145, 'Washington Sundar', 27, 'All-rounder', 'Left-hand bat', 'Off break'),
(146, 'Kane Williamson', 34, 'Batsman', 'Right-hand bat', ''),
(147, 'Nicholas Pooran', 28, 'Wicketkeeper', 'Left-hand bat', 'Right-arm medium'),
(148, 'Rahul Tripathi', 33, 'Batsman', 'Right-hand bat', ''),
(149, 'Kedar Jadhav', 36, 'All-rounder', 'Right-hand bat', 'Right-arm off-break'),
(150, 'Rashid Khan Jr', 21, 'Bowler', 'Right-hand bat', 'Leg break');

-- ----------------------------------------------------------------
-- 5) team_players mapping (team_id, player_id, contract dates)
--    15 players each (team 1 -> players 1..15, team 2 -> 16..30, etc.)
-- ----------------------------------------------------------------
-- For simplicity use contract_start = '2024-03-01', contract_end = '2025-03-01'
INSERT INTO team_players (team_id, player_id, contract_start, contract_end) VALUES
-- Team 1 (CSK)
(1,1,'2024-03-01','2025-03-01'),(1,2,'2024-03-01','2025-03-01'),(1,3,'2024-03-01','2025-03-01'),
(1,4,'2024-03-01','2025-03-01'),(1,5,'2024-03-01','2025-03-01'),(1,6,'2024-03-01','2025-03-01'),
(1,7,'2024-03-01','2025-03-01'),(1,8,'2024-03-01','2025-03-01'),(1,9,'2024-03-01','2025-03-01'),
(1,10,'2024-03-01','2025-03-01'),(1,11,'2024-03-01','2025-03-01'),(1,12,'2024-03-01','2025-03-01'),
(1,13,'2024-03-01','2025-03-01'),(1,14,'2024-03-01','2025-03-01'),(1,15,'2024-03-01','2025-03-01'),

-- Team 2 (Delhi Capitals) players 16..30
(2,16,'2024-03-01','2025-03-01'),(2,17,'2024-03-01','2025-03-01'),(2,18,'2024-03-01','2025-03-01'),
(2,19,'2024-03-01','2025-03-01'),(2,20,'2024-03-01','2025-03-01'),(2,21,'2024-03-01','2025-03-01'),
(2,22,'2024-03-01','2025-03-01'),(2,23,'2024-03-01','2025-03-01'),(2,24,'2024-03-01','2025-03-01'),
(2,25,'2024-03-01','2025-03-01'),(2,26,'2024-03-01','2025-03-01'),(2,27,'2024-03-01','2025-03-01'),
(2,28,'2024-03-01','2025-03-01'),(2,29,'2024-03-01','2025-03-01'),(2,30,'2024-03-01','2025-03-01'),

-- Team 3 (Gujarat Titans) players 31..45
(3,31,'2024-03-01','2025-03-01'),(3,32,'2024-03-01','2025-03-01'),(3,33,'2024-03-01','2025-03-01'),
(3,34,'2024-03-01','2025-03-01'),(3,35,'2024-03-01','2025-03-01'),(3,36,'2024-03-01','2025-03-01'),
(3,37,'2024-03-01','2025-03-01'),(3,38,'2024-03-01','2025-03-01'),(3,39,'2024-03-01','2025-03-01'),
(3,40,'2024-03-01','2025-03-01'),(3,41,'2024-03-01','2025-03-01'),(3,42,'2024-03-01','2025-03-01'),
(3,43,'2024-03-01','2025-03-01'),(3,44,'2024-03-01','2025-03-01'),(3,45,'2024-03-01','2025-03-01'),

-- Team 4 (KKR) players 46..60
(4,46,'2024-03-01','2025-03-01'),(4,47,'2024-03-01','2025-03-01'),(4,48,'2024-03-01','2025-03-01'),
(4,49,'2024-03-01','2025-03-01'),(4,50,'2024-03-01','2025-03-01'),(4,51,'2024-03-01','2025-03-01'),
(4,52,'2024-03-01','2025-03-01'),(4,53,'2024-03-01','2025-03-01'),(4,54,'2024-03-01','2025-03-01'),
(4,55,'2024-03-01','2025-03-01'),(4,56,'2024-03-01','2025-03-01'),(4,57,'2024-03-01','2025-03-01'),
(4,58,'2024-03-01','2025-03-01'),(4,59,'2024-03-01','2025-03-01'),(4,60,'2024-03-01','2025-03-01'),

-- Team 5 (LSG) players 61..75
(5,61,'2024-03-01','2025-03-01'),(5,62,'2024-03-01','2025-03-01'),(5,63,'2024-03-01','2025-03-01'),
(5,64,'2024-03-01','2025-03-01'),(5,65,'2024-03-01','2025-03-01'),(5,66,'2024-03-01','2025-03-01'),
(5,67,'2024-03-01','2025-03-01'),(5,68,'2024-03-01','2025-03-01'),(5,69,'2024-03-01','2025-03-01'),
(5,70,'2024-03-01','2025-03-01'),(5,71,'2024-03-01','2025-03-01'),(5,72,'2024-03-01','2025-03-01'),
(5,73,'2024-03-01','2025-03-01'),(5,74,'2024-03-01','2025-03-01'),(5,75,'2024-03-01','2025-03-01'),

-- Team 6 (MI) players 76..90
(6,76,'2024-03-01','2025-03-01'),(6,77,'2024-03-01','2025-03-01'),(6,78,'2024-03-01','2025-03-01'),
(6,79,'2024-03-01','2025-03-01'),(6,80,'2024-03-01','2025-03-01'),(6,81,'2024-03-01','2025-03-01'),
(6,82,'2024-03-01','2025-03-01'),(6,83,'2024-03-01','2025-03-01'),(6,84,'2024-03-01','2025-03-01'),
(6,85,'2024-03-01','2025-03-01'),(6,86,'2024-03-01','2025-03-01'),(6,87,'2024-03-01','2025-03-01'),
(6,88,'2024-03-01','2025-03-01'),(6,89,'2024-03-01','2025-03-01'),(6,90,'2024-03-01','2025-03-01'),

-- Team 7 (PBKS) players 91..105
(7,91,'2024-03-01','2025-03-01'),(7,92,'2024-03-01','2025-03-01'),(7,93,'2024-03-01','2025-03-01'),
(7,94,'2024-03-01','2025-03-01'),(7,95,'2024-03-01','2025-03-01'),(7,96,'2024-03-01','2025-03-01'),
(7,97,'2024-03-01','2025-03-01'),(7,98,'2024-03-01','2025-03-01'),(7,99,'2024-03-01','2025-03-01'),
(7,100,'2024-03-01','2025-03-01'),(7,101,'2024-03-01','2025-03-01'),(7,102,'2024-03-01','2025-03-01'),
(7,103,'2024-03-01','2025-03-01'),(7,104,'2024-03-01','2025-03-01'),(7,105,'2024-03-01','2025-03-01'),

-- Team 8 (RR) players 106..120
(8,106,'2024-03-01','2025-03-01'),(8,107,'2024-03-01','2025-03-01'),(8,108,'2024-03-01','2025-03-01'),
(8,109,'2024-03-01','2025-03-01'),(8,110,'2024-03-01','2025-03-01'),(8,111,'2024-03-01','2025-03-01'),
(8,112,'2024-03-01','2025-03-01'),(8,113,'2024-03-01','2025-03-01'),(8,114,'2024-03-01','2025-03-01'),
(8,115,'2024-03-01','2025-03-01'),(8,116,'2024-03-01','2025-03-01'),(8,117,'2024-03-01','2025-03-01'),
(8,118,'2024-03-01','2025-03-01'),(8,119,'2024-03-01','2025-03-01'),(8,120,'2024-03-01','2025-03-01'),

-- Team 9 (RCB) players 121..135
(9,121,'2024-03-01','2025-03-01'),(9,122,'2024-03-01','2025-03-01'),(9,123,'2024-03-01','2025-03-01'),
(9,124,'2024-03-01','2025-03-01'),(9,125,'2024-03-01','2025-03-01'),(9,126,'2024-03-01','2025-03-01'),
(9,127,'2024-03-01','2025-03-01'),(9,128,'2024-03-01','2025-03-01'),(9,129,'2024-03-01','2025-03-01'),
(9,130,'2024-03-01','2025-03-01'),(9,131,'2024-03-01','2025-03-01'),(9,132,'2024-03-01','2025-03-01'),
(9,133,'2024-03-01','2025-03-01'),(9,134,'2024-03-01','2025-03-01'),(9,135,'2024-03-01','2025-03-01'),

-- Team 10 (SRH) players 136..150
(10,136,'2024-03-01','2025-03-01'),(10,137,'2024-03-01','2025-03-01'),(10,138,'2024-03-01','2025-03-01'),
(10,139,'2024-03-01','2025-03-01'),(10,140,'2024-03-01','2025-03-01'),(10,141,'2024-03-01','2025-03-01'),
(10,142,'2024-03-01','2025-03-01'),(10,143,'2024-03-01','2025-03-01'),(10,144,'2024-03-01','2025-03-01'),
(10,145,'2024-03-01','2025-03-01'),(10,146,'2024-03-01','2025-03-01'),(10,147,'2024-03-01','2025-03-01'),
(10,148,'2024-03-01','2025-03-01'),(10,149,'2024-03-01','2025-03-01'),(10,150,'2024-03-01','2025-03-01');

-- ----------------------------------------------------------------
-- 6) Matches (20 matches) - match_id 1..20
--    Each match links team1_id, team2_id, venue_id, umpire_id, date, toss_winner, toss_decision, scores
-- ----------------------------------------------------------------
INSERT INTO matches (match_id, team1_id, team2_id, venue_id, umpire_id, date, toss_winner, toss_decision, team_1_score, team_2_score, team_1_wickets, team_2_wickets, match_result, weather)
VALUES
(1, 1, 2, 1, 1, '2024-04-01', 1, 'Bat', 180, 165, 6, 9, 'Chennai Super Kings won by 15 runs', 'Clear'),
(2, 3, 4, 3, 2, '2024-04-02', 3, 'Bowl', 150, 151, 8, 4, 'Kolkata Knight Riders won by 6 wickets', 'Cloudy'),
(3, 5, 6, 5, 3, '2024-04-03', 6, 'Bowl', 142, 143, 9, 7, 'Mumbai Indians won by 3 wickets', 'Clear'),
(4, 7, 8, 8, 4, '2024-04-04', 8, 'Bat', 210, 205, 5, 8, 'Punjab Kings won by 5 runs', 'Hot'),
(5, 9, 10, 7, 5, '2024-04-05', 9, 'Bat', 175, 176, 7, 6, 'Sunrisers Hyderabad won by 4 wickets', 'Clear'),
(6, 2, 3, 2, 6, '2024-04-06', 3, 'Bat', 160, 161, 10, 5, 'Gujarat Titans won by 5 wickets', 'Humid'),
(7, 4, 5, 4, 1, '2024-04-07', 4, 'Bowl', 145, 146, 9, 6, 'Lucknow Super Giants won by 4 wickets', 'Cloudy'),
(8, 6, 7, 6, 2, '2024-04-08', 6, 'Bat', 190, 170, 4, 10, 'Mumbai Indians won by 20 runs', 'Clear'),
(9, 8, 9, 8, 3, '2024-04-09', 9, 'Bat', 200, 198, 3, 8, 'Rajasthan Royals won by 2 runs', 'Warm'),
(10,10,1,1,4, '2024-04-10', 10, 'Bowl', 155, 156, 10, 6, 'Chennai Super Kings won by 4 wickets', 'Clear'),
(11,2,4,2,5, '2024-04-11', 2, 'Bat', 170, 172, 7, 6, 'Kolkata Knight Riders won by 3 wickets', 'Cloudy'),
(12,3,6,3,6, '2024-04-12', 3, 'Bowl', 142, 143, 10, 4, 'Mumbai Indians won by 6 wickets', 'Clear'),
(13,5,9,5,1, '2024-04-13', 5, 'Bat', 185, 186, 9, 5, 'Royal Challengers Bangalore won by 4 wickets', 'Sunny'),
(14,7,10,6,2,'2024-04-14',7,'Bat', 172, 160, 8, 10, 'Punjab Kings won by 12 runs', 'Clear'),
(15,8,1,8,3,'2024-04-15',8,'Bowl', 150, 151, 10, 6, 'Chennai Super Kings won by 4 wickets', 'Warm'),
(16,4,6,4,4, '2024-04-16',4,'Bat', 168, 169, 7, 9, 'Mumbai Indians won by 1 wicket', 'Cloudy'),
(17,9,3,7,5, '2024-04-17',9,'Bat', 180, 159, 6, 10, 'Royal Challengers Bangalore won by 21 runs', 'Clear'),
(18,2,10,2,6,'2024-04-18',2,'Bowl', 140, 141, 9, 7, 'Sunrisers Hyderabad won by 3 wickets', 'Rain'),
(19,1,5,1,1,'2024-04-19',1,'Bat', 195, 185, 6, 9, 'Chennai Super Kings won by 10 runs', 'Hot'),
(20,7,4,6,2,'2024-04-20',7,'Bowl', 162, 163, 8, 6, 'Kolkata Knight Riders won by 1 wicket', 'Clear');

-- ----------------------------------------------------------------
-- 7) Basic batting_stats, bowling_stats, fielding_stats
--    We'll insert zero/placeholder stats for all players, then
--    add a few sample populated stats to show usage
-- ----------------------------------------------------------------
-- Default zero stats for every player
INSERT INTO batting_stats (player_id, matches_played, runs_scored, balls_faced, fours, sixes, fifties, hundreds)
SELECT player_id, 0, 0, 0, 0, 0, 0, 0 FROM players;

INSERT INTO bowling_stats (player_id, matches_played, overs_bowled, runs_conceded, wickets)
SELECT player_id, 0, 0.0, 0, 0 FROM players;

INSERT INTO fielding_stats (player_id, matches_played, catches, run_outs, stumpings)
SELECT player_id, 0, 0, 0, 0 FROM players;

-- ----------------------------------------------------------------
-- 8) A few sample player_match_stats for some matches to show links
--    We'll add stats for notable players in match 1..5
-- ----------------------------------------------------------------
-- Match 1: Chennai (team1) vs Delhi (team2) - match_id 1
INSERT INTO player_match_stats (match_id, player_id, runs_scored, balls_faced, fours, sixes, wickets, overs_bowled, runs_conceded, catches, run_outs, stumpings)
VALUES
(1, 2, 62, 48, 6, 1, 0, 0.0, 0, 1, 0, 0),   -- Ruturaj Gaikwad scored 62
(1, 3, 48, 36, 4, 2, 0, 0.0, 0, 0, 0, 0),   -- Devon Conway 48
(1, 16, 45, 32, 5, 1, 0, 0.0, 0, 0, 0, 0),  -- Rishabh Pant 45
(1, 21, 0, 2, 0, 0, 2, 4.0, 32, 0, 0, 0);   -- Anrich Nortje 2 wickets

-- Update aggregated stats for these players (update batting_stats, bowling_stats, fielding_stats)
UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 62, balls_faced = balls_faced + 48, fours = fours + 6, sixes = sixes + 1 WHERE player_id = 2;
UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 48, balls_faced = balls_faced + 36, fours = fours + 4, sixes = sixes + 2 WHERE player_id = 3;
UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 45, balls_faced = balls_faced + 32, fours = fours + 5, sixes = sixes + 1 WHERE player_id = 16;
UPDATE bowling_stats SET matches_played = matches_played + 1, overs_bowled = overs_bowled + 4.0, runs_conceded = runs_conceded + 32, wickets = wickets + 2 WHERE player_id = 21;
UPDATE fielding_stats SET matches_played = matches_played + 1, catches = catches + 1 WHERE player_id = 2;

-- Match 2: Gujarat (team3) vs KKR (team4) - match_id 2
INSERT INTO player_match_stats (match_id, player_id, runs_scored, balls_faced, fours, sixes, wickets, overs_bowled, runs_conceded, catches, run_outs, stumpings)
VALUES
(2, 32, 72, 58, 8, 2, 0, 0.0, 0, 1, 0, 0),  -- Shubman Gill 72
(2, 34, 10, 6, 1, 1, 2, 4.0, 28, 0, 0, 0),  -- Rashid Khan 2 wickets
(2, 48, 45, 35, 6, 1, 0, 0.0, 0, 0, 0, 0);  -- Andre Russell 45

UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 72, balls_faced = balls_faced + 58, fours = fours + 8, sixes = sixes + 2 WHERE player_id = 32;
UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 45, balls_faced = balls_faced + 35, fours = fours + 6, sixes = sixes + 1 WHERE player_id = 48;
UPDATE bowling_stats SET matches_played = matches_played + 1, overs_bowled = overs_bowled + 4.0, runs_conceded = runs_conceded + 28, wickets = wickets + 2 WHERE player_id = 34;

-- Match 3: LSG (team5) vs MI (team6) - match_id 3
INSERT INTO player_match_stats (match_id, player_id, runs_scored, balls_faced, fours, sixes, wickets, overs_bowled, runs_conceded, catches, run_outs, stumpings)
VALUES
(3, 61, 58, 44, 6, 1, 0, 0.0, 0, 0, 0, 0),  -- KL Rahul 58
(3, 76, 70, 50, 7, 2, 0, 0.0, 0, 1, 0, 0),  -- Rohit Sharma 70
(3, 79, 0, 5, 0, 0, 3, 4.0, 26, 0, 0, 0);   -- Jasprit Bumrah 3 wickets

UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 58, balls_faced = balls_faced + 44, fours = fours + 6, sixes = sixes + 1 WHERE player_id = 61;
UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 70, balls_faced = balls_faced + 50, fours = fours + 7, sixes = sixes + 2 WHERE player_id = 76;
UPDATE bowling_stats SET matches_played = matches_played + 1, overs_bowled = overs_bowled + 4.0, runs_conceded = runs_conceded + 26, wickets = wickets + 3 WHERE player_id = 79;

-- Match 4: PBKS (team7) vs RR (team8) - match_id 4
INSERT INTO player_match_stats (match_id, player_id, runs_scored, balls_faced, fours, sixes, wickets, overs_bowled, runs_conceded, catches, run_outs, stumpings)
VALUES
(4, 91, 44, 30, 4, 1, 0, 0.0, 0, 0, 0, 0),  -- Sam Curran 44
(4, 106, 88, 52, 10, 4, 0, 0.0, 0, 0, 0, 0),-- Sanju Samson 88
(4, 110, 2, 4, 0, 0, 3, 4.0, 35, 0, 0, 0);   -- Trent Boult 3 wickets

UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 44, balls_faced = balls_faced + 30, fours = fours + 4, sixes = sixes + 1 WHERE player_id = 91;
UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 88, balls_faced = balls_faced + 52, fours = fours + 10, sixes = sixes + 4 WHERE player_id = 106;
UPDATE bowling_stats SET matches_played = matches_played + 1, overs_bowled = overs_bowled + 4.0, runs_conceded = runs_conceded + 35, wickets = wickets + 3 WHERE player_id = 110;

-- Match 5: RCB (team9) vs SRH (team10) - match_id 5
INSERT INTO player_match_stats (match_id, player_id, runs_scored, balls_faced, fours, sixes, wickets, overs_bowled, runs_conceded, catches, run_outs, stumpings)
VALUES
(5, 121, 55, 40, 6, 1, 0, 0.0, 0, 0, 0, 0), -- Faf du Plessis 55
(5, 122, 85, 54, 9, 3, 0, 0.0, 0, 1, 0, 0), -- Virat Kohli 85
(5, 136, 10, 7, 1, 0, 1, 4.0, 40, 0, 0, 0); -- Aiden Markram 1 wicket (occasional bowling)

UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 55, balls_faced = balls_faced + 40, fours = fours + 6, sixes = sixes + 1 WHERE player_id = 121;
UPDATE batting_stats SET matches_played = matches_played + 1, runs_scored = runs_scored + 85, balls_faced = balls_faced + 54, fours = fours + 9, sixes = sixes + 3 WHERE player_id = 122;
UPDATE bowling_stats SET matches_played = matches_played + 1, overs_bowled = overs_bowled + 4.0, runs_conceded = runs_conceded + 40, wickets = wickets + 1 WHERE player_id = 136;

-- ----------------------------------------------------------------
-- Done. The script inserted:
--  - 10 teams
--  - 8 venues
--  - 8 umpires
--  - 150 players
--  - team_players mapping for all players
--  - 20 matches
--  - default stats for all players + sample player_match_stats for matches 1..5
-- ----------------------------------------------------------------

