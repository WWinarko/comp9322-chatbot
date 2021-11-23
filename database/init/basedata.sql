CREATE TABLE cinema (
  cinemaId int,
  name text,
  address text,
  phone text,
  PRIMARY KEY (cinemaId)
);

CREATE TABLE snack (
  snackId int,
  name text,
  price double,
  PRIMARY KEY (snackId)
);

CREATE TABLE snackSold (
  cinema int references cinema(cinemaId),
  snack int references snack(snackId),
  PRIMARY KEY (cinema, snack)
);

CREATE TABLE movie (
  movieId int,
  title text,
  description text,
  cast text,
  PRIMARY KEY (movieId)
);

CREATE TABLE studio (
  studioId int,
  cinema int references cinema(cinemaId),
  name text,
  type text,
  price double,
  PRIMARY KEY (studioId)
);

CREATE TABLE studioSeat (
  studioSeatId int,
  seatNumber int,
  studio int references studio(studioId),
  PRIMARY KEY(studioSeatId)
);

CREATE TABLE timeslotSeat(
  timeslotSeatId int,
  status text,
  studioSeat int references studioSeat(studioSeatId),
  timeslot int references timeslot(timeslotId),
  PRIMARY KEY (timeslotSeatId)
);

CREATE TABLE timeslot(
  timeslotId int,
  studio int references studio(studioId),
  movie int references movie(movieId),
  day text,
  startTime time,
  endTime time,
  PRIMARY KEY(timeslotId)
);

CREATE TABLE booking(
  bookingId int,
  numberOfSeats int,
  user int references user(userId),
  timeslot int references timeslot(timeslotId),
  timeslotSeat int references timeslotSeat(timeslotSeatId),
  PRIMARY KEY(bookingId)
);

CREATE TABLE user(
  userId int,
  email text,
  name text,
  PRIMARY KEY(userId)
);


INSERT INTO cinema (cinemaId, name, address, phone) VALUES (100,'Event Cinemas George Street', '505/525 George St, Sydney NSW 2000', '(02) 9273 7300');
INSERT INTO cinema (cinemaId, name, address, phone) VALUES (101,'Event Cinemas Bondi Junction', '500 Oxford St, Bondi Junction NSW 2022', '(02) 9273 7360');
INSERT INTO cinema (cinemaId, name, address, phone) VALUES (102,'Event Cinemas Macquarie Centre', 'Macquarie Shopping Centre Cnr Herring &, Waterloo Rd, North Ryde NSW 2113', '(02) 8879 3500');

INSERT INTO snack (snackId, name, price) VALUES (600,'Salted Popcorn', 8.20);
INSERT INTO snack (snackId, name, price) VALUES (601,'Sweet & Salty Popcorn', 10.50);
INSERT INTO snack (snackId, name, price) VALUES (602,'Mt Franklin 600 ml', 5.70);
INSERT INTO snack (snackId, name, price) VALUES (603,'Small Mt Franklin Combo', 13.50);
INSERT INTO snack (snackId, name, price) VALUES (604,'NO TIME TO DIE COMBO', 14.00);

INSERT INTO snackSold (cinema, snack) VALUES (100, 600);
INSERT INTO snackSold (cinema, snack) VALUES (100, 601);
INSERT INTO snackSold (cinema, snack) VALUES (100, 602);
INSERT INTO snackSold (cinema, snack) VALUES (100, 603);
INSERT INTO snackSold (cinema, snack) VALUES (100, 604);

INSERT INTO snackSold (cinema, snack) VALUES (101, 600);
INSERT INTO snackSold (cinema, snack) VALUES (101, 601);
INSERT INTO snackSold (cinema, snack) VALUES (101, 602);
INSERT INTO snackSold (cinema, snack) VALUES (101, 603);
INSERT INTO snackSold (cinema, snack) VALUES (101, 604);

INSERT INTO snackSold (cinema, snack) VALUES (102, 600);
INSERT INTO snackSold (cinema, snack) VALUES (102, 601);
INSERT INTO snackSold (cinema, snack) VALUES (102, 602);
INSERT INTO snackSold (cinema, snack) VALUES (102, 603);

