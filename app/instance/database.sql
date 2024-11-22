-- Andmebaasi loomine
CREATE DATABASE IF NOT EXISTS it_mentorship;
USE it_mentorship;

-- Kasutajate tabel, kus hoitakse isiklikke andmeid
CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(191) NOT NULL UNIQUE,
    email VARCHAR(191) NOT NULL UNIQUE,
    password_hash VARCHAR(191) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role ENUM('mentor', 'mentee') NOT NULL
);

-- Küsimuste tabel, kus hoitakse esitatud küsimusi
CREATE TABLE questions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(191) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Vastuste tabel, kus hoitakse küsimustele antud vastuseid
CREATE TABLE answers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    question_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Mentorluse tabel, kus määratletakse mentor-õpilane suhted
CREATE TABLE mentorships (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    mentor_id INT UNSIGNED NOT NULL,
    mentee_id INT UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    FOREIGN KEY (mentor_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (mentee_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE (mentor_id, mentee_id)
);

-- Täiendavad tingimused ja kontrollid
-- Märkus: Veenduge, et kõik primaar- ja võõrvõtmeväljad on UNSIGNED.
-- VARCHAR väljade pikkus on piiratud 191 tähemärgiga, mis sobib kirillitsa ja teiste sümbolitega.
-- Andmebaas on normaliseeritud kujul, vältides dubleerimist ja kasutades võõrvõtmeid viitamiseks.

