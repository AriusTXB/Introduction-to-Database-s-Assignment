DROP DATABASE csdl;

CREATE DATABASE csdl;

USE csdl;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    date_joined DATE NOT NULL
);

CREATE TABLE Albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL
);

CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE Songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    album_id INT,
    genre_id INT,
    duration INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id),
	FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE SongContributor (
    song_id INT,
    artist_id INT,
    PRIMARY KEY (song_id, artist_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

CREATE TABLE AlbumCategories (
    album_id INT,
    genre_id INT,
    PRIMARY KEY (album_id, genre_id),
    FOREIGN KEY (album_id) REFERENCES Albums(album_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE ArtistStyles (
    artist_id INT,
    genre_id INT,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Recommendations (
    recommendation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    song_id INT,
    recommendation_reason TEXT,
    time_stamp DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

CREATE TABLE PlaybackHistory (
    user_id INT,
    song_id INT,
    total_time INT NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

CREATE TABLE Subscriptions (
    subscription_id INT AUTO_INCREMENT,
    user_id INT,
    subscription_type VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY (subscription_id, user_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Ensures each album name is unique
ALTER TABLE Albums
ADD CONSTRAINT unique_album_name UNIQUE (album_name);

-- Validates that the song's duration is greater than zero
ALTER TABLE Songs
ADD CONSTRAINT check_song_duration CHECK (duration > 0);

-- Ensures the subscription_type column contains valid values like 'Free', 'Premium', etc
ALTER TABLE Subscriptions
ADD CONSTRAINT check_subscription_type CHECK (subscription_type IN ('Free', 'Standard', 'Premium'));

INSERT INTO Users (user_id, name, email, password, date_joined) VALUES
(1, 'John Doe', 'john.doe@example.com', 'pass123', '2024-01-01'),
(2, 'Jane Smith', 'jane.smith@example.com', 'secure456', '2024-01-15'),
(3, 'Alice Johnson', 'alice.j@example.com', 'qwerty789', '2024-02-10'),
(4, 'Bob Williams', 'bob.w@example.com', 'abc123', '2024-02-20'),
(5, 'Charlie Brown', 'charlie.b@example.com', 'zxcvb456', '2024-03-05'),
(6, 'Daniel Green', 'daniel.g@example.com', 'hello123', '2024-03-10'),
(7, 'Emma Taylor', 'emma.t@example.com', 'welcome1', '2024-03-12'),
(8, 'Fiona White', 'fiona.w@example.com', 'testpass', '2024-03-15'),
(9, 'George Black', 'george.b@example.com', 'dragon77', '2024-03-18'),
(10, 'Hannah Scott', 'hannah.s@example.com', 'passme789', '2024-03-22'),
(11, 'Ian Clark', 'ian.c@example.com', 'sunshine1', '2024-03-25'),
(12, 'Julia Adams', 'julia.a@example.com', 'mysecret', '2024-03-27'),
(13, 'Kevin Moore', 'kevin.m@example.com', 'football9', '2024-03-30'),
(14, 'Laura Walker', 'laura.w@example.com', 'monkey88', '2024-04-01'),
(15, 'Michael Hall', 'michael.h@example.com', 'passw0rd', '2024-04-03'),
(16, 'Natalie King', 'natalie.k@example.com', 'password2', '2024-04-05'),
(17, 'Oliver Evans', 'oliver.e@example.com', 'letmein22', '2024-04-07'),
(18, 'Patricia Hughes', 'patricia.h@example.com', 'flower88', '2024-04-10'),
(19, 'Quentin Lewis', 'quentin.l@example.com', 'seashell9', '2024-04-12'),
(20, 'Rachel Foster', 'rachel.f@example.com', 'unicorn5', '2024-04-15');

INSERT INTO Albums (album_id, album_name) VALUES
(1, 'Part & Parcel (Recorded Delivery)'),
(2, 'Bailamos Otra Vez'),
(3, 'Sol (From "Ponniyin Selvan Part-1") [Original Motion Picture Soundtrack]'),
(4, 'A Thought Evoked'),
(5, 'Isles'),
(6, 'Nunca Foi Sorte, Sempre Foi Deus'),
(7, 'HYbr:ID I'),
(8, 'Eternal Roamer'),
(9, 'Ate Sandali'),
(10, 'American Dream'),
(11, 'GOD JUL'),
(12, 'Come Home The Kids Miss You'),
(13, 'Andrew McMahon In The Wilderness'),
(14, 'Bodhai Kaname (From "Oh Manapenne")'),
(15, 'Ditados Populares Dançantes'),
(16, 'GAL'),
(17, 'I Know You (Remixes) (feat. Bastille)'),
(18, '金八'),
(19, 'Ruffneck Rules Da Art-Core Scene'),
(20, 'Sorel Soviet So What'),
(21, 'Sentient'),
(22, 'When you are gone'),
(23, 'O Fracasso Não É o Fim'),
(24, 'Pearl'),
(25, 'My My My Girl'),
(26, 'The Solace System'),
(27, 'Gustavo Mioto Ao Vivo Em São Paulo'),
(28, 'A.D.R.O.M.I.C.F.M.S. 2'),
(29, 'Style (Prod By Cosmo)'),
(30, 'Quebrante'),
(31, 'Хочу лететь на пламя!'),
(32, 'Friendships (Lost My Love) [Gabry Ponte Remix]'),
(33, 'SOUTHERN ALL STARS'),
(34, 'Rhythm Of The Rain'),
(35, 'Niveau Weshalb Warum'),
(36, 'Origin of Sin'),
(37, 'Weekend On A Tuesday'),
(38, 'What Did I Do?'),
(39, 'Canto Sagrado - Uma Homenagem à Clara Nunes'),
(40, 'UNDERGROUND BLACK METAL'),
(41, 'The Velvet Underground & Nico 45th Anniversary'),
(42, 'The Root of All Evil'),
(43, 'Sister'),
(44, 'Technoid Concept Issue 17'),
(45, 'Berretín'),
(46, 'Dance With The Devil'),
(47, 'Screw the Roses'),
(48, 'RAM Drum & Bass Annual 2016'),
(49, 'Your Grace Finds Me (Live)'),
(50, 'End of The Day');

INSERT INTO Genres (genre_id, genre_name) VALUES
(1, 'acoustic'),
(2, 'afrobeat'),
(3, 'ambient'),
(4, 'blues'),
(5, 'brazil'),
(6, 'british'),
(7, 'chill'),
(8, 'country'),
(9, 'dancehall'),
(10, 'death-metal'),
(11, 'detroit-techno'),
(12, 'drum-and-bass'),
(13, 'dub'),
(14, 'electronic'),
(15, 'forro'),
(16, 'german'),
(17, 'gospel'),
(18, 'goth'),
(19, 'grindcore'),
(20, 'groove'),
(21, 'happy'),
(22, 'hardstyle'),
(23, 'heavy-metal'),
(24, 'idm'),
(25, 'iranian'),
(26, 'j-idol'),
(27, 'j-pop'),
(28, 'jazz'),
(29, 'k-pop'),
(30, 'minimal-techno'),
(31, 'opera'),
(32, 'piano'),
(33, 'pop-film'),
(34, 'pop'),
(35, 'progressive-house'),
(36, 'psych-rock'),
(37, 'r-n-b'),
(38, 'rock-n-roll'),
(39, 'rockabilly'),
(40, 'romance'),
(41, 'sad'),
(42, 'salsa'),
(43, 'samba'),
(44, 'sertanejo'),
(45, 'singer-songwriter'),
(46, 'ska'),
(47, 'songwriter'),
(48, 'soul'),
(49, 'spanish'),
(50, 'swedish'),
(51, 'tango'),
(52, 'techno'),
(53, 'world-music');

INSERT INTO Songs (song_id, title, album_id, genre_id, duration) VALUES
(1, 'Di Papakawalan', 9, 1, 244),
(2, 'Laro Laro Laro', 9, 1, 174),
(3, 'Vem', 15, 2, 73),
(4, 'Feitiço', 15, 2, 262),
(5, 'Lambe-Lambe', 15, 2, 205),
(6, 'Haja Axé', 15, 2, 283),
(7, 'Reflertar', 15, 2, 198),
(8, 'Chama Arteira', 15, 2, 262),
(9, 'Só', 15, 2, 229),
(10, 'Imensidão', 15, 2, 196),
(11, 'Vermelhos de Ciclos', 15, 2, 242),
(12, 'Sincronia', 15, 2, 212),
(13, 'Apricots', 5, 3, 246),
(14, 'Lido', 5, 3, 200),
(15, 'Sentient', 21, 3, 205),
(16, 'Atlas', 5, 3, 348),
(17, 'Sleigh Ride', 11, 4, 175),
(18, 'Rudolph The Red-Nosed Reindeer', 11, 4, 171),
(19, 'Hola les lolos', 20, 4, 257),
(20, 'O Fracasso Não É o Fim', 23, 5, 289),
(21, 'I Know You (feat. Bastille) - Vigiland Remix', 17, 6, 183),
(22, 'End of The Day', 50, 7, 157),
(23, 'Pearl', 24, 7, 192),
(24, 'A Holly Jolly Christmas', 11, 8, 122),
(25, 'Style', 29, 9, 184),
(26, 'Origin of Sin', 36, 10, 265),
(27, 'The Immortal - 2009 Version', 42, 10, 227),
(28, 'Shaper of the Unknown', 47, 11, 327),
(29, 'Prowler', 47, 11, 460),
(30, 'Breathe (feat. Dave Gibson)', 48, 12, 192),
(31, 'Out My Mind', 1, 13, 245),
(32, 'When you are gone', 22, 14, 180),
(33, 'Apricots', 5, 14, 246),
(34, 'Nunca Foi Sorte, Sempre Foi Deus', 6, 15, 200),
(35, 'Die Welt ist fertig', 35, 16, 219),
(36, 'Porzellan und Elefanten', 35, 16, 216),
(37, 'O Fracasso Não É o Fim', 23, 17, 289),
(38, 'Nunca Foi Sorte, Sempre Foi Deus', 6, 17, 200),
(39, 'Decoded Poetry', 26, 18, 385),
(40, 'Nós Somos o Veneno', 30, 19, 65),
(41, 'A Farsa: Nojo', 30, 19, 57),
(42, 'Deixa o Caos Entrar', 30, 19, 48),
(43, 'Apenas Mais um Igual a Mim', 30, 19, 82),
(44, 'Friendships (Lost My Love) - Gabry Ponte Remix', 32, 20, 156),
(45, 'Dont Fuck With a Ruffneck - Anthem', 19, 21, 196),
(46, 'Dance With The Devil', 46, 22, 252),
(47, 'A Buried Sun', 43, 23, 442),
(48, 'HYbr:ID oval collider', 7, 24, 379),
(49, 'HYbr:ID oval noise', 7, 24, 240),
(50, 'WAREHOUSE OF BAD LUCK', 40, 25, 412),
(51, 'バタフライエフェクト', 18, 26, 267),
(52, 'ハイタテキ!', 18, 26, 283),
(53, '金八DANCE MUSIC', 18, 26, 326),
(54, 'GAL', 16, 27, 173),
(55, 'YOU', 33, 27, 271),
(56, 'フリフリ 65', 33, 27, 216),
(57, 'Sleigh Ride', 11, 28, 175),
(58, 'Rudolph The Red-Nosed Reindeer', 11, 28, 171),
(59, 'The Christmas Song (Merry Christmas To You)', 11, 28, 192),
(60, 'Let It Snow, Let It Snow, Let It Snow - Remastered', 11, 28, 121),
(61, 'First Class', 12, 29, 173),
(62, 'Churchill Downs (feat. Drake)', 12, 29, 309),
(63, 'Levitate - Original Mix', 44, 30, 491),
(64, 'Decoded Poetry', 26, 31, 385),
(65, 'A Thought Evoked', 4, 32, 174),
(66, 'Cecilia And The Satellite', 13, 32, 223),
(67, 'Sol (From "Ponniyin Selvan Part-1")', 3, 33, 134),
(68, 'Mistletoe', 11, 34, 183),
(69, 'Bodhai Kaname - From "Oh Manapenne"', 14, 34, 261),
(70, 'Have Yourself A Merry Little Christmas', 11, 34, 170),
(71, 'Weekend On A Tuesday', 37, 35, 139),
(72, 'Femme Fatale', 41, 36, 159),
(73, 'Sunday Morning', 41, 36, 175),
(74, 'Ill Be Your Mirror', 41, 36, 134),
(75, 'Venus In Furs', 41, 36, 312),
(76, 'Heroin', 41, 36, 433),
(77, 'Clear Blue Skies', 10, 36, 187),
(78, 'Rhythm of the Rain', 34, 37, 146),
(79, 'Rhythm of the Rain', 34, 38, 146),
(80, 'Rockin Around The Christmas Tree', 11, 39, 123),
(81, 'Снег', 31, 40, 292),
(82, 'My My My Girl', 25, 41, 130),
(83, 'Tú y Yo Tenemos', 2, 42, 240),
(84, 'Tristeza Pé No Chão', 39, 43, 264),
(85, 'Apaixonado E Meio - Ao Vivo', 27, 44, 170),
(86, 'What Did I Do?', 38, 45, 215),
(87, 'Its Beginning To Look A Lot Like Christmas', 11, 46, 164),
(88, 'What Did I Do?', 38, 47, 215),
(89, 'Santa Claus Is Coming To Town', 11, 48, 144),
(90, 'Ready Pa Morir', 28, 49, 191),
(91, 'Little Things', 11, 50, 188),
(92, 'Happy New Year', 11, 50, 184),
(93, 'Vår dröm om julen', 11, 50, 240),
(94, 'Vintersång', 11, 50, 232),
(95, 'Kungar av December', 11, 50, 173),
(96, 'Julen kan hjälpa', 11, 50, 180),
(97, 'Koppången', 11, 50, 211),
(98, 'Its Beginning To Look A Lot Like Christmas', 11, 50, 164),
(99, 'Berretin', 45, 51, 159),
(100, 'Alma De Loca', 45, 51, 154),
(101, 'Eternal Roamer', 8, 52, 387),
(102, 'Your Grace Finds Me - Live', 49, 53, 340);

INSERT INTO Artists (artist_id, name) VALUES
(1, 'Maris Racal'), 
(2, 'Samuca e a Selva'), 
(3, 'Illy'), 
(4, 'Onã'), 
(5, 'Bicep'), 
(6, 'Gavin Luke'), 
(7, 'Ella Fitzgerald'), 
(8, 'Bernard Adamus'), 
(9, 'Gerson Rufino'), 
(10, 'Craig David'), 
(11, 'Bastille'), 
(12, 'Vigiland'), 
(13, 'Rangga Jones'), 
(14, 'ZIONN'), 
(15, 'Larissa Lambert'), 
(16, 'Lady A'), 
(17, 'Stefflon Don'), 
(18, 'Chelsea Grin'), 
(19, 'Arch Enemy'), 
(20, 'Surgeon'), 
(21, 'DC Breaks'), 
(22, 'Dave Gibson'), 
(23, 'The Skints'), 
(24, '6091'), 
(25, 'Krameri'), 
(26, 'Banda Som e Louvor'), 
(27, 'Deichkind'), 
(28, 'Epica'), 
(29, 'Facada'), 
(30, 'Pascal Letoublon'), 
(31, 'Gabry Ponte'), 
(32, 'Leony'), 
(33, 'Juggernaut'), 
(34, 'Ran-D'), 
(35, 'D-Sturb'), 
(36, 'XCEPTION'), 
(37, 'In Solitude'), 
(38, 'alva noto'), 
(39, 'Garhelenth'), 
(40, 'Shiritsu Ebisu Chugaku'), 
(41, 'OHAYO'), 
(42, 'Shake Pepper'), 
(43, 'Yvngboi P'), 
(44, 'サザンオールスターズ'), 
(45, 'Nat King Cole'), 
(46, 'Dean Martin'), 
(47, 'Jack Harlow'), 
(48, 'Drake'), 
(49, 'Mario Ochoa'), 
(50, 'Chloé Czans'), 
(51, 'Andrew McMahon in the Wilderness'), 
(52, 'A.R. Rahman'), 
(53, 'Rakshita Suresh'), 
(54, 'Justin Bieber'), 
(55, 'Vishal Chandrashekhar'), 
(56, 'Anirudh Ravichander'), 
(57, 'Shashaa Tirupati'), 
(58, 'Sam Smith'), 
(59, 'R3HAB'), 
(60, 'Laidback Luke'), 
(61, 'The Velvet Underground'), 
(62, 'Nico'), 
(63, 'Crosby, Stills, Nash & Young'), 
(64, 'The Cascades'), 
(65, 'Brenda Lee'), 
(66, 'Vladimir Nechaev'), 
(67, 'poofi.'), 
(68, 'Ronald Borjas'), 
(69, 'Fabiana Cozza'), 
(70, 'Gustavo Mioto'), 
(71, 'Hayd'), 
(72, 'Jill Johnson'), 
(73, 'The Jackson 5'), 
(74, 'Yung Beef'), 
(75, 'Steve Lean'), 
(76, 'ABBA'), 
(77, 'LOVA'), 
(78, 'Carola'), 
(79, 'Danny Saucedo'), 
(80, 'Niello'), 
(81, 'Helen Sjöholm'), 
(82, 'Anna Stadling'), 
(83, 'Roberto Goyeneche'), 
(84, 'ENØS'), 
(85, 'Matt Redman');

INSERT INTO SongContributor (song_id, artist_id) VALUES
(1, 1), 
(2, 1), 
(3, 2), 
(4, 2), 
(5, 2), 
(5, 3), 
(6, 2), 
(6, 4), 
(7, 2), 
(8, 2), 
(9, 2), 
(10, 2), 
(11, 2), 
(12, 2), 
(14, 5), 
(15, 6), 
(16, 5), 
(17, 7), 
(19, 8), 
(21, 10), 
(21, 11), 
(21, 12), 
(22, 13), 
(22, 14), 
(23, 15), 
(24, 16), 
(25, 17), 
(26, 18), 
(27, 19), 
(28, 20), 
(29, 20), 
(30, 21), 
(30, 22), 
(31, 23), 
(32, 24), 
(32, 25), 
(13, 5), 
(35, 27), 
(36, 27), 
(20, 9), 
(34, 26), 
(40, 29), 
(41, 29), 
(42, 29), 
(43, 29), 
(44, 30), 
(44, 31), 
(44, 32), 
(45, 33), 
(46, 34), 
(46, 35), 
(46, 36), 
(47, 37), 
(48, 38), 
(49, 38), 
(50, 39), 
(51, 40), 
(52, 40), 
(53, 40), 
(54, 41), 
(54, 42), 
(54, 43), 
(55, 44), 
(56, 44), 
(18, 7), 
(59, 45), 
(60, 46), 
(61, 47), 
(62, 47), 
(62, 48), 
(63, 49), 
(39, 28), 
(65, 50), 
(66, 51), 
(67, 52), 
(67, 53), 
(68, 54), 
(69, 55), 
(69, 56), 
(69, 57), 
(70, 58), 
(71, 59), 
(71, 60), 
(72, 61), 
(72, 62), 
(73, 61), 
(73, 62), 
(74, 61), 
(74, 62), 
(75, 61), 
(75, 62), 
(76, 61), 
(76, 62), 
(77, 63), 
(78, 64), 
(80, 65), 
(81, 66), 
(82, 67), 
(83, 68), 
(84, 69), 
(85, 70), 
(86, 71), 
(89, 73), 
(90, 74), 
(90, 75), 
(91, 76), 
(92, 77), 
(93, 78), 
(94, 78), 
(95, 79), 
(95, 80), 
(96, 81), 
(96, 82), 
(97, 81), 
(87, 72), 
(99, 83), 
(100, 83), 
(101, 84), 
(102, 85);

INSERT INTO AlbumCategories (album_id, genre_id) VALUES
(9, 1),
(15, 2),
(5, 3),
(21, 3),
(11, 4),
(20, 4),
(23, 5),
(17, 6),
(50, 7),
(24, 7),
(11, 8),
(29, 9),
(36, 10),
(42, 10),
(47, 11),
(48, 12),
(1, 13),
(22, 14),
(5, 14),
(6, 15),
(35, 16),
(23, 17),
(6, 17),
(26, 18),
(30, 19),
(32, 20),
(19, 21),
(46, 22),
(43, 23),
(7, 24),
(40, 25),
(18, 26),
(16, 27),
(33, 27),
(11, 28),
(12, 29),
(44, 30),
(26, 31),
(4, 32),
(13, 32),
(3, 33),
(11, 34),
(14, 34),
(37, 35),
(41, 36),
(10, 36),
(34, 37),
(34, 38),
(11, 39),
(31, 40),
(25, 41),
(2, 42),
(39, 43),
(27, 44),
(38, 45),
(11, 46),
(38, 47),
(11, 48),
(28, 49),
(11, 50),
(45, 51),
(8, 52),
(49, 53);

INSERT INTO ArtistStyles (artist_id, genre_id) VALUES 
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 6),
(11, 6),
(12, 6),
(13, 7),
(14, 7),
(15, 7),
(16, 8),
(17, 9),
(18, 10),
(19, 10),
(20, 11),
(21, 12),
(22, 12),
(23, 13),
(24, 14),
(25, 14),
(5, 14),
(26, 15),
(27, 16),
(9, 17),
(26, 17),
(28, 18),
(29, 19),
(30, 20),
(31, 20),
(32, 20),
(33, 21),
(34, 22),
(35, 22),
(36, 22),
(37, 23),
(38, 24),
(39, 25),
(40, 26),
(41, 27),
(42, 27),
(43, 27),
(44, 27),
(7, 28),
(45, 28),
(46, 28),
(47, 29),
(48, 29),
(49, 30),
(28, 31),
(50, 32),
(51, 32),
(52, 33),
(53, 33),
(54, 34),
(55, 34),
(56, 34),
(57, 34),
(58, 34),
(59, 35),
(60, 35),
(61, 36),
(62, 36),
(63, 36),
(64, 37),
(64, 38),
(65, 39),
(66, 40),
(67, 41),
(68, 42),
(69, 43),
(70, 44),
(71, 45),
(72, 46),
(71, 47),
(73, 48),
(74, 49),
(75, 49),
(76, 50),
(77, 50),
(78, 50),
(79, 50),
(80, 50),
(81, 50),
(82, 50),
(72, 50),
(83, 51),
(84, 52),
(85, 53);

INSERT INTO PlaybackHistory (user_id, song_id, total_time) VALUES
(1, 1, 120), (1, 2, 150), (1, 3, 180), (1, 4, 160), (1, 5, 200),
(2, 6, 180), (2, 7, 120), (2, 8, 140), (2, 9, 220), (2, 10, 180),
(3, 11, 250), (3, 12, 200), (3, 13, 210), (3, 14, 230), (3, 15, 260),
(4, 16, 140), (4, 17, 160), (4, 18, 170), (4, 19, 180), (4, 20, 220),
(5, 21, 250), (5, 22, 240), (5, 23, 230), (5, 24, 200), (5, 25, 170),
(6, 26, 190), (6, 27, 220), (6, 28, 210), (6, 29, 240), (6, 30, 230),
(7, 31, 200), (7, 32, 250), (7, 33, 220), (7, 34, 240), (7, 35, 210),
(8, 36, 180), (8, 37, 170), (8, 38, 160), (8, 39, 190), (8, 40, 220),
(9, 41, 200), (9, 42, 180), (9, 43, 160), (9, 44, 190), (9, 45, 210),
(10, 46, 230), (10, 47, 250), (10, 48, 270), (10, 49, 240), (10, 50, 220),
(11, 51, 260), (11, 52, 230), (11, 53, 250), (11, 54, 210), (11, 55, 180),
(12, 56, 200), (12, 57, 210), (12, 58, 240), (12, 59, 220), (12, 60, 230),
(13, 61, 250), (13, 62, 240), (13, 63, 220), (13, 64, 210), (13, 65, 180),
(14, 66, 200), (14, 67, 180), (14, 68, 170), (14, 69, 190), (14, 70, 230),
(15, 71, 210), (15, 72, 220), (15, 73, 240), (15, 74, 250), (15, 75, 230),
(16, 76, 180), (16, 77, 170), (16, 78, 160), (16, 79, 150), (16, 80, 140),
(17, 81, 130), (17, 82, 140), (17, 83, 120), (17, 84, 110), (17, 85, 100),
(18, 86, 180), (18, 87, 170), (18, 88, 160), (18, 89, 150), (18, 90, 140),
(19, 91, 200), (19, 92, 180), (19, 93, 190), (19, 94, 170), (19, 95, 160),
(20, 96, 250), (20, 97, 220), (20, 98, 210), (20, 99, 230), (20, 100, 240);

INSERT INTO Recommendations (user_id, song_id, recommendation_reason, time_stamp) VALUES
(1, 1, 'Great acoustic vibe for a calm day', '2024-12-11 10:15:00'),
(1, 2, 'Catchy melody, perfect for a morning drive', '2024-12-11 10:20:00'),
(2, 3, 'Great for chilling with friends', '2024-12-11 11:00:00'),
(2, 4, 'Feels like a perfect summer song', '2024-12-11 11:10:00'),
(3, 5, 'Nice to listen after a long day', '2024-12-11 12:00:00'),
(3, 6, 'Energetic and upbeat!', '2024-12-11 12:30:00'),
(4, 7, 'For those who love electronic beats', '2024-12-11 13:00:00'),
(4, 8, 'Perfect for your weekend playlist', '2024-12-11 13:15:00'),
(5, 9, 'A deep emotional track', '2024-12-11 14:00:00'),
(5, 10, 'A beautiful blend of jazz and modern sounds', '2024-12-11 14:10:00'),
(6, 11, 'A must-listen if you love blues', '2024-12-11 15:00:00'),
(6, 12, 'This track will make your day better', '2024-12-11 15:15:00'),
(7, 13, 'Ambient music that soothes your mind', '2024-12-11 16:00:00'),
(7, 14, 'Perfect background music for work', '2024-12-11 16:05:00'),
(8, 15, 'For fans of upbeat pop tracks', '2024-12-11 16:30:00'),
(8, 16, 'The perfect track for a workout', '2024-12-11 17:00:00'),
(9, 17, 'A remix you don\'t want to miss', '2024-12-11 17:15:00'),
(9, 18, 'It\'s Christmas time! Perfect for the season', '2024-12-11 18:00:00'),
(10, 19, 'For fans of alternative rock', '2024-12-11 18:10:00'),
(10, 20, 'An iconic song from a legendary album', '2024-12-11 19:00:00'),
(11, 21, 'Best dancehall beat of the year', '2024-12-11 19:30:00'),
(11, 22, 'Funky vibes for your party', '2024-12-11 20:00:00'),
(12, 23, 'A perfect blend of modern and classical sounds', '2024-12-11 20:15:00'),
(12, 24, 'Catchy and upbeat, a true hit', '2024-12-11 21:00:00'),
(13, 25, 'A soulful piece for quiet nights', '2024-12-11 21:10:00'),
(13, 26, 'A song that will make you dance', '2024-12-11 22:00:00'),
(14, 27, 'Relaxing jazz for a calm evening', '2024-12-11 22:20:00'),
(14, 28, 'For the lovers of ambient music', '2024-12-11 23:00:00'),
(15, 29, 'A great track to sing along', '2024-12-11 23:30:00'),
(15, 30, 'Ideal for a late-night drive', '2024-12-12 00:00:00'),
(16, 31, 'Amazing blend of electronic beats', '2024-12-12 00:10:00'),
(16, 32, 'A perfect soundtrack for your day', '2024-12-12 01:00:00'),
(17, 33, 'For fans of traditional rhythms', '2024-12-12 01:30:00'),
(17, 34, 'A must-hear for all blues lovers', '2024-12-12 02:00:00'),
(18, 35, 'For all the rock fans out there', '2024-12-12 02:15:00'),
(18, 36, 'Soothing and calming for your soul', '2024-12-12 03:00:00'),
(19, 37, 'For the ambient lovers', '2024-12-12 03:30:00'),
(19, 38, 'A track that makes you feel good', '2024-12-12 04:00:00'),
(20, 39, 'For fans of deep electronic music', '2024-12-12 04:30:00'),
(20, 40, 'Fun and energetic for parties', '2024-12-12 05:00:00');

INSERT INTO Subscriptions (user_id, subscription_type, start_date, end_date) VALUES
(1, 'Premium', '2024-01-01', '2025-01-01'),
(2, 'Standard', '2024-02-01', '2025-02-01'),
(3, 'Free', '2024-03-01', '2024-06-01'),
(4, 'Premium', '2024-04-01', '2025-04-01'),
(5, 'Standard', '2024-05-01', '2025-05-01'),
(6, 'Premium', '2024-06-01', '2025-06-01'),
(7, 'Free', '2024-07-01', '2024-10-01'),
(8, 'Standard', '2024-08-01', '2025-08-01'),
(9, 'Free', '2024-09-01', '2024-12-01'),
(10, 'Premium', '2024-10-01', '2025-10-01'),
(11, 'Standard', '2024-11-01', '2025-11-01'),
(12, 'Premium', '2024-12-01', '2025-12-01'),
(13, 'Free', '2024-01-01', '2024-04-01'),
(14, 'Premium', '2024-02-01', '2025-02-01'),
(15, 'Free', '2024-03-01', '2024-06-01'),
(16, 'Standard', '2024-04-01', '2025-04-01'),
(17, 'Free', '2024-05-01', '2024-08-01'),
(18, 'Standard', '2024-06-01', '2025-06-01'),
(19, 'Premium', '2024-07-01', '2025-07-01'),
(20, 'Free', '2024-08-01', '2024-11-01'),
(1, 'Premium', '2024-01-15', '2025-01-15'),
(2, 'Standard', '2024-02-15', '2025-02-15'),
(3, 'Premium', '2024-03-15', '2025-03-15'),
(4, 'Free', '2024-04-15', '2024-07-15'),
(5, 'Standard', '2024-05-15', '2025-05-15'),
(6, 'Free', '2024-06-15', '2024-09-15'),
(7, 'Premium', '2024-07-15', '2025-07-15'),
(8, 'Free', '2024-08-15', '2024-11-15'),
(9, 'Premium', '2024-09-15', '2025-09-15'),
(10, 'Free', '2024-10-15', '2024-12-15'),
(11, 'Standard', '2024-11-15', '2025-11-15'),
(12, 'Premium', '2024-12-15', '2025-12-15');

-- INNER JOIN: retrieves the names of users and the songs they have played
SELECT Users.name AS user_name, Songs.title AS song_title
FROM Users
INNER JOIN PlaybackHistory ON Users.user_id = PlaybackHistory.user_id
INNER JOIN Songs ON PlaybackHistory.song_id = Songs.song_id;

-- OUTER JOIN: fetch all songs and their associated recommendations, even if some songs do not have any recommendations
SELECT Songs.title, Users.name AS user_name, Recommendations.recommendation_reason, Recommendations.time_stamp
FROM Songs
LEFT OUTER JOIN Recommendations ON Songs.song_id = Recommendations.song_id
LEFT OUTER JOIN Users ON Recommendations.user_id = Users.user_id;

-- SUBQUERY IN WHERE: retrieves the users who have played songs from a specific genre (e.g., 'Pop')
SELECT Users.name AS user_name
FROM Users
WHERE Users.user_id IN (
    SELECT DISTINCT PlaybackHistory.user_id
    FROM PlaybackHistory
    JOIN Songs ON PlaybackHistory.song_id = Songs.song_id
    WHERE Songs.genre_id = (SELECT genre_id FROM Genres WHERE genre_name = 'Pop')
);

-- SUBQUERY IN FROM: calculates the total number of songs played by each user
SELECT UserSongs.user_name, COUNT(UserSongs.song_id) AS total_songs_played
FROM (
    SELECT Users.name AS user_name, PlaybackHistory.song_id
    FROM Users
    JOIN PlaybackHistory ON Users.user_id = PlaybackHistory.user_id
) AS UserSongs
GROUP BY UserSongs.user_name;

-- GROUP BY and Aggregate Functions: retrieves the total number of songs per genre and the average song duration in each genre
SELECT Genres.genre_name, COUNT(Songs.song_id) AS total_songs, AVG(Songs.duration) AS average_duration
FROM Songs
JOIN Genres ON Songs.genre_id = Genres.genre_id
GROUP BY Genres.genre_name;

START TRANSACTION;

INSERT INTO Users (name, email, password, date_joined) 
VALUES ('Test User', 'test.user@example.com', 'testpassword123', '2024-12-11');

ROLLBACK;

-- TRIGGER: automatically set date_joined to the current date when a new user is added
DELIMITER $$

CREATE TRIGGER set_date_joined
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN

    IF NEW.date_joined IS NULL THEN
        SET NEW.date_joined = CURDATE();
    END IF;
END$$

DELIMITER ;

-- PROCEDURE: get users by subscription type
DELIMITER $$

CREATE PROCEDURE GetUsersBySubscription(IN subscription_type VARCHAR(50))
BEGIN
    SELECT u.*
    FROM Users u
    JOIN Subscriptions s ON s.user_id = u.user_id
    WHERE s.subscription_type = subscription_type;
END$$

DELIMITER ;


CALL GetUsersBySubscription("Free");








