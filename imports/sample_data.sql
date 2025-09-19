USE crickstatz;

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

INSERT INTO venues (venue_id, name, location, capacity) VALUES
(1, 'MA Chidambaram Stadium', 'Chennai', 38000),
(2, 'Arun Jaitley Stadium', 'Delhi', 41000),
(3, 'Narendra Modi Stadium', 'Ahmedabad', 132000),
(4, 'Eden Gardens', 'Kolkata', 68000),
(5, 'Ekana Stadium', 'Lucknow', 50000),
(6, 'Wankhede Stadium', 'Mumbai', 33000),
(7, 'M Chinnaswamy Stadium', 'Bangalore', 35000),
(8, 'Rajiv Gandhi Intl. Cricket Stadium', 'Hyderabad', 55000);

INSERT INTO umpires (umpire_id, name, experience) VALUES
(1, 'Kumar Dharmasena', 18),
(2, 'Aleem Dar', 22),
(3, 'Richard Kettleborough', 15),
(4, 'Marais Erasmus', 14),
(5, 'Michael Gough', 12),
(6, 'Paul Reiffel', 20),
(7, 'Nitin Menon', 8),
(8, 'K. N. Anantha', 10);

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

-- Sample IPL Matches Data
INSERT INTO matches (match_id, team1_id, team2_id, venue_id, umpire_id, date, toss_winner, toss_decision, team_1_score, team_2_score, team_1_wickets, team_2_wickets, match_result, weather) VALUES
-- Match 1: CSK vs MI
(1, 1, 6, 1, 1, '2024-04-15', 1, 'Bat', 185, 187, 6, 4, 'Mumbai Indians won by 6 wickets', 'Clear'),
-- Match 2: RCB vs KKR  
(2, 9, 4, 7, 2, '2024-04-16', 9, 'Bowl', 172, 175, 8, 5, 'Kolkata Knight Riders won by 5 wickets', 'Partly cloudy'),
-- Match 3: GT vs SRH
(3, 3, 10, 3, 3, '2024-04-17', 10, 'Bat', 195, 162, 4, 10, 'Gujarat Titans won by 33 runs', 'Hot and sunny'),
-- Match 4: DC vs PBKS
(4, 2, 7, 2, 4, '2024-04-18', 2, 'Bowl', 156, 158, 9, 7, 'Punjab Kings won by 3 wickets', 'Overcast'),
-- Match 5: LSG vs RR
(5, 5, 8, 5, 5, '2024-04-19', 8, 'Bat', 178, 179, 7, 8, 'Lucknow Super Giants won by 2 wickets', 'Clear'),
-- Match 6: MI vs RCB
(6, 6, 9, 6, 6, '2024-04-20', 6, 'Bat', 192, 195, 5, 6, 'Royal Challengers Bangalore won by 4 wickets', 'Humid'),
-- Match 7: CSK vs GT
(7, 1, 3, 1, 7, '2024-04-21', 3, 'Bowl', 168, 171, 8, 6, 'Gujarat Titans won by 4 wickets', 'Cool evening'),
-- Match 8: KKR vs SRH
(8, 4, 10, 4, 8, '2024-04-22', 4, 'Bat', 201, 198, 3, 9, 'Kolkata Knight Riders won by 3 runs', 'Perfect weather'),
-- Match 9: DC vs RR
(9, 2, 8, 2, 1, '2024-04-23', 8, 'Bowl', 143, 147, 9, 8, 'Rajasthan Royals won by 2 wickets', 'Light drizzle'),
-- Match 10: PBKS vs LSG
(10, 7, 5, 7, 2, '2024-04-24', 7, 'Bat', 189, 165, 6, 10, 'Punjab Kings won by 24 runs', 'Windy'),
-- Match 11: RCB vs CSK
(11, 9, 1, 7, 3, '2024-04-25', 1, 'Bowl', 173, 176, 7, 5, 'Chennai Super Kings won by 5 wickets', 'Clear'),
-- Match 12: MI vs GT
(12, 6, 3, 6, 4, '2024-04-26', 3, 'Bat', 207, 183, 4, 8, 'Mumbai Indians won by 24 runs', 'Hot'),
-- Match 13: KKR vs DC
(13, 4, 2, 4, 5, '2024-04-27', 4, 'Bowl', 158, 161, 8, 6, 'Delhi Capitals won by 4 wickets', 'Pleasant'),
-- Match 14: SRH vs RR
(14, 10, 8, 8, 6, '2024-04-28', 10, 'Bat', 211, 167, 3, 10, 'Sunrisers Hyderabad won by 44 runs', 'Very hot'),
-- Match 15: LSG vs PBKS
(15, 5, 7, 5, 7, '2024-04-29', 5, 'Bowl', 149, 152, 9, 7, 'Punjab Kings won by 3 wickets', 'Overcast'),
-- Match 16: CSK vs RCB
(16, 1, 9, 1, 8, '2024-04-30', 9, 'Bat', 166, 169, 8, 6, 'Royal Challengers Bangalore won by 4 wickets', 'Humid'),
-- Match 17: GT vs MI
(17, 3, 6, 3, 1, '2024-05-01', 6, 'Bowl', 181, 184, 7, 5, 'Mumbai Indians won by 5 wickets', 'Clear'),
-- Match 18: DC vs KKR
(18, 2, 4, 2, 2, '2024-05-02', 2, 'Bat', 174, 177, 6, 4, 'Kolkata Knight Riders won by 6 wickets', 'Cool'),
-- Match 19: RR vs SRH
(19, 8, 10, 8, 3, '2024-05-03', 8, 'Bowl', 155, 158, 8, 7, 'Sunrisers Hyderabad won by 3 wickets', 'Warm'),
-- Match 20: PBKS vs CSK
(20, 7, 1, 7, 4, '2024-05-04', 1, 'Bat', 179, 156, 5, 10, 'Chennai Super Kings won by 23 runs', 'Windy');

