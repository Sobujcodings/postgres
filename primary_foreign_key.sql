-- primary and foreign key

SELECT * from users;

create TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25)
);

INSERT INTO users(username) VALUES 
    ('meraj'),
    ('sobuj'), 
    ('rana');

DROP TABLE users;
DROP TABLE post;



-- another table
SELECT * from post;
-- ON DELETE CASCADE (users r id te on delete cascade use korle user table r id k delete korle ekhaner foreign key tao delete hoye jabe default bhabe atkabe na)
create TABLE post(
    id SERIAL UNIQUE PRIMARY KEY,
    title TEXT,
    user_id INTEGER REFERENCES users(id) ON DELETE RESRICT
    -- user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
    -- user_id INTEGER REFERENCES users(id)  ON DELETE SET NULL 
    -- user_id INTEGER REFERENCES users(id)  ON DELETE SET DEFAULT  DEFAULT 2 
);
INSERT INTO post(title, user_id)VALUES
    ('enjoy the sunny day', 1),
    ('batash just shared an amazing recipe!', 2),
    ('exploring adventures with sagor', 3);

-- TRUNCATE TABLE post;




-- ALTER containts to user_id to NOT NULL
ALTER TABLE post
    alter column user_id set NOT NULL;




-- retrieve all post for user with ID  3
-- SELECT post from users
SELECT * FROM post
    WHERE user_id = 3;
 



-- Topics (foreign key set korar por user r akta record delete korle sheta post table ki rokom effect porbe ta amra chaile control korte pari)
-- 1.Restrict Deletetion -> ON DELETE RESRICT / ON DELETE ON ACTION (default) => (DEFAULT BEHAIBOUR) cant delete (jodi ai use_id k onno kono table e refer kore thaki shekane delete kore eshe ekhane delete korte hobe)
-- 2.Cascading deletion -> ON DELETE CASCADE  => (both will be deleted from primary & foreign key) (jokhon user jekhane foreign key use korchi shetar suppose 3 num use k row delete kore dichi tahole 3 num user_id post tao delete hoye jabe )
-- 3.Setting NULL -> ON DELETE SET NULL      => (if deleted from primary key table -> null it in the foreign key table where we use it) user_id jekhane foreign key hishebe use hoice sekhane null boshe jabe
-- 4.Set Default value -> ON DELETE SET DEFAULT  => (jekno akta user_id delete korle refer k kora jaygay default value boshbe)

-- 1. Restrict Deletetion (default beheibour cant delete this coz we are using this id in post table as foreign key)
DELETE FROM users
    WHERE id = 3;

-- 2. Cascading deletion -> ON DELeTE CASCADE  => (both will be deleted from primary & foreign key) 
-- (ai id diye foreign key jekhane use kora hoichilo shei id te (ON DELeTE CASCADE) use korte hobe)




-- retrive all post title with their username (important!!!)
-- akta table theke abar (foreign key r maddhome connect hole) arekta table r data ante hole join korte hobe!!!
-- this topic in join.sql file