INSERT INTO movie (movieId, title, description, cast) VALUES (200, 'No Time to Die', 'James Bond has left active service. His peace is short-lived when Felix Leiter, an old friend from the CIA, turns up asking for help, leading Bond onto the trail of a mysterious villain armed with dangerous new technology.', 'Daniel Craig');
INSERT INTO movie (movieId, title, description, cast) VALUES (201, 'Eternals', 'Marvel Studios’ Eternals welcomes an exciting new team of Super Heroes to the Marvel Cinematic Universe. The epic story, spanning thousands of years, features a group of immortal heroes forced out of the shadows to reunite against mankind’s oldest enemy, The Deviants', 'Gemma Chan');
INSERT INTO movie (movieId, title, description, cast) VALUES (202, 'Red Notice', "In the world of international crime, an Interpol agent attempts to hunt down and capture the world's most wanted art thief.", 'Ryan Reynolds');

INSERT INTO studio (studioId, cinema, name, type, price) VALUES (300, 100, 'Studio 1', 'original', 24.00);
INSERT INTO studio (studioId, cinema, name, type, price) VALUES (301, 100, 'Studio 2', 'v-max', 33.00);

INSERT INTO studio (studioId, cinema, name, type, price) VALUES (303, 101, 'Studio 1', 'original', 24.00);
INSERT INTO studio (studioId, cinema, name, type, price) VALUES (304, 101, 'Studio 2', 'v-max', 33.00);

INSERT INTO studio (studioId, cinema, name, type, price) VALUES (305, 102, 'Studio 1', 'original', 24.00);
INSERT INTO studio (studioId, cinema, name, type, price) VALUES (306, 102, 'Studio 2', 'v-max', 33.00);

-- Event Cinemas George Street Timeslot 
INSERT INTO timeslot (timeslotId, studio, movie, day, startTime, endTime) 
VALUES 
  (400, 300, 200, 'Monday', '13:00', '15:00'),
  (401, 300, 201, 'Monday', '15:00', '17:00'),
  (402, 300, 202, 'Monday', '17:00', '19:00'),
  (403, 300, 200, 'Monday', '19:00', '21:00'),
  (404, 300, 201, 'Monday', '21:00', '23:00'),

  (405, 301, 200, 'Monday', '13:00', '15:00'),
  (406, 301, 201, 'Monday', '15:00', '17:00'),
  (407, 301, 200, 'Monday', '17:00', '19:00'),
  (408, 301, 200, 'Monday', '19:00', '21:00'),
  (409, 301, 202, 'Monday', '21:00', '23:00'),

  (410, 300, 200, 'Tuesday', '13:00', '15:00'),
  (411, 300, 201, 'Tuesday', '15:00', '17:00'),
  (412, 300, 202, 'Tuesday', '17:00', '19:00'),
  (413, 300, 200, 'Tuesday', '19:00', '21:00'),
  (414, 300, 201, 'Tuesday', '21:00', '23:00'),

  (415, 301, 200, 'Tuesday', '13:00', '15:00'),
  (416, 301, 201, 'Tuesday', '15:00', '17:00'),
  (417, 301, 200, 'Tuesday', '17:00', '19:00'),
  (418, 301, 200, 'Tuesday', '19:00', '21:00'),
  (419, 301, 202, 'Tuesday', '21:00', '23:00'),

  (420, 300, 200, 'Wednesday', '13:00', '15:00'),
  (421, 300, 201, 'Wednesday', '15:00', '17:00'),
  (422, 300, 202, 'Wednesday', '17:00', '19:00'),
  (423, 300, 200, 'Wednesday', '19:00', '21:00'),
  (424, 300, 201, 'Wednesday', '21:00', '23:00'),

  (425, 301, 200, 'Wednesday', '13:00', '15:00'),
  (426, 301, 201, 'Wednesday', '15:00', '17:00'),
  (427, 301, 200, 'Wednesday', '17:00', '19:00'),
  (428, 301, 200, 'Wednesday', '19:00', '21:00'),
  (429, 301, 202, 'Wednesday', '21:00', '23:00'),

  (430, 300, 200, 'Thursday', '13:00', '15:00'),
  (431, 300, 201, 'Thursday', '15:00', '17:00'),
  (432, 300, 202, 'Thursday', '17:00', '19:00'),
  (433, 300, 200, 'Thursday', '19:00', '21:00'),
  (434, 300, 201, 'Thursday', '21:00', '23:00'),

  (435, 301, 200, 'Thursday', '13:00', '15:00'),
  (436, 301, 201, 'Thursday', '15:00', '17:00'),
  (437, 301, 200, 'Thursday', '17:00', '19:00'),
  (438, 301, 200, 'Thursday', '19:00', '21:00'),
  (439, 301, 202, 'Thursday', '21:00', '23:00'),

  (440, 300, 200, 'Friday', '13:00', '15:00'),
  (441, 300, 201, 'Friday', '15:00', '17:00'),
  (442, 300, 202, 'Friday', '17:00', '19:00'),
  (443, 300, 200, 'Friday', '19:00', '21:00'),
  (444, 300, 201, 'Friday', '21:00', '23:00'),

  (445, 301, 200, 'Friday', '13:00', '15:00'),
  (446, 301, 201, 'Friday', '15:00', '17:00'),
  (447, 301, 200, 'Friday', '17:00', '19:00'),
  (448, 301, 200, 'Friday', '19:00', '21:00'),
  (449, 301, 202, 'Friday', '21:00', '23:00'),

  (450, 300, 200, 'Saturday', '13:00', '15:00'),
  (451, 300, 201, 'Saturday', '15:00', '17:00'),
  (452, 300, 202, 'Saturday', '17:00', '19:00'),
  (453, 300, 200, 'Saturday', '19:00', '21:00'),
  (454, 300, 201, 'Saturday', '21:00', '23:00'),

  (455, 301, 200, 'Saturday', '13:00', '15:00'),
  (456, 301, 201, 'Saturday', '15:00', '17:00'),
  (457, 301, 200, 'Saturday', '17:00', '19:00'),
  (458, 301, 200, 'Saturday', '19:00', '21:00'),
  (459, 301, 202, 'Saturday', '21:00', '23:00');

