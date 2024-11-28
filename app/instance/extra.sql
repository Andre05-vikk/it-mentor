-- Muuda email unikaalseks väljaks kasutajate tabelis, et keegi teine seda emaili kasutada ei saaks.
ALTER TABLE users
    ADD UNIQUE (email);


-- Kasutajate lisamine andmebaasi
insert into users (username, email, password_hash, role)
values ('mentor', 'tom@gmail.com', 'mentor', 'mentor')
     , ('mentee', '12@gmail.com', 'mentee', 'mentee')
     , ('mentor2', '22@mail.com', 'mentor2', 'mentor')
     , ('mentee2', 'ee@mail.com', 'mentee2', 'mentee');

-- Küsimuste lisamine andmebaasi
insert into questions (user_id, title, content)
values (1, 'Kuidas saan õppida programmeerimist?',
        'Sooviksin alustada programmeerimise õppimist, kuid ei tea, kust alustada. Kas keegi oskab soovitada õppematerjale või kursusi?')
     , (2, 'Kuidas saan õppida andmebaase?',
        'Sooviksin alustada andmebaaside õppimist, kuid ei tea, kust alustada. Kas keegi oskab soovitada õppematerjale või kursusi?');

-- Vastuste lisamine andmebaasi
insert into answers (question_id, user_id, content)
values (1, 2,
        'Soovitan alustada Codecademy kursustega, mis on tasuta ja interaktiivsed. Samuti on head õppematerjalid W3Schools ja MDN Web Docs.')
     , (2, 1, 'Soovitan alustada SQL õppimist W3Schools kaudu, kus on palju praktilisi näiteid ja harjutusi.');

-- Mentorluse lisamine andmebaasi
insert into mentorships (mentor_id, mentee_id, start_date)
values (1, 2, '2021-01-01')
     , (2, 1, '2021-01-01');

-- Kõikide mentorite leidmine
select *
from users
where role = 'mentor';

-- Kõikide mentorite arv
select count(*) as mentor_count
from users