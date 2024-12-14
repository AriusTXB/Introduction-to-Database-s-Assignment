USE csdl;

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