-- Sample Batting Stats (aggregated career stats for key players)
INSERT INTO batting_stats (player_id, matches_played, runs_scored, balls_faced, fours, sixes, fifties, hundreds) VALUES
-- CSK players
(1, 25, 412, 378, 28, 18, 2, 0),    -- MS Dhoni
(2, 22, 856, 642, 89, 12, 6, 2),    -- Ruturaj Gaikwad
(3, 18, 678, 489, 76, 14, 4, 1),    -- Devon Conway
(11, 24, 445, 298, 32, 22, 1, 0),   -- Ravindra Jadeja
(13, 20, 523, 312, 41, 28, 3, 0),   -- Shivam Dube

-- MI players
(76, 28, 892, 678, 98, 24, 5, 2),   -- Rohit Sharma
(77, 24, 634, 478, 56, 32, 3, 1),   -- Ishan Kishan
(78, 26, 978, 634, 89, 45, 7, 2),   -- Suryakumar Yadav
(80, 19, 445, 312, 48, 18, 2, 0),   -- Tilak Varma
(82, 21, 567, 398, 52, 28, 3, 0),   -- Cameron Green

-- RCB players
(121, 25, 823, 612, 94, 18, 6, 1),  -- Faf du Plessis
(122, 27, 1245, 834, 134, 28, 9, 3), -- Virat Kohli
(123, 23, 672, 423, 58, 38, 4, 1),  -- Glenn Maxwell
(125, 22, 389, 298, 34, 16, 1, 0),  -- Dinesh Karthik

-- KKR players
(46, 24, 734, 556, 78, 22, 5, 1),   -- Shreyas Iyer
(48, 20, 456, 278, 32, 34, 2, 0),   -- Andre Russell
(49, 25, 398, 234, 28, 26, 1, 0),   -- Sunil Narine
(54, 21, 523, 398, 56, 18, 3, 0),   -- Rinku Singh

-- GT players
(31, 22, 567, 378, 48, 32, 3, 0),   -- Hardik Pandya
(32, 24, 812, 634, 89, 16, 6, 2),   -- Shubman Gill
(43, 19, 445, 312, 42, 24, 2, 0),   -- David Miller
(34, 23, 278, 189, 18, 12, 0, 0),   -- Rashid Khan

-- DC players
(16, 23, 698, 523, 67, 34, 4, 1),   -- Rishabh Pant
(17, 20, 456, 378, 52, 12, 2, 0),   -- Prithvi Shaw
(18, 18, 534, 423, 64, 18, 3, 0),   -- David Warner
(22, 24, 378, 298, 32, 14, 1, 0),   -- Axar Patel

-- LSG players
(61, 25, 845, 678, 92, 18, 6, 2),   -- KL Rahul
(62, 21, 623, 456, 68, 22, 4, 0),   -- Quinton de Kock
(64, 22, 489, 334, 42, 26, 2, 0),   -- Marcus Stoinis
(70, 20, 456, 312, 38, 28, 2, 0),   -- Nicholas Pooran

