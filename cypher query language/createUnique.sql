-- CREATE UNIQUE prevents duplication

-- In this code, state remains created on running the block of code. 
CREATE (e:Episode{title:'foo'})
MERGE (p:Person{name:'Lynn Rose'})
ON CREATE SET p.name = 'Lynn Rose', p.state='created'
ON MATCH SET p.state='matched'
CREATE UNIQUE (e)<-[:INTERVIEWED_IN]-(p)
RETURN e, p;

-- Delete relationship and nodes
MATCH ()-[r:INTERVIEWED_IN]->() delete r;
MATCH (e:Episode)
delete e;
MATCH (p:Person{name:'Lynn Rose'})
delete p;

/*
	-- This only works on latest version.
	MATCH (n) detach n delete n;

	-- This deletes all the relationship and nodes
	MATCH (n)
	OPTIONAL MATCH (n)-[r]-()
	DELETE n, r
*/

-- Create person and episode
CREATE (p:Person{name:'Lynn Rose'})
CREATE (e:Episode{title:'foo'})
RETURN p,e;

-- On running this code, state changes to matched. 
MERGE (p:Person{name:'Lynn Rose'})
MERGE (e:Episode{title:'foo'})
ON CREATE SET p.name = 'Lynn Rose', p.state='created'
ON MATCH SET p.state='matched'
CREATE UNIQUE (e)<-[:INTERVIEWED_IN]-(p)
RETURN e, p;


-- Create node if missing
CREATE (:Person{name:'Joe'})
CREATE (:Person{name:'Alice'})
CREATE (:Person{name:'Chloe'})
CREATE (:Person{name:'Gary'})

MATCH (p1:Person{name:'Joe'}), (p2:Person{name:'Alice'})
CREATE (p1)-[:MEETS]->(p2)
RETURN p1, p2;

MATCH (p1:Person{name:'Joe'}), (p2:Person{name:'Chloe'})
CREATE (p1)-[:MEETS]->(p2)
RETURN p1, p2;

MATCH (p1:Person{name:'Joe'}), (p2:Person{name:'Gary'})
CREATE (p1)-[:MEETS]->(p2)
RETURN p1, p2;

MATCH (p1:Person{name:'Alice'}), (p2:Person{name:'Gary'})
CREATE (p1)-[:MEETS]->(p2)
RETURN p1, p2;

/*
	Joe has no LOVES relationship, so a node is created, and also a relationship to that node is created.
	* Joe-[LOVES]->EmptyNode
*/
MATCH (p1:Person{name:'Joe'})
CREATE UNIQUE (p1)-[:LOVES]->(someone)
RETURN p1;

