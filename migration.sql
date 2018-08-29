USE team_adlister_db;

DROP TABLE IF EXISTS ads_cat;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE categories (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  category VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price INT UNSIGNED NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    cat_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE,
    FOREIGN KEY (cat_id) REFERENCES categories(id)
        ON DELETE CASCADE
);

CREATE TABLE ads_cat (
  ads_id INT UNSIGNED NOT NULL,
  cats_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (ads_id) REFERENCES ads(id)
        ON DELETE CASCADE,
  FOREIGN KEY (cats_id) REFERENCES categories(id)
        ON DELETE CASCADE
);

SELECT categories.category
FROM categories
 JOIN ads_cat
   ON ads_cat.cats_id = categories.id
WHERE cats_id IN (
 SELECT ads.cat_id
 FROM ads
 WHERE ads_cat.ads_id = 2
);

SELECT t.*, t2.username, t2.email, t3.category
FROM ads t LEFT JOIN users t2 ON t.user_id = t2.id
LEFT JOIN ads_cat ON cat_id
LEFT JOIN categories t3 ON ads_cat.cats_id = t3.category
WHERE t.id = 2 LIMIT 1;


INSERT INTO ads_cat(ads_id, cats_id)
VALUES (1, 'Xbox'), (2, 'Playstation'), (3, 'Nintendo'), (4, 'PC');



INSERT INTO categories (category)
VALUES ('Xbox'), ('Playstation'), ('Nintendo'), ('PC');

INSERT INTO users (username, email, password)
VALUES ('userOne', 'userOne@email.com', 'password'),
      ('userTwo', 'userTwo@email.com', 'password');

INSERT INTO ads (user_id, title, description, price, city, state, cat_id)
VALUES (1, 'Halo 5: Guardians', 'For Xbox One, first-person shooter.', 15, 'San Antonio', 'Texas', 1),
      (1, 'God of War', 'For Playstation 4, action-adventure, rpg video game.', 35, 'San Antonio', 'Texas', 2),
      (2, 'Mario Kart 8', 'For Nintendo Switch, cartoon, fantasy racing game', 40, 'Austin', 'Texas', 3);