CREATE DATABASE IF NOT EXISTS avindha_db;
USE avindha_db;

CREATE TABLE IF NOT EXISTS test_cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    module VARCHAR(50) NOT NULL,             -- 'ivr', 'grapari-indihome', 'grapari-mobile'
    date DATE NOT NULL,
    result ENUM('Passed', 'Failed', 'Pending') DEFAULT 'Passed',
    severity VARCHAR(30) DEFAULT 'Minor',
    service_provider VARCHAR(50) DEFAULT '',
    phone VARCHAR(30) DEFAULT '',
    layanan VARCHAR(100) DEFAULT '',
    tier VARCHAR(20) DEFAULT '',
    menu_category VARCHAR(100) DEFAULT '',
    capability VARCHAR(100) DEFAULT '',
    step TEXT,
    detail TEXT,
    description TEXT,                        -- Issue
    propose TEXT,                            -- Propose Solusi
    evidence_type VARCHAR(20) DEFAULT NULL,  -- 'image' / 'video'
    evidence_name VARCHAR(255) DEFAULT NULL,
    evidence_data LONGTEXT DEFAULT NULL,     -- Compressed Base64 Media Data
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);