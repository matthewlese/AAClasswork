DROP TABLE users;
DROP TABLE questions;
DROP TABLE question_follows;
DROP TABLE replies;
DROP TABLE question_likes;
PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY(author_id) REFERENCES users(id) 
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  parent_reply INTEGER,
  subject_question INTEGER NOT NULL,
  replying_user INTEGER NOT NULL,
  FOREIGN KEY(parent_reply) REFERENCES replies(id),
  FOREIGN KEY(subject_question) REFERENCES questions(id),
  FOREIGN KEY(replying_user) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,
  FOREIGN KEY(users_id) REFERENCES users(id),
  FOREIGN KEY(questions_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Matt', 'Lese'), --> id=1
  ('Efrem', 'Porter'); --> id=2

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('ruby programming', 'how do we code using ruby?', (SELECT id FROM users WHERE fname = 'Efrem' AND lname = 'Porter')),
  ('sql programming', 'what companies utilize SQL?', (SELECT id FROM users WHERE fname = 'Matt' AND lname = 'Lese'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Efrem' AND lname = 'Porter'), (SELECT id FROM questions WHERE author_id = (SELECT id FROM users WHERE fname = 'Matt' AND lname = 'Lese'))),
  (1, 2);

INSERT INTO
  replies (body, subject_question, replying_user)
VALUES
  ('I think Apple is one.', (SELECT id FROM questions WHERE title = 'sql programming'), (SELECT id FROM users WHERE fname = 'Efrem' AND lname = 'Porter'));
 
INSERT INTO
  replies (body, parent_reply, subject_question, replying_user)
VALUES
  ('Who knows', (SELECT id FROM replies WHERE body = 'I think Apple is one.'), 2, 1);

INSERT INTO
  question_likes (users_id, questions_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Efrem' AND lname = 'Porter'), (SELECT id FROM questions WHERE title = 'sql programming'));

