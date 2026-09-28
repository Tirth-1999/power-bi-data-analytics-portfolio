CREATE DATABASE IF NOT EXISTS traffic_project;
USE traffic_project;

-- Dimension containing the ten normalized keyword groups.
CREATE TABLE IF NOT EXISTS keyword (
    keyword_id INT PRIMARY KEY,
    keyword VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS search_volume (
    keyword_id INT PRIMARY KEY,
    search_volume INT NOT NULL,
    CONSTRAINT fk_search_volume_keyword
        FOREIGN KEY (keyword_id) REFERENCES keyword (keyword_id)
);

CREATE TABLE IF NOT EXISTS keyword_difficulty (
    keyword_id INT PRIMARY KEY,
    avg_difficulty DECIMAL(5, 2) NOT NULL,
    difficulty_level VARCHAR(20) NOT NULL,
    CONSTRAINT fk_keyword_difficulty_keyword
        FOREIGN KEY (keyword_id) REFERENCES keyword (keyword_id)
);

-- Fact table. Import Last Seen from the CSV as DD-MM-YYYY and convert it to DATE.
CREATE TABLE IF NOT EXISTS website_traffic_data (
    traffic_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    keyword VARCHAR(100) NOT NULL,
    keyword_id INT NOT NULL,
    position INT NOT NULL,
    previous_position INT NOT NULL,
    last_seen DATE NOT NULL,
    search_volume INT NOT NULL,
    cpc DECIMAL(10, 2) NOT NULL,
    traffic INT NOT NULL,
    traffic_percent DECIMAL(10, 2) NOT NULL,
    traffic_cost INT NOT NULL,
    traffic_cost_percent DECIMAL(10, 2) NOT NULL,
    competition DECIMAL(5, 2) NOT NULL,
    number_of_results BIGINT NOT NULL,
    keyword_difficulty DECIMAL(5, 2) NOT NULL,
    INDEX idx_traffic_keyword_id (keyword_id),
    INDEX idx_traffic_last_seen (last_seen),
    CONSTRAINT fk_traffic_keyword
        FOREIGN KEY (keyword_id) REFERENCES keyword (keyword_id)
);

-- Useful verification queries after importing the four CSV files.
SELECT COUNT(*) AS keyword_count FROM keyword;
SELECT COUNT(*) AS difficulty_count FROM keyword_difficulty;
SELECT COUNT(*) AS search_volume_count FROM search_volume;
SELECT COUNT(*) AS traffic_row_count FROM website_traffic_data;