-- Event Cinemas Bondi Junction Timeslot 
INSERT INTO timeslot (timeslotId, studio, movie, day, startTime, endTime) 
VALUES 
  (460, 303, 200, 'Monday', '13:00', '15:00'),
  (461, 303, 201, 'Monday', '15:00', '17:00'),
  (462, 303, 202, 'Monday', '17:00', '19:00'),
  (463, 303, 200, 'Monday', '19:00', '21:00'),
  (464, 303, 201, 'Monday', '21:00', '23:00'),

  (465, 304, 200, 'Monday', '13:00', '15:00'),
  (466, 304, 201, 'Monday', '15:00', '17:00'),
  (467, 304, 200, 'Monday', '17:00', '19:00'),
  (468, 304, 200, 'Monday', '19:00', '21:00'),
  (469, 304, 202, 'Monday', '21:00', '23:00'),

  (470, 303, 200, 'Tuesday', '13:00', '15:00'),
  (471, 303, 201, 'Tuesday', '15:00', '17:00'),
  (472, 303, 202, 'Tuesday', '17:00', '19:00'),
  (473, 303, 200, 'Tuesday', '19:00', '21:00'),
  (474, 303, 201, 'Tuesday', '21:00', '23:00'),

  (475, 304, 200, 'Tuesday', '13:00', '15:00'),
  (476, 304, 201, 'Tuesday', '15:00', '17:00'),
  (477, 304, 200, 'Tuesday', '17:00', '19:00'),
  (478, 304, 200, 'Tuesday', '19:00', '21:00'),
  (479, 304, 202, 'Tuesday', '21:00', '23:00'),

  (480, 303, 200, 'Wednesday', '13:00', '15:00'),
  (481, 303, 201, 'Wednesday', '15:00', '17:00'),
  (482, 303, 202, 'Wednesday', '17:00', '19:00'),
  (483, 303, 200, 'Wednesday', '19:00', '21:00'),
  (484, 303, 201, 'Wednesday', '21:00', '23:00'),

  (485, 304, 200, 'Wednesday', '13:00', '15:00'),
  (486, 304, 201, 'Wednesday', '15:00', '17:00'),
  (487, 304, 200, 'Wednesday', '17:00', '19:00'),
  (488, 304, 200, 'Wednesday', '19:00', '21:00'),
  (489, 304, 202, 'Wednesday', '21:00', '23:00'),

  (490, 303, 200, 'Thursday', '13:00', '15:00'),
  (491, 303, 201, 'Thursday', '15:00', '17:00'),
  (492, 303, 202, 'Thursday', '17:00', '19:00'),
  (493, 303, 200, 'Thursday', '19:00', '21:00'),
  (494, 303, 201, 'Thursday', '21:00', '23:00'),

  (495, 304, 200, 'Thursday', '13:00', '15:00'),
  (496, 304, 201, 'Thursday', '15:00', '17:00'),
  (497, 304, 200, 'Thursday', '17:00', '19:00'),
  (498, 304, 200, 'Thursday', '19:00', '21:00'),
  (499, 304, 202, 'Thursday', '21:00', '23:00'),

  (500, 303, 200, 'Friday', '13:00', '15:00'),
  (501, 303, 201, 'Friday', '15:00', '17:00'),
  (502, 303, 202, 'Friday', '17:00', '19:00'),
  (503, 303, 200, 'Friday', '19:00', '21:00'),
  (504, 303, 201, 'Friday', '21:00', '23:00'),

  (505, 304, 200, 'Friday', '13:00', '15:00'),
  (506, 304, 201, 'Friday', '15:00', '17:00'),
  (507, 304, 200, 'Friday', '17:00', '19:00'),
  (508, 304, 200, 'Friday', '19:00', '21:00'),
  (509, 304, 202, 'Friday', '21:00', '23:00'),

  (510, 303, 200, 'Saturday', '13:00', '15:00'),
  (511, 303, 201, 'Saturday', '15:00', '17:00'),
  (512, 303, 202, 'Saturday', '17:00', '19:00'),
  (513, 303, 200, 'Saturday', '19:00', '21:00'),
  (514, 303, 201, 'Saturday', '21:00', '23:00'),

  (515, 304, 200, 'Saturday', '13:00', '15:00'),
  (516, 304, 201, 'Saturday', '15:00', '17:00'),
  (517, 304, 200, 'Saturday', '17:00', '19:00'),
  (518, 304, 200, 'Saturday', '19:00', '21:00'),
  (519, 304, 202, 'Saturday', '21:00', '23:00');

  -- Event Cinemas Macquarie Centre Timeslot 
