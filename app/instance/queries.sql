
-- Total number of mentors
SELECT COUNT(*) as mentor_count FROM users where role = 'mentor';

-- Average and total duration of mentorship
SELECT
    COUNT(*) AS total_mentorships,
    AVG(DATEDIFF(end_date, start_date)) AS avg_mentorship_duration,
    SUM(DATEDIFF(end_date, start_date)) AS total_mentorship_days
FROM
    it_mentorship.mentorships
WHERE
    end_date IS NOT NULL;

-- Average number of answers per question
SELECT
    AVG(answer_count) AS avg_answers_per_question,
    SUM(answer_count) AS total_answers
FROM (
    SELECT
        question_id,
        COUNT(*) AS answer_count
    FROM
        it_mentorship.answers
    GROUP BY
        question_id
) AS question_answer_stats;

