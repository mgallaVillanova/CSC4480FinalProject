-------------------- DATABASE FINAL PROJECT --------------------

-- CREATING TABLES --

-- Creating the Record Label table first
CREATE TABLE RecordLabel (
    Name VARCHAR(255) NOT NULL,
    FoundedDate DATE,
    HQ_Location VARCHAR(255),
    PRIMARY KEY (Name)
);

-- Creating the Artist table
CREATE TABLE Artist (
    Name VARCHAR(255) NOT NULL,
    SSN CHAR(9) NOT NULL,
    Hometown VARCHAR(255),
    Genre VARCHAR(255),
    RecordLabel VARCHAR(255),
    PRIMARY KEY (SSN),
    FOREIGN KEY (RecordLabel) REFERENCES RecordLabel(Name)
);

-- Creating the Album table
CREATE TABLE Album (
    Title VARCHAR(255) NOT NULL,
    ReleaseDate DATE,
    Genre VARCHAR(255),
    Artist CHAR(9) NOT NULL,
    RecordLabel VARCHAR(255),
    TotalTracks INTEGER,
    PRIMARY KEY (Title),
    FOREIGN KEY (Artist) REFERENCES Artist(SSN),
    FOREIGN KEY (RecordLabel) REFERENCES RecordLabel(Name)
);

-- Creating the Song table
CREATE TABLE Song (
    Title VARCHAR(255) NOT NULL,
    Length INTEGER,
    Genre VARCHAR(255),
    Artist CHAR(9) NOT NULL,
    Album VARCHAR(255) NOT NULL,
    PlayCount INTEGER,
    Rating INTEGER,
    ReleaseDate DATE,
    PRIMARY KEY (Title),
    FOREIGN KEY (Artist) REFERENCES Artist(SSN),
    FOREIGN KEY (Album) REFERENCES Album(Title)
);

-- Creating the User table
CREATE TABLE MusicUser (
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    DOB DATE,
    PlaylistsCreated INTEGER,
    FavoriteArtist VARCHAR(255),
    FavoriteGenre VARCHAR(255),
    PRIMARY KEY (Username)
);

-- Creating the Playlist table
CREATE TABLE Playlist (
    Title VARCHAR(255) NOT NULL,
    TotalSongs INTEGER,
    Duration INTEGER,
    CreatedByUser VARCHAR(255) NOT NULL,
    PRIMARY KEY (Title),
    FOREIGN KEY (CreatedByUser) REFERENCES MusicUser(Username)
);

-- Creating the Music Library table
CREATE TABLE MusicLibrary (
    Name VARCHAR(255) NOT NULL,
    MusicUser VARCHAR(255) NOT NULL,
    TotalSongs INTEGER,
    TotalPlaylist INTEGER,
    TotalAlbums INTEGER,
    TotalArtists INTEGER,
    PRIMARY KEY (Name),
    FOREIGN KEY (MusicUser) REFERENCES MusicUser(Username)
);

