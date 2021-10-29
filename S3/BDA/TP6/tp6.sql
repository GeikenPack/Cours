DELETE FROM plan_table;

EXPLAIN PLAN
SET statement_id = 'Q1'
FOR
SELECT C.name
FROM Country C, Continent Co
WHERE C.area >= 100
  AND Co.area >=100000
  AND C.cname = Co.name;

SET PAGESIZE 1000;
COLUMN id                FORMAT 99;
COLUMN parent_id         FORMAT 99;
COLUMN operation         FORMAT A20;
COLUMN options           FORMAT A20;
COLUMN filter_predicates FORMAT A30;
COLUMN access_predicates FORMAT A30;
COLUMN projection        FORMAT A20;

SELECT id, parent_id,
       operation, options, object_name,
       filter_predicates, access_predicates, projection
FROM PLAN_TABLE
WHERE statement_id = 'Q1';