-- PBKS players
(91, 23, 523, 398, 48, 24, 3, 0),   -- Sam Curran
(92, 22, 634, 534, 78, 8, 4, 1),    -- Shikhar Dhawan
(93, 19, 456, 334, 52, 18, 2, 0),   -- Jonny Bairstow
(94, 21, 567, 378, 46, 32, 3, 0),   -- Liam Livingstone

-- RR players
(106, 24, 723, 534, 76, 26, 5, 1),  -- Sanju Samson
(107, 20, 612, 423, 68, 24, 4, 0),  -- Jos Buttler
(108, 22, 634, 478, 82, 14, 4, 1),  -- Yashasvi Jaiswal
(109, 21, 389, 289, 34, 18, 1, 0),  -- Riyan Parag

-- SRH players
(136, 23, 678, 523, 72, 20, 4, 1),  -- Aiden Markram
(138, 21, 589, 398, 56, 28, 3, 0),  -- Heinrich Klaasen
(139, 22, 512, 356, 48, 24, 2, 0),  -- Abhishek Sharma
(140, 20, 445, 378, 54, 12, 2, 0),  -- Mayank Agarwal
(148, 19, 367, 289, 42, 16, 1, 0);  -- Rahul Tripathi

-- Sample Bowling Stats
INSERT INTO bowling_stats (player_id, matches_played, overs_bowled, runs_conceded, wickets) VALUES
-- Bowlers and All-rounders
(79, 26, 98.4, 743, 32),   -- Jasprit Bumrah
(35, 24, 94.2, 812, 28),   -- Mohammed Shami
(34, 23, 89.3, 723, 31),   -- Rashid Khan
(23, 22, 86.1, 698, 26),   -- Kagiso Rabada
(110, 21, 82.4, 634, 24),  -- Trent Boult
(137, 24, 91.2, 756, 29),  -- Pat Cummins
(21, 20, 78.3, 589, 22),   -- Anrich Nortje
(63, 19, 74.2, 567, 21),   -- Mark Wood
(131, 23, 88.4, 698, 25),  -- Josh Hazlewood
(127, 25, 95.3, 789, 27),  -- Mohammed Siraj
(19, 24, 92.1, 743, 28),   -- Kuldeep Yadav
(51, 22, 84.2, 656, 24),   -- Varun Chakravarthy
(118, 23, 88.3, 712, 26),  -- Yuzvendra Chahal
(99, 21, 80.1, 623, 23),   -- Rahul Chahar
(129, 20, 76.4, 578, 22),  -- Wanindu Hasaranga
-- All-rounders bowling
(11, 24, 45.2, 389, 18),   -- Ravindra Jadeja
(22, 24, 48.3, 412, 16),   -- Axar Patel
(48, 20, 32.1, 298, 14),   -- Andre Russell
(31, 22, 38.4, 334, 15),   -- Hardik Pandya
(91, 23, 42.2, 356, 17),   -- Sam Curran
(5, 18, 34.1, 289, 12),    -- Moeen Ali
(64, 22, 28.3, 234, 11),   -- Marcus Stoinis
(123, 23, 31.2, 267, 13),  -- Glenn Maxwell
(119, 22, 44.1, 378, 16),  -- Ravichandran Ashwin
(145, 20, 38.2, 312, 14);  -- Washington Sundar

-- Sample Fielding Stats
INSERT INTO fielding_stats (player_id, matches_played, catches, run_outs, stumpings) VALUES
-- Wicketkeepers
(1, 25, 18, 3, 8),    -- MS Dhoni
(16, 23, 21, 2, 6),   -- Rishabh Pant
(77, 24, 19, 1, 4),   -- Ishan Kishan
(106, 24, 23, 4, 7),  -- Sanju Samson
(125, 22, 16, 2, 5),  -- Dinesh Karthik
(62, 21, 17, 3, 2),   -- Quinton de Kock
(138, 21, 20, 2, 3),  -- Heinrich Klaasen
(33, 19, 14, 1, 4),   -- Wriddhiman Saha
(93, 19, 15, 2, 2),   -- Jonny Bairstow
(70, 20, 18, 3, 3),   -- Nicholas Pooran

