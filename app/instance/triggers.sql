
-- Create table to log questions changes
CREATE TABLE questions_log
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    questions_id   INT,
    old_content VARCHAR(255),
    new_content VARCHAR(255),
    old_title VARCHAR(255),
    new_title VARCHAR(255),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create trigger to log questions changes
CREATE TRIGGER after_questions_update
    AFTER UPDATE
    ON questions
    FOR EACH ROW
BEGIN
    INSERT INTO questions_log (questions_id, old_content, new_content, old_title, new_title)
    VALUES (OLD.id, OLD.content, NEW.content, OLD.title, NEW.title);
END;

-- Test after_questions_update trigger
update questions set content = 'New content' where id = 1;

-- Create trigger to check email format before insert
CREATE TRIGGER before_users_insert
    BEFORE INSERT
    ON users
    FOR EACH ROW
BEGIN
    IF NEW.email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid email format';
    END IF;
END;

-- Test before_users_insert trigger
insert into users (username, email, password_hash) values ('test', '22@gmail.com', 'test');