-- Inserting records into the RecordLabel table.
INSERT INTO RecordLabel (Name, FoundedDate, HQ_Location) VALUES ('Rowley Records', TO_DATE('1995-01-01', 'YYYY-MM-DD'), 'Santa Monica, California, USA');
INSERT INTO RecordLabel (Name, FoundedDate, HQ_Location) VALUES ('Gallagher Records', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Santa Monica, California, USA');
INSERT INTO RecordLabel (Name, FoundedDate, HQ_Location) VALUES ('Chiu Records', TO_DATE('1958-03-19', 'YYYY-MM-DD'), 'Los Angeles, California, USA');
INSERT INTO RecordLabel (Name, FoundedDate, HQ_Location) VALUES ('Greenho Records', TO_DATE('1889-01-15', 'YYYY-MM-DD'), 'Washington, D.C., USA');
INSERT INTO RecordLabel (Name, FoundedDate, HQ_Location) VALUES ('Vaughan Records', TO_DATE('1900-01-09', 'YYYY-MM-DD'), 'New York, New York, USA');
INSERT INTO RecordLabel (Name, FoundedDate, HQ_Location) VALUES ('Kedzior Records', TO_DATE('2010-01-01', 'YYYY-MM-DD'), 'Los Angeles, California, USA');
INSERT INTO RecordLabel (Name, FoundedDate, HQ_Location) VALUES ('Ellis Records', TO_DATE('2014-03-27', 'YYYY-MM-DD'), 'New York, New York, USA');
INSERT INTO RecordLabel (Name, FoundedDate, HQ_Location) VALUES ('Timlin Records', TO_DATE('1984-01-01', 'YYYY-MM-DD'), 'New York, New York, USA');
INSERT INTO RecordLabel (Name, FoundedDate, HQ_Location) VALUES ('Pagano Records', TO_DATE('1971-01-01', 'YYYY-MM-DD'), 'New York, New York, USA');
INSERT INTO RecordLabel (Name, FoundedDate, HQ_Location) VALUES ('Csejka Records', TO_DATE('2011-01-01', 'YYYY-MM-DD'), 'Los Angeles, California, USA');



-- Inserting records into the Artist table.
INSERT INTO Artist (Name, SSN, Hometown, Genre, RecordLabel) VALUES ('Taylor Swift', '123456781', 'Reading, Pennsylvania, USA', 'Pop', 'Rowley Records');
INSERT INTO Artist (Name, SSN, Hometown, Genre, RecordLabel) VALUES ('Olivia Rodrigo', '123456782', 'Temecula, California, USA', 'Pop', 'Greenho Records');
INSERT INTO Artist (Name, SSN, Hometown, Genre, RecordLabel) VALUES ('Noah Kahan', '123456783', 'Strafford, Vermont', 'Folk Pop', 'Chiu Records');
INSERT INTO Artist (Name, SSN, Hometown, Genre, RecordLabel) VALUES ('Harry Styles', '123456784', 'Redditch, Worcestershire, England', 'Pop, Rock', 'Ellis Records');
INSERT INTO Artist (Name, SSN, Hometown, Genre, RecordLabel) VALUES ('Miley Cyrus', '123456785', 'Franklin, Tennessee, USA', 'Pop, Rock', 'Csejka Records');
INSERT INTO Artist (Name, SSN, Hometown, Genre, RecordLabel) VALUES ('Beyonce', '123456786', 'Houston, Texas, USA', 'RnB, Pop', 'Vaughan Records');
INSERT INTO Artist (Name, SSN, Hometown, Genre, RecordLabel) VALUES ('Bad Bunny', '123456787', 'San Juan, Puerto Rico', 'Latin Trap, Reggaeton', 'Gallagher Records');
INSERT INTO Artist (Name, SSN, Hometown, Genre, RecordLabel) VALUES ('Justin Bieber', '123456788', 'London, Ontario, Canada', 'Pop, RnB', 'Pagano Records');
INSERT INTO Artist (Name, SSN, Hometown, Genre, RecordLabel) VALUES ('Ed Sheeran', '123456789', 'Halifax, West Yorkshire, England', 'Pop, Folk Pop', 'Timlin Records');
INSERT INTO Artist (Name, SSN, Hometown, Genre, RecordLabel) VALUES ('Doja Cat', '123456790', 'Los Angeles, California, USA', 'Hip Hop, RnB', 'Kedzior Records');



-- Inserting records into the Album table.
INSERT INTO Album (Title, ReleaseDate, Genre, Artist, RecordLabel, TotalTracks) VALUES ('The Tourtured Poets Department', TO_DATE('2024-04-18', 'YYYY-MM-DD'), 'Pop', '123456781', 'Rowley Records', 13);
INSERT INTO Album (Title, ReleaseDate, Genre, Artist, RecordLabel, TotalTracks) VALUES ('Sour', TO_DATE('2021-05-21', 'YYYY-MM-DD'), 'Pop', '123456782', 'Greenho Records', 11);
INSERT INTO Album (Title, ReleaseDate, Genre, Artist, RecordLabel, TotalTracks) VALUES ('Stick Season: Forever', TO_DATE('2024-10-01', 'YYYY-MM-DD'), 'Folk Pop', '123456783', 'Chiu Records', 13);
INSERT INTO Album (Title, ReleaseDate, Genre, Artist, RecordLabel, TotalTracks) VALUES ('Harrys House', TO_DATE('2022-05-20', 'YYYY-MM-DD'), 'Pop', '123456784', 'Ellis Records', 13);
INSERT INTO Album (Title, ReleaseDate, Genre, Artist, RecordLabel, TotalTracks) VALUES ('Plastic Hearts', TO_DATE('2020-11-27', 'YYYY-MM-DD'), 'Rock', '123456785', 'Csejka Records', 15);
INSERT INTO Album (Title, ReleaseDate, Genre, Artist, RecordLabel, TotalTracks) VALUES ('Renaissance', TO_DATE('2022-07-29', 'YYYY-MM-DD'), 'Pop', '123456786', 'Vaughan Records', 16);
INSERT INTO Album (Title, ReleaseDate, Genre, Artist, RecordLabel, TotalTracks) VALUES ('Un Verano Sin Ti', TO_DATE('2022-05-06', 'YYYY-MM-DD'), 'Reggaeton', '123456787', 'Gallagher Records', 23);
INSERT INTO Album (Title, ReleaseDate, Genre, Artist, RecordLabel, TotalTracks) VALUES ('Justice', TO_DATE('2021-03-19', 'YYYY-MM-DD'), 'Pop', '123456788', 'Pagano Records', 16);
INSERT INTO Album (Title, ReleaseDate, Genre, Artist, RecordLabel, TotalTracks) VALUES ('Equals', TO_DATE('2021-10-29', 'YYYY-MM-DD'), 'Folk Pop', '123456789', 'Timlin Records', 14);
INSERT INTO Album (Title, ReleaseDate, Genre, Artist, RecordLabel, TotalTracks) VALUES ('Planet Her', TO_DATE('2021-06-25', 'YYYY-MM-DD'), 'Pop', '123456790', 'Kedzior Records', 14);



-- Inserting records into the Song table with song lengths in seconds, random play counts and random ratings.
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Guilty As Sin?', 191, 'Pop', '123456781', 'The Tourtured Poets Department', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2024-04-18', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('good 4 u', 178, 'Pop', '123456782', 'Sour', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2021-05-21', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Stick Season', 203, 'Folk Pop', '123456783', 'Stick Season: Forever', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2024-10-01', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('As It Was', 167, 'Pop', '123456784', 'Harrys House', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2022-05-20', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Midnight Sky', 221, 'Rock', '123456785', 'Plastic Hearts', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2020-11-27', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Break My Soul', 255, 'RnB', '123456786', 'Renaissance', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2022-07-29', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Me Porto Bonito', 178, 'Reggaeton', '123456787', 'Un Verano Sin Ti', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2022-05-06', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Peaches', 198, 'Pop', '123456788', 'Justice', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2021-03-19', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Bad Habits', 231, 'Folk Pop', '123456789', 'Equals', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2021-10-29', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Kiss Me More', 208, 'Pop', '123456790', 'Planet Her', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2021-06-25', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('The Black Dog', 238, 'Pop', '123456781', 'The Tourtured Poets Department', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2024-04-18', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('favorite crime', 152, 'Pop', '123456782', 'Sour', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2021-05-21', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Dial Drunk', 213, 'Folk Pop', '123456783', 'Stick Season: Forever', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2024-10-01', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Satellite', 218, 'Pop', '123456784', 'Harrys House', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2022-05-20', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Angels Like You', 196, 'Rock', '123456785', 'Plastic Hearts', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2020-11-27', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Cuff It', 225, 'RnB', '123456786', 'Renaissance', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2022-07-29', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Titi Me Pregunto', 243, 'Reggaeton', '123456787', 'Un Verano Sin Ti', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2022-05-06', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Ghost', 153, 'Pop', '123456788', 'Justice', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2021-03-19', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Stop The Rain', 203, 'Folk Pop', '123456789', 'Equals', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2021-10-29', 'YYYY-MM-DD'));
INSERT INTO Song (Title, Length, Genre, Artist, Album, PlayCount, Rating, ReleaseDate) VALUES ('Need to Know', 210, 'Pop', '123456790', 'Planet Her', ROUND(DBMS_RANDOM.VALUE(1, 99)), ROUND(DBMS_RANDOM.VALUE(1, 10)), TO_DATE('2021-06-25', 'YYYY-MM-DD'));


-- Inserting records into the User table.
INSERT INTO MusicUser (Username, Email, Password, DOB, PlaylistsCreated, FavoriteArtist, FavoriteGenre) VALUES ('IzzyR', 'izzy.rowley@example.com', 'pass1234', TO_DATE('1995-04-12', 'YYYY-MM-DD'), ROUND(DBMS_RANDOM.VALUE(1, 10)), 'Taylor Swift', 'Pop');
INSERT INTO MusicUser (Username, Email, Password, DOB, PlaylistsCreated, FavoriteArtist, FavoriteGenre) VALUES ('CammyC', 'cam.chiu@example.net', 'pass5678', TO_DATE('1990-08-25', 'YYYY-MM-DD'), ROUND(DBMS_RANDOM.VALUE(1, 10)), 'Noah Kahan', 'Folk Pop');
INSERT INTO MusicUser (Username, Email, Password, DOB, PlaylistsCreated, FavoriteArtist, FavoriteGenre) VALUES ('SkyG', 'sky.greenho@xyz.com', 'pass9876', TO_DATE('1987-11-30', 'YYYY-MM-DD'), ROUND(DBMS_RANDOM.VALUE(1, 10)), 'Harry Styles', 'Rock');
INSERT INTO MusicUser (Username, Email, Password, DOB, PlaylistsCreated, FavoriteArtist, FavoriteGenre) VALUES ('AlexaT', 'alexa.timlin@mail.com', 'pass3456', TO_DATE('1992-02-15', 'YYYY-MM-DD'), ROUND(DBMS_RANDOM.VALUE(1, 10)), 'Miley Cyrus', 'Rock');
INSERT INTO MusicUser (Username, Email, Password, DOB, PlaylistsCreated, FavoriteArtist, FavoriteGenre) VALUES ('GiannaE', 'gianna.ellis@service.org', 'pass2345', TO_DATE('1985-05-20', 'YYYY-MM-DD'), ROUND(DBMS_RANDOM.VALUE(1, 10)), 'Beyonce', 'RnB');
INSERT INTO MusicUser (Username, Email, Password, DOB, PlaylistsCreated, FavoriteArtist, FavoriteGenre) VALUES ('KenzieG', 'kenzie.gallagher@domain.net', 'pass7890', TO_DATE('1991-12-09', 'YYYY-MM-DD'), ROUND(DBMS_RANDOM.VALUE(1, 10)), 'Bad Bunny', 'Reggaeton');
INSERT INTO MusicUser (Username, Email, Password, DOB, PlaylistsCreated, FavoriteArtist, FavoriteGenre) VALUES ('KennedyC', 'kennedy.cscjka@internet.com', 'pass6543', TO_DATE('1996-03-18', 'YYYY-MM-DD'), ROUND(DBMS_RANDOM.VALUE(1, 10)), 'Justin Bieber', 'Pop');
INSERT INTO MusicUser (Username, Email, Password, DOB, PlaylistsCreated, FavoriteArtist, FavoriteGenre) VALUES ('RyanV', 'ryan.vaughan@web.com', 'pass4321', TO_DATE('1993-07-22', 'YYYY-MM-DD'), ROUND(DBMS_RANDOM.VALUE(1, 10)), 'Ed Sheeran', 'Folk Pop');
INSERT INTO MusicUser (Username, Email, Password, DOB, PlaylistsCreated, FavoriteArtist, FavoriteGenre) VALUES ('HannahP', 'hannah.pagano@place.com', 'pass3214', TO_DATE('1989-09-19', 'YYYY-MM-DD'), ROUND(DBMS_RANDOM.VALUE(1, 10)), 'Doja Cat', 'Hip Hop');
INSERT INTO MusicUser (Username, Email, Password, DOB, PlaylistsCreated, FavoriteArtist, FavoriteGenre) VALUES ('MilesK', 'miles.kedzior@flow.net', 'pass7685', TO_DATE('1988-04-23', 'YYYY-MM-DD'), ROUND(DBMS_RANDOM.VALUE(1, 10)), 'Olivia Rodrigo', 'Pop');



-- Inserting records into the Playlist table.
INSERT INTO Playlist (Title, TotalSongs, Duration, CreatedByUser) VALUES ('My Favs', 20, 60, 'IzzyR'); -- 60 minutes
INSERT INTO Playlist (Title, TotalSongs, Duration, CreatedByUser) VALUES ('Country Vibes', 15, 45, 'CammyC'); -- 45 minutes
INSERT INTO Playlist (Title, TotalSongs, Duration, CreatedByUser) VALUES ('Workout Music', 30, 90, 'AlexaT'); -- 90 minutes
INSERT INTO Playlist (Title, TotalSongs, Duration, CreatedByUser) VALUES ('Car Playlist', 12, 40, 'KenzieG'); -- 40 minutes
INSERT INTO Playlist (Title, TotalSongs, Duration, CreatedByUser) VALUES ('Happy Playlist', 25, 75, 'RyanV'); -- 75 minutes
INSERT INTO Playlist (Title, TotalSongs, Duration, CreatedByUser) VALUES ('Chill Vibes', 18, 60, 'SkyG'); -- 60 minutes
INSERT INTO Playlist (Title, TotalSongs, Duration, CreatedByUser) VALUES ('Top Hits', 22, 66, 'GiannaE'); -- 66 minutes
INSERT INTO Playlist (Title, TotalSongs, Duration, CreatedByUser) VALUES ('Current Favorites', 16, 48, 'KennedyC'); -- 48 minutes
INSERT INTO Playlist (Title, TotalSongs, Duration, CreatedByUser) VALUES ('Study Essentials', 20, 70, 'HannahP'); -- 70 minutes
INSERT INTO Playlist (Title, TotalSongs, Duration, CreatedByUser) VALUES ('Throwback Tunes', 10, 30, 'MilesK'); -- 30 minutes



-- Inserting records into the Music Library table.
INSERT INTO MusicLibrary (Name, MusicUser, TotalSongs, TotalPlaylist, TotalAlbums, TotalArtists) VALUES ('Izzys Favs', 'IzzyR', 100, 9, 11, 8);
INSERT INTO MusicLibrary (Name, MusicUser, TotalSongs, TotalPlaylist, TotalAlbums, TotalArtists) VALUES ('Cammys Collection', 'CammyC',  77, 4, 9, 3);
INSERT INTO MusicLibrary (Name, MusicUser, TotalSongs, TotalPlaylist, TotalAlbums, TotalArtists) VALUES ('Alexas Alternatives', 'AlexaT',  22, 10, 2, 6);
INSERT INTO MusicLibrary (Name, MusicUser, TotalSongs, TotalPlaylist, TotalAlbums, TotalArtists) VALUES ('Kenzies Currents', 'KenzieG',  100, 15, 8, 9);
INSERT INTO MusicLibrary (Name, MusicUser, TotalSongs, TotalPlaylist, TotalAlbums, TotalArtists) VALUES ('Ryans Rhythms', 'RyanV',  50, 6, 10, 2);
INSERT INTO MusicLibrary (Name, MusicUser, TotalSongs, TotalPlaylist, TotalAlbums, TotalArtists) VALUES ('Skys Songs', 'SkyG',  99, 6, 10, 8);
INSERT INTO MusicLibrary (Name, MusicUser, TotalSongs, TotalPlaylist, TotalAlbums, TotalArtists) VALUES ('Giannas Jams', 'GiannaE',  87, 3, 1, 1);
INSERT INTO MusicLibrary (Name, MusicUser, TotalSongs, TotalPlaylist, TotalAlbums, TotalArtists) VALUES ('Kennedys Collabs', 'KennedyC',  48, 10, 8, 8);
INSERT INTO MusicLibrary (Name, MusicUser, TotalSongs, TotalPlaylist, TotalAlbums, TotalArtists) VALUES ('Hannahs Hits', 'HannahP',  15, 1, 2, 5);
INSERT INTO MusicLibrary (Name, MusicUser, TotalSongs, TotalPlaylist, TotalAlbums, TotalArtists) VALUES ('Miles Music', 'MilesK',  30, 9, 12, 3);


commit;

--List all artists name and SSN and their record labels:
SELECT a.Name, a.SSN, a.RecordLabel 
FROM Artist a
ORDER BY a.Name ASC;

--List all record labels in LA:
SELECT r.Name, r.HQ_Location 
FROM RecordLabel r
WHERE r.HQ_Location = 'Los Angeles, California, USA'
ORDER BY r.Name ASC;

--List the artist, Song title, 
--album release date, and song length:
SELECT DISTINCT a.Name, s.Title, m.ReleaseDate, s.Length
FROM Song s
JOIN Artist a ON s.Artist = a.SSN
JOIN Album m ON s.Album = m.Title
ORDER BY m.ReleaseDate;

--List all users playlists 
SELECT u.Username, p.Title, p.Duration 
FROM Playlist p 
JOIN MusicUser u ON p.CreatedByUser = u.Username
ORDER BY u.Username ASC;

--List all users favorite artist 
SELECT u.Username, u.DOB, u.FavoriteArtist
FROM MusicUser u
ORDER BY u.Username ASC;

--List all the pop genre albums 
SELECT a.Name, m.Title, m.Genre
FROM Album m
JOIN Artist a ON m.Artist = a.SSN
WHERE m.Genre = 'Pop'
ORDER BY a.Name ASC;

--