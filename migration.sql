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
    price DOUBLE UNSIGNED NOT NULL,
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
  cat_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (ads_id) REFERENCES ads(id)
        ON DELETE CASCADE,
  FOREIGN KEY (cat_id) REFERENCES categories(id)
        ON DELETE CASCADE
);

INSERT INTO categories (category)
VALUES ('Xbox'), ('Playstation'), ('Nintendo'), ('PC');
