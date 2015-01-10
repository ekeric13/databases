CREATE DATABASE chat;

USE chat;

-- DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT,
    username varchar(30) NOT NULL,
    PRIMARY KEY (id),
    stamp_created timestamp default now(),
    stamp_updated timestamp default now() on update now()

);

CREATE TABLE rooms (
    id int NOT NULL AUTO_INCREMENT,
    roomname varchar(30) NOT NULL,
    PRIMARY KEY (id),
    stamp_created timestamp default now(),
    stamp_updated timestamp default now() on update now()

);

CREATE TABLE messages (
  /* Describe your table here.*/
  id int NOT NULL AUTO_INCREMENT,
  message_text varchar(200),
  user_id int NOT NULL,
  room_id int,
  stamp_created timestamp default now(),
  stamp_updated timestamp default now() on update now(),

  PRIMARY KEY (id),
  FOREIGN KEY (room_id)
    REFERENCES rooms(id)
      ON UPDATE CASCADE ON DELETE CASCADE,

  INDEX userIndex (user_id),
  INDEX roomIndex (room_id)
);

ALTER TABLE Orders
ADD CONSTRAINT fk_PerOrders
FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id)
  FOREIGN KEY (user_id)
    REFERENCES users(id)
      ON UPDATE CASCADE ON DELETE CASCADE,
/* Create other tables and define schemas for them here! */



-- CREATE TABLE messages (
--   /* Describe your table here.*/
--   id int NOT NULL AUTO_INCREMENT,
--   message_text varchar(200),
--   user_id int NOT NULL,
--   roomname varchar(30),
--   stamp_created timestamp default now(),
--   stamp_updated timestamp default now() on update now(),

--   PRIMARY KEY (id)
-- );


/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

