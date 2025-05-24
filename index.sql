-- INDEX (indexing query time reduce kore -> boro database/table e beshi use hoy)
-- frequently change hoy amon table e indexing na korai bhalo karon tahole index o change korte hoy data update hobe
-- foreign key chesta korbe indexing korar
-- primary key/unique key r moddhe implicitly akta indexing korei dey database -> jar fole p_key diye query korle druto data pai


-- INDEXING r algorithm gula (ak akta algo ak akta operation e faster kaj kore)
-- * B-TREE (Default)
-- * HASH
-- * GIN
-- * GIST


-- if we want specefic algo for indexing
CREATE INDEX idx_employes_last_name
    on employes USING HASH(last_name)



-- EXPLAIN ANALYSE (dile kibhabe query ta run hoice sheta dekhte pabo)
EXPLAIN ANALYSE
SELECT * from employes
    WHERE employee_name = 'Amy White';



-- boro table r query time komiye anar jonno amra certain column k indexing kori
-- index toyri korar pore amra shei column e(employee_name) query run korle query time kom lagbe
-- (idx_employes_last_name => index name)
CREATE INDEX idx_employes_name 
    on employes(employee_name);



-- show data_directory dile show korbe data gulo kothay store hocche => C:/Program Files/PostgreSQL/17/data
SHOW data_directory;