INSERT INTO timeslot (timeslotId, studio, movie, day, startTime, endTime) 
VALUES 
  (520, 305, 200, 'Monday', '13:00', '15:00'),
  (521, 305, 201, 'Monday', '15:00', '17:00'),
  (522, 305, 202, 'Monday', '17:00', '19:00'),
  (523, 305, 200, 'Monday', '19:00', '21:00'),
  (524, 305, 201, 'Monday', '21:00', '23:00'),

  (525, 306, 200, 'Monday', '13:00', '15:00'),
  (526, 306, 201, 'Monday', '15:00', '17:00'),
  (527, 306, 200, 'Monday', '17:00', '19:00'),
  (528, 306, 200, 'Monday', '19:00', '21:00'),
  (529, 306, 202, 'Monday', '21:00', '23:00'),

  (530, 305, 200, 'Tuesday', '13:00', '15:00'),
  (531, 305, 201, 'Tuesday', '15:00', '17:00'),
  (532, 305, 202, 'Tuesday', '17:00', '19:00'),
  (533, 305, 200, 'Tuesday', '19:00', '21:00'),
  (534, 305, 201, 'Tuesday', '21:00', '23:00'),

  (535, 306, 200, 'Tuesday', '13:00', '15:00'),
  (536, 306, 201, 'Tuesday', '15:00', '17:00'),
  (537, 306, 200, 'Tuesday', '17:00', '19:00'),
  (538, 306, 200, 'Tuesday', '19:00', '21:00'),
  (539, 306, 202, 'Tuesday', '21:00', '23:00'),

  (540, 305, 200, 'Wednesday', '13:00', '15:00'),
  (541, 305, 201, 'Wednesday', '15:00', '17:00'),
  (542, 305, 202, 'Wednesday', '17:00', '19:00'),
  (543, 305, 200, 'Wednesday', '19:00', '21:00'),
  (544, 305, 201, 'Wednesday', '21:00', '23:00'),

  (545, 306, 200, 'Wednesday', '13:00', '15:00'),
  (546, 306, 201, 'Wednesday', '15:00', '17:00'),
  (547, 306, 200, 'Wednesday', '17:00', '19:00'),
  (548, 306, 200, 'Wednesday', '19:00', '21:00'),
  (549, 306, 202, 'Wednesday', '21:00', '23:00'),

  (550, 305, 200, 'Thursday', '13:00', '15:00'),
  (551, 305, 201, 'Thursday', '15:00', '17:00'),
  (552, 305, 202, 'Thursday', '17:00', '19:00'),
  (553, 305, 200, 'Thursday', '19:00', '21:00'),
  (554, 305, 201, 'Thursday', '21:00', '23:00'),

  (555, 306, 200, 'Thursday', '13:00', '15:00'),
  (556, 306, 201, 'Thursday', '15:00', '17:00'),
  (557, 306, 200, 'Thursday', '17:00', '19:00'),
  (558, 306, 200, 'Thursday', '19:00', '21:00'),
  (559, 306, 202, 'Thursday', '21:00', '23:00'),

  (560, 305, 200, 'Friday', '13:00', '15:00'),
  (561, 305, 201, 'Friday', '15:00', '17:00'),
  (562, 305, 202, 'Friday', '17:00', '19:00'),
  (563, 305, 200, 'Friday', '19:00', '21:00'),
  (564, 305, 201, 'Friday', '21:00', '23:00'),

  (565, 306, 200, 'Friday', '13:00', '15:00'),
  (566, 306, 201, 'Friday', '15:00', '17:00'),
  (567, 306, 200, 'Friday', '17:00', '19:00'),
  (568, 306, 200, 'Friday', '19:00', '21:00'),
  (569, 306, 202, 'Friday', '21:00', '23:00'),

  (570, 305, 200, 'Saturday', '13:00', '15:00'),
  (571, 305, 201, 'Saturday', '15:00', '17:00'),
  (572, 305, 202, 'Saturday', '17:00', '19:00'),
  (573, 305, 200, 'Saturday', '19:00', '21:00'),
  (574, 305, 201, 'Saturday', '21:00', '23:00'),

  (575, 306, 200, 'Saturday', '13:00', '15:00'),
  (576, 306, 201, 'Saturday', '15:00', '17:00'),
  (577, 306, 200, 'Saturday', '17:00', '19:00'),
  (578, 306, 200, 'Saturday', '19:00', '21:00'),
  (579, 306, 202, 'Saturday', '21:00', '23:00');