-- Fielders (non-wicketkeepers)
(122, 27, 24, 6, 0),  -- Virat Kohli
(76, 28, 22, 4, 0),   -- Rohit Sharma
(32, 24, 19, 5, 0),   -- Shubman Gill
(2, 22, 16, 3, 0),    -- Ruturaj Gaikwad
(46, 24, 18, 4, 0),   -- Shreyas Iyer
(61, 25, 20, 5, 0),   -- KL Rahul
(11, 24, 21, 8, 0),   -- Ravindra Jadeja
(48, 20, 14, 6, 0),   -- Andre Russell
(31, 22, 17, 4, 0),   -- Hardik Pandya
(78, 26, 23, 5, 0),   -- Suryakumar Yadav
(22, 24, 19, 7, 0),   -- Axar Patel
(107, 20, 18, 3, 0),  -- Jos Buttler
(108, 22, 17, 4, 0),  -- Yashasvi Jaiswal
(121, 25, 21, 4, 0),  -- Faf du Plessis
(136, 23, 19, 3, 0),  -- Aiden Markram
(91, 23, 16, 5, 0),   -- Sam Curran
(18, 18, 15, 2, 0),   -- David Warner
(123, 23, 18, 4, 0),  -- Glenn Maxwell
(43, 19, 14, 3, 0),   -- David Miller
(139, 22, 16, 4, 0),  -- Abhishek Sharma
(79, 26, 8, 2, 0),    -- Jasprit Bumrah
(35, 24, 6, 1, 0),    -- Mohammed Shami
(34, 23, 12, 3, 0),   -- Rashid Khan
(23, 22, 7, 2, 0),    -- Kagiso Rabada
(110, 21, 9, 1, 0),   -- Trent Boult
(137, 24, 8, 2, 0),   -- Pat Cummins
(127, 25, 9, 3, 0),   -- Mohammed Siraj
(19, 24, 11, 2, 0),   -- Kuldeep Yadav
(118, 23, 10, 3, 0),  -- Yuzvendra Chahal
(51, 22, 12, 4, 0);   -- Varun Chakravarthy

-- Sample Player Match Stats (for a few matches to show variety)
INSERT INTO player_match_stats (match_id, player_id, runs_scored, balls_faced, fours, sixes, wickets, overs_bowled, runs_conceded, catches, run_outs, stumpings) VALUES
-- Match 1: CSK vs MI
-- CSK batting
(1, 2, 45, 34, 6, 1, 0, 0, 0, 0, 0, 0),     -- Ruturaj Gaikwad
(1, 3, 38, 29, 5, 0, 0, 0, 0, 1, 0, 0),     -- Devon Conway
(1, 11, 28, 18, 2, 2, 0, 0, 0, 0, 0, 0),    -- Jadeja
(1, 1, 34, 31, 2, 2, 0, 0, 0, 0, 0, 1),     -- MS Dhoni
(1, 13, 25, 16, 1, 2, 0, 0, 0, 0, 0, 0),    -- Shivam Dube
-- CSK bowling
(1, 11, 0, 0, 0, 0, 2, 4, 32, 0, 0, 0),     -- Jadeja
(1, 7, 0, 0, 0, 0, 1, 4, 28, 0, 0, 0),      -- Theekshana
(1, 8, 0, 0, 0, 0, 2, 4, 35, 0, 0, 0),      -- Pathirana
(1, 14, 0, 0, 0, 0, 1, 4, 42, 0, 0, 0),     -- Simranjeet
-- MI batting 
(1, 77, 52, 38, 7, 1, 0, 0, 0, 0, 0, 0),    -- Ishan Kishan
(1, 76, 41, 33, 5, 1, 0, 0, 0, 1, 0, 0),    -- Rohit Sharma
(1, 78, 48, 31, 4, 3, 0, 0, 0, 0, 0, 0),    -- Suryakumar
(1, 82, 32, 22, 2, 2, 0, 0, 0, 0, 0, 0),    -- Green
-- MI bowling
(1, 79, 0, 0, 0, 0, 3, 4, 29, 0, 0, 0),     -- Bumrah
(1, 85, 0, 0, 0, 0, 2, 4, 38, 1, 0, 0),     -- Siraj
(1, 82, 0, 0, 0, 0, 1, 2, 18, 0, 0, 0),     -- Green

