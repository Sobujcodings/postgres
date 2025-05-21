
SELECT * from users;

create TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25)
);

INSERT INTO users(username) VALUES 
    ('meraj'),
    ('sobuj'), 
    ('rana'),
    ('sagor');

DROP TABLE users;
DROP TABLE post;



-- another table
SELECT * from post;
create TABLE post(
    id SERIAL UNIQUE PRIMARY KEY,
    title TEXT,
    user_id INTEGER REFERENCES users(id)
    -- user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
    -- user_id INTEGER REFERENCES users(id)  ON DELETE SET NULL 
    -- user_id INTEGER REFERENCES users(id)  ON DELETE SET DEFAULT  DEFAULT 2 
);
INSERT INTO post(title, user_id)VALUES
    ('enjoy the sunny day', 1),
    ('batash just shared an amazing recipe!', 2),
    ('exploring adventures with sagor', 3);





-- * (JOIN) retrive all post title with their username (important!!!).  title => post table, username => users table (so both table should be joined first to get teh value from 2 table)
-- jehetu username post table e nei => so ekhane username k newar jonno users table r sathe connect korate hobe join r maddhome
-- when we need data from multiple table we need join between those tables to get it.


-- JOIN => users table --->  on running table r jei column(post.user_id) -->  JOIN kora table(users) r id sathe
-- JOIN users --> current table foreign key --> that table primary key
-- SELECT title, username FROM post
SELECT * FROM post
    JOIN users on post.user_id = users.id;


-- But shudhu id column dekhate bolle she confused hoye jabe kon table r id dekhabo karon 2ta table join hoye akta hoye geche akhn to id 2ta total 2table r jonno
-- SELECT id FROM post (tar jonno ekhane bolte hobe j ata post.id)
-- SELECT post.id FROM post
SELECT post.id, users.id FROM post
    JOIN users on post.user_id = users.id;



-- table r nam chaile alising korte pari (akta table e diff akta nam set korte pari for easy to write) post -> p diye denote korlm
SELECT p.id, users.id FROM post p
    JOIN users on p.user_id = users.id;

-- table r nam chaile alising korte pari (we can use as also)
SELECT p.id, u.id FROM post p
    JOIN users u on p.user_id = u.id;

-- table r nam chaile alising korte pari 
SELECT * FROM post p
    JOIN users u on p.user_id = u.id;

-- table r nam chaile alising korte pari 
SELECT * FROM post as p
    -- JOIN users as u on p.user_id = u.id
    INNER JOIN users as u on p.user_id = u.id;





-- INNER JOIN -> common join (jeta amra dekhlam previously)
--  post.user_id = user.id (2ta table ai condtion jara meet korche tader niye join korchi 2ta table tai ata -> INNER JOIN)-- table r nam chaile alising korte pari 
-- JOIN users as u on p.user_id = u.id;
SELECT * FROM post
    INNER JOIN users on post.user_id = users.id;




-- amra chaile atake age pore use korte pari condition same thakbe(user k age, post k pore ebhebae tahole just data age pore hobe) -> user data age ashbe -> post pore ashbe ai
-- SELECT * FROM post
--  INNER JOIN users on post.user_id = users.id;
SELECT * FROM users
    INNER JOIN post on post.user_id = users.id;






-- RIGHT JOIN/LEFT JOIN ===> tobe amon situatuion jodi ashe jokhon ami common gula thaklei cholbe na shudhu right pasher circle/table r shob data dekhate hobe sheta right pasher table r sathe id match na korleo dekhate hobe amon
-- RIGHT JOIN/RIGHT OUTER JOIN ==> jokhn bola hobe post table r shob dekhate hobe kono user_id jodi null thake -> shei user_id to user table r kono user k refer korbe na tao tumi post r shob dekhabe
-- LEFT JOIN/LEFT OUTER JOIN ==>  opposite tai holo left join (jokhon left circel/table beshi priority dibo atar shob dekhabe milleo na milleo) 
-- JOIN r shomoy jei table ta age lekhtechi shetai holo LEFT table (left join hole left table r shob data rakhte hobe must)
-- LEFT/RIGHT JOIN r shomoy table r order ta change hoy/matter kore

INSERT INTO post(id,title, user_id)VALUES
    (5,'to understand left JOIN', null);
-- LEFT JOIN (atar reflect bujha jabe tokhon jokhon left amon kichu beshi thakbe jah right e nai like user_id null ache koyekjaygay)
-- left r jei data gula users table e match kore na shei jaygay shob null null boshiye dibe. but title/post table r shob data rakhbe
-- ekhane left table holo post (jeta prothom e thake)
SELECT * FROM post
    LEFT JOIN users on post.user_id = users.id;



-- RIGHT JOIN (right table r shob kichu rakhbe right table ta k priority dibe)
SELECT * FROM post
    RIGHT JOIN users on post.user_id = users.id;




-- FULL JOIN (2ta table/circle) r shobai k shob data k rakhte hobe (match koruk r na koruk)
-- 2table r data e niye ashbe -> jegulo match korbe na shegulo NULL diye fillup korbe
SELECT * FROM post
    FULL OUTER JOIN users on post.user_id = users.id;