INSERT INTO studioSeat (studioSeatId, seatNumber, studio) 
VALUES 
  (700, 1, 300),
  (701, 2, 300),
  (702, 3, 300),
  (703, 4, 300),
  (704, 5, 300),
  (705, 6, 300),
  (706, 7, 300),
  (707, 8, 300),
  (708, 9, 300),
  (709, 10, 300),
  (710, 11, 300),
  (711, 12, 300),
  (712, 13, 300),
  (713, 14, 300),
  (714, 15, 300),
  (715, 1, 301),
  (716, 2, 301),
  (717, 3, 301),
  (718, 4, 301),
  (719, 5, 301),
  (720, 6, 301),
  (721, 7, 301),
  (722, 8, 301),
  (723, 9, 301),
  (724, 10, 301),
  (725, 11, 301),
  (726, 12, 301),
  (727, 13, 301),
  (728, 14, 301),
  (729, 15, 301),
  (730, 1, 303),
  (731, 2, 303),
  (732, 3, 303),
  (733, 4, 303),
  (734, 5, 303),
  (735, 6, 303),
  (736, 7, 303),
  (737, 8, 303),
  (738, 9, 303),
  (739, 10, 303),
  (740, 11, 303),
  (741, 12, 303),
  (742, 13, 303),
  (743, 14, 303),
  (744, 15, 303),
  (745, 1, 304),
  (746, 2, 304),
  (747, 3, 304),
  (748, 4, 304),
  (749, 5, 304),
  (750, 6, 304),
  (751, 7, 304),
  (752, 8, 304),
  (753, 9, 304),
  (754, 10, 304),
  (755, 11, 304),
  (756, 12, 304),
  (757, 13, 304),
  (758, 14, 304),
  (759, 15, 304),
  (760, 1, 305),
  (761, 2, 305),
  (762, 3, 305),
  (763, 4, 305),
  (764, 5, 305),
  (765, 6, 305),
  (766, 7, 305),
  (767, 8, 305),
  (768, 9, 305),
  (769, 10, 305),
  (770, 11, 305),
  (771, 12, 305),
  (772, 13, 305),
  (773, 14, 305),
  (774, 15, 305),
  (775, 1, 306),
  (776, 2, 306),
  (777, 3, 306),
  (778, 4, 306),
  (779, 5, 306),
  (780, 6, 306),
  (781, 7, 306),
  (782, 8, 306),
  (783, 9, 306),
  (784, 10, 306),
  (785, 11, 306),
  (786, 12, 306),
  (787, 13, 306),
  (788, 14, 306),
  (789, 15, 306);