-- Match 2: RCB vs KKR
-- RCB batting
(2, 122, 42, 35, 6, 0, 0, 0, 0, 0, 0, 0),   -- Virat Kohli
(2, 121, 38, 31, 5, 1, 0, 0, 0, 1, 0, 0),   -- Faf
(2, 123, 35, 22, 2, 3, 0, 0, 0, 0, 0, 0),   -- Maxwell
(2, 125, 28, 24, 3, 1, 0, 0, 0, 0, 0, 2),   -- DK
-- RCB bowling
(2, 127, 0, 0, 0, 0, 2, 4, 34, 0, 0, 0),    -- Siraj
(2, 129, 0, 0, 0, 0, 3, 4, 31, 1, 0, 0),    -- Hasaranga
(2, 131, 0, 0, 0, 0, 1, 4, 38, 0, 0, 0),    -- Hazlewood
-- KKR batting
(2, 49, 34, 18, 2, 3, 0, 0, 0, 0, 0, 0),    -- Narine
(2, 46, 48, 39, 6, 1, 0, 0, 0, 0, 0, 0),    -- Shreyas
(2, 48, 42, 26, 3, 3, 0, 0, 0, 0, 0, 0),    -- Russell
(2, 54, 35, 28, 4, 1, 0, 0, 0, 1, 0, 0),    -- Rinku
-- KKR bowling
(2, 51, 0, 0, 0, 0, 4, 4, 28, 0, 0, 0),     -- Varun
(2, 49, 0, 0, 0, 0, 2, 4, 35, 0, 0, 0),     -- Narine
(2, 48, 0, 0, 0, 0, 1, 3, 32, 0, 1, 0),     -- Russell

-- Match 3: GT vs SRH  
-- GT batting
(3, 32, 67, 48, 8, 2, 0, 0, 0, 0, 0, 0),    -- Shubman Gill
(3, 31, 45, 29, 4, 3, 0, 0, 0, 1, 0, 0),    -- Hardik
(3, 43, 38, 22, 2, 3, 0, 0, 0, 0, 0, 0),    -- Miller
(3, 36, 28, 21, 3, 1, 0, 0, 0, 0, 0, 0),    -- Tewatia
-- GT bowling
(3, 34, 0, 0, 0, 0, 5, 4, 24, 0, 0, 0),     -- Rashid Khan
(3, 35, 0, 0, 0, 0, 3, 4, 31, 0, 0, 0),     -- Shami
(3, 31, 0, 0, 0, 0, 1, 2, 22, 0, 0, 0),     -- Hardik
-- SRH batting
(3, 136, 34, 28, 4, 1, 0, 0, 0, 0, 0, 0),   -- Markram
(3, 138, 42, 31, 3, 2, 0, 0, 0, 0, 0, 1),   -- Klaasen
(3, 139, 28, 22, 3, 1, 0, 0, 0, 0, 0, 0),   -- Abhishek
(3, 148, 25, 21, 3, 0, 0, 0, 0, 1, 0, 0),   -- Tripathi
-- SRH bowling
(3, 137, 0, 0, 0, 0, 2, 4, 38, 0, 0, 0),    -- Cummins
(3, 144, 0, 0, 0, 0, 1, 4, 45, 0, 0, 0),    -- Umran Malik
(3, 141, 0, 0, 0, 0, 1, 4, 42, 1, 0, 0),    -- Bhuvi

-- Match 4: DC vs PBKS
-- DC batting
(4, 16, 38, 32, 4, 1, 0, 0, 0, 0, 0, 1),    -- Pant
(4, 18, 42, 35, 6, 0, 0, 0, 0, 0, 0, 0),    -- Warner
(4, 22, 28, 24, 3, 1, 0, 0, 0, 1, 0, 0),    -- Axar
(4, 20, 25, 18, 1, 2, 0, 0, 0, 0, 0, 0),    -- Powell
-- DC bowling
(4, 19, 0, 0, 0, 0, 3, 4, 32, 0, 0, 0),     -- Kuldeep
(4, 23, 0, 0, 0, 0, 2, 4, 34, 0, 0, 0),     -- Rabada
(4, 22, 0, 0, 0, 0, 2, 4, 28, 0, 0, 0),     -- Axar
-- PBKS batting
(4, 92, 45, 38, 6, 1, 0, 0, 0, 0, 0, 0),    -- Dhawan
(4, 93, 38, 29, 5, 1, 0, 0, 0, 0, 0, 0),    -- Bairstow
(4, 94, 32, 21, 2, 2, 0, 0, 0, 1, 0, 0),    -- Livingstone
(4, 91, 28, 22, 3, 1, 0, 0, 0, 0, 0, 0),    -- Curran
-- PBKS bowling
(4, 95, 0, 0, 0, 0, 4, 4, 28, 0, 0, 0),     -- Shami
(4, 91, 0, 0, 0, 0, 2, 4, 35, 0, 0, 0),     -- Curran
(4, 99, 0, 0, 0, 0, 2, 4, 31, 1, 0, 0);     -- Chahar