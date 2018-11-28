MERGE (l:FOOTBALLER{name:"Sunil"}) return l;

-- MERGE with ON MACTH SET 
MERGE (l:FOOTBALLER{name:'Messi'})
ON CREATE SET l.createtime = timestamp()
ON MATCH SET l.foundtime = timestamp()
RETURN l.name, l.createtime, l.foundtime;

-- When two nodes exists but relationship doesnot exits
CREATE (n:FOOTBALLER{name:'Ronaldo'}) RETURN n;
CREATE (m:CLUB{club_name:'Juventus'}) RETURN m;
MERGE (n:FOOTBALLER{name:'Ronaldo'})-[:PLAYS_FOR]->(m:CLUB{club_name:'Juventus'}) RETURN n, m

-- WHen two nodes exists without relationship, merge a un-directional relationship
CREATE (n:FOOTBALLER{name:'Messi'}) RETURN n;
CREATE (m:CLUB{club_name:'FC Barcelona'}) RETURN m;
MATCH (n:FOOTBALLER{name:"Messi"}), (m:CLUB{club_name:'FC Barcelona'})
MERGE (n)-[:PLAYS_FOR]->(m) RETURN n, m;
