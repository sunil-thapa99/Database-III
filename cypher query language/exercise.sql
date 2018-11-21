CREATE (MachathyWilson:Person{name:'Machathy Wilson', born:1985})-[:BORROWS]->(LostTrive:Movie{title:'The Lost Trive', released:2009})
CREATE (LostTrive)-[:ISSUED_BY]->(Devolder:Person{title:'Devolder Jack', born:1950}) 

CREATE (HiddenWorld:Book{title:'The hidden World', released:'2017'})
CREATE (MachathyWilson)-[:BORROWS]->(HiddenWorld)

RETURN MachathyWilson, Devolder, LostTrive, HiddenWorld;

MATCH (m:Movie{title:'The Lost Trive'})
SET m.issuedon=2018
RETURN m;

MATCH (m:Book{title:'The hidden World'})
SET m.issuedon=2017
RETURN m;

-- Milena Yesko Tala ko 

MATCH (p:Person{name:'Machathy Wilson'})
REMOVE p:Person
SET b:Student
RETURN b;

MATCH (p:Movie{title:'The Lost Trive'})
REMOVE p:Movie
SET b:Book
RETURN b;

MATCH (p:Person{name:'Devolder Jack'})
REMOVE p:Person
SET b:Staff
RETURN b;