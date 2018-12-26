LOAD CSV WITH HEADERS FROM "file:///computing_modules.csv" as row
MERGE (m:Module{code:row.code, title:row.title, level:toInteger(row.level), credits:toInteger(row.credits)})
RETURN m;

LOAD CSV WITH HEADERS FROM "file:///computing_modules.csv" as row
RETURN row;

LOAD CSV FROM 'file:///computing_modules.csv' AS line
MERGE (h:Headers)
SET h.names = line
WITH line
LIMIT 1
UNWIND line[3..5] AS name
MERGE (c:Cell {name: name})
RETURN c;

LOAD CSV WITH HEADERS FROM "file:///computing_modules.csv" AS line WITH line
RETURN line
LIMIT 5;

LOAD CSV WITH HEADERS FROM "file:///computing_modules.csv" as row
MERGE (m:Module{code:row.code});

LOAD CSV WITH HEADERS FROM "file:///computing_modules.csv" as row
MATCH (row.Headers);