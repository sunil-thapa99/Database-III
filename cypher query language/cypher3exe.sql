CREATE (n:Person{chaufferName:'Bill White', name:'Oliver Stone', bornin:'New York'})
CREATE (m:Person{chaufferName:'John Brown', name:'Charlie Sheen', bornin:'New York'})
CREATE (o:Person{chaufferName:'Bob Brown', name:'Martin Sheen', bornin:'Ohio'})
CREATE (p:Person{chaufferName:'Ted Green', name:'Rob Reiner', bornin:'New York'})
CREATE (q:Person{bornin:'New Jersey', chaufferName:'John Brown', name:'Michael Dougles'})
RETURN n, m, o, p, q;

CREATE (n:Movie{title:'Wall Street'})
CREATE (m:Movie{title:'The American President'})
RETURN n, m;

MATCH (n:Person), (m:Movie{title:'Wall Street'})
MERGE (n)-[:ACTED_IN]->(m)
return n, m;

MATCH (n:Person{name:'Rob Reiner'})-[r:ACTED_IN]->(m:Movie{title:'Wall Street'})
DELETE r 
RETURN n, m;


MATCH (n:Person{name:'Rob Reiner'}), (m:Movie{title:'The American President'})
MERGE (n)-[:ACTED_IN]->(m)
return n, m;

MATCH (n:Person{name:'Martin Sheen'}), (m:Movie{title:'The American President'})
MERGE (n)-[:ACTED_IN]->(m)
return n, m;

MATCH (n:Person{name:'Michael Dougles'}), (m:Movie{title:'The American President'})
MERGE (n)-[:ACTED_IN]->(m)
return n, m;

MATCH (n:Person{name:'Charlie Sheen'}), (m:Person{name:'Martin Sheen'})
MERGE (n)-[:FATHER]->(m)
return n, m;

MATCH (n:Person), (m:Movie)
return n, m;