-- Monday 13:00 - 15:00
INSERT INTO timeslotSeat (timeslotSeatId, status, studioSeat, timeslot) 
VALUES
  (800, 'available', 700, 400),
  (801, 'available', 701, 400),
  (802, 'available', 702, 400),
  (803, 'available', 703, 400),
  (804, 'available', 704, 400),
  (805, 'available', 705, 400),
  (806, 'available', 706, 400),
  (807, 'available', 707, 400),
  (808, 'available', 708, 400),
  (809, 'available', 709, 400),
  (810, 'available', 710, 400),
  (811, 'available', 711, 400),
  (812, 'available', 712, 400),
  (813, 'available', 713, 400),
  (814, 'available', 714, 400),
  (815, 'available', 715, 400),
  (816, 'available', 716, 400),
  (817, 'available', 717, 400),
  (818, 'available', 718, 400),
  (819, 'available', 719, 400),
  (820, 'available', 720, 400),
  (821, 'available', 721, 400),
  (822, 'available', 722, 400),
  (823, 'available', 723, 400),
  (824, 'available', 724, 400),
  (825, 'available', 725, 400),
  (826, 'available', 726, 400),
  (827, 'available', 727, 400),
  (828, 'available', 728, 400),
  (829, 'available', 729, 400),
  (830, 'available', 730, 400),
  (831, 'available', 731, 400),
  (832, 'available', 732, 400),
  (833, 'available', 733, 400),
  (834, 'available', 734, 400),
  (835, 'available', 735, 400),
  (836, 'available', 736, 400),
  (837, 'available', 737, 400),
  (838, 'available', 738, 400),
  (839, 'available', 739, 400),
  (840, 'available', 740, 400),
  (841, 'available', 741, 400),
  (842, 'available', 742, 400),
  (843, 'available', 743, 400),
  (844, 'available', 744, 400),
  (845, 'available', 745, 400),
  (846, 'available', 746, 400),
  (847, 'available', 747, 400),
  (848, 'available', 748, 400),
  (849, 'available', 749, 400),
  (850, 'available', 750, 400),
  (851, 'available', 751, 400),
  (852, 'available', 752, 400),
  (853, 'available', 753, 400),
  (854, 'available', 754, 400),
  (855, 'available', 755, 400),
  (856, 'available', 756, 400),
  (857, 'available', 757, 400),
  (858, 'available', 758, 400),
  (859, 'available', 759, 400),
  (860, 'available', 760, 400),
  (861, 'available', 761, 400),
  (862, 'available', 762, 400),
  (863, 'available', 763, 400),
  (864, 'available', 764, 400),
  (865, 'available', 765, 400),
  (866, 'available', 766, 400),
  (867, 'available', 767, 400),
  (868, 'available', 768, 400),
  (869, 'available', 769, 400),
  (870, 'available', 770, 400),
  (871, 'available', 771, 400),
  (872, 'available', 772, 400),
  (873, 'available', 773, 400),
  (874, 'available', 774, 400),
  (875, 'available', 775, 400),
  (876, 'available', 776, 400),
  (877, 'available', 777, 400),
  (878, 'available', 778, 400),
  (879, 'available', 779, 400),
  (880, 'available', 780, 400),
  (881, 'available', 781, 400),
  (882, 'available', 782, 400),
  (883, 'available', 783, 400),
  (884, 'available', 784, 400),
  (885, 'available', 785, 400),
  (886, 'available', 786, 400),
  (887, 'available', 787, 400),
  (888, 'available', 788, 400),
  (889, 'available', 789, 400);

