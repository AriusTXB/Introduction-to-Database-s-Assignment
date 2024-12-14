USE csdl;

-- Ensures each album name is unique
ALTER TABLE Albums
ADD CONSTRAINT unique_album_name UNIQUE (album_name);

-- Validates that the song's duration is greater than zero
ALTER TABLE Songs
ADD CONSTRAINT check_song_duration CHECK (duration > 0);

-- Ensures the subscription_type column contains valid values like 'Free', 'Premium', etc
ALTER TABLE Subscriptions
ADD CONSTRAINT check_subscription_type CHECK (subscription_type IN ('Free', 'Standard', 'Premium'));