-- Monday 19:00 - 21:00
INSERT INTO timeslotSeat (timeslotSeatId, status, studioSeat, timeslot) 
VALUES
  (890, 'available', 700, 401),
  (891, 'available', 701, 401),
  (892, 'available', 702, 401),
  (893, 'available', 703, 401),
  (894, 'available', 704, 401),
  (895, 'available', 705, 401),
  (896, 'available', 706, 401),
  (897, 'available', 707, 401),
  (898, 'available', 708, 401),
  (899, 'available', 709, 401),
  (900, 'available', 710, 401),
  (901, 'available', 711, 401),
  (902, 'available', 712, 401),
  (903, 'available', 713, 401),
  (904, 'available', 714, 401),
  (905, 'available', 715, 401),
  (906, 'available', 716, 401),
  (907, 'available', 717, 401),
  (908, 'available', 718, 401),
  (909, 'available', 719, 401),
  (910, 'available', 720, 401),
  (911, 'available', 721, 401),
  (912, 'available', 722, 401),
  (913, 'available', 723, 401),
  (914, 'available', 724, 401),
  (915, 'available', 725, 401),
  (916, 'available', 726, 401),
  (917, 'available', 727, 401),
  (918, 'available', 728, 401),
  (919, 'available', 729, 401),
  (920, 'available', 730, 401),
  (921, 'available', 731, 401),
  (922, 'available', 732, 401),
  (923, 'available', 733, 401),
  (924, 'available', 734, 401),
  (925, 'available', 735, 401),
  (926, 'available', 736, 401),
  (927, 'available', 737, 401),
  (928, 'available', 738, 401),
  (929, 'available', 739, 401),
  (930, 'available', 740, 401),
  (931, 'available', 741, 401),
  (932, 'available', 742, 401),
  (933, 'available', 743, 401),
  (934, 'available', 744, 401),
  (935, 'available', 745, 401),
  (936, 'available', 746, 401),
  (937, 'available', 747, 401),
  (938, 'available', 748, 401),
  (939, 'available', 749, 401),
  (940, 'available', 750, 401),
  (941, 'available', 751, 401),
  (942, 'available', 752, 401),
  (943, 'available', 753, 401),
  (944, 'available', 754, 401),
  (945, 'available', 755, 401),
  (946, 'available', 756, 401),
  (947, 'available', 757, 401),
  (948, 'available', 758, 401),
  (949, 'available', 759, 401),
  (950, 'available', 760, 401),
  (951, 'available', 761, 401),
  (952, 'available', 762, 401),
  (953, 'available', 763, 401),
  (954, 'available', 764, 401),
  (955, 'available', 765, 401),
  (956, 'available', 766, 401),
  (957, 'available', 767, 401),
  (958, 'available', 768, 401),
  (959, 'available', 769, 401),
  (960, 'available', 770, 401),
  (961, 'available', 771, 401),
  (962, 'available', 772, 401),
  (963, 'available', 773, 401),
  (964, 'available', 774, 401),
  (965, 'available', 775, 401),
  (966, 'available', 776, 401),
  (967, 'available', 777, 401),
  (968, 'available', 778, 401),
  (969, 'available', 779, 401),
  (970, 'available', 780, 401),
  (971, 'available', 781, 401),
  (972, 'available', 782, 401),
  (973, 'available', 783, 401),
  (974, 'available', 784, 401),
  (975, 'available', 785, 401),
  (976, 'available', 786, 401),
  (977, 'available', 787, 401),
  (978, 'available', 788, 401),
  (979, 'available', 789, 401);

DELIMITER //
CREATE PROCEDURE myproc()
BEGIN
  DECLARE x int DEFAULT 980;
  DECLARE i int DEFAULT 402;
  DECLARE j int DEFAULT 700;
  WHILE (i < 580) DO
    SET j = 700;
    WHILE (j < 790) DO
      INSERT INTO timeslotSeat (timeslotSeatId, status, studioSeat, timeslot) VALUES (x, 'available', j, i);
      SET j = j + 1;
      SET x = x + 1;
    END WHILE;
    SET i = i + 1;
  END WHILE;
END;
//  
DELIMITER ;

CALL myproc();