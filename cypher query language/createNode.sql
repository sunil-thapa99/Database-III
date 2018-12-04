/*
	Creating node (refered as table) n, l, p with labels Module, Lecturer, Pathway 
	() <= defines nodes
	{} <= defines properties
	[] <= defines relationship
*/

CREATE (n:Module{code:'CSY3024', name:'Databases 3'})
	CREATE (l:Lecturer{name:'James Xue'})
CREATE (p:Pathway{code:'C', name:'General Computing'})

MATCH (l:Lecturer), (m:Module)
WHERE l.name = 'James Xue' AND m.code='CSY3024'
CREATE (l)-[t:TEACHES]->(m)

/*
	will create a multiple node
*/
create (n), (m) return n, m 
/*
	will return all the created node
*/
match (n) return n
match (m) return m
/*
	will return only two nodes
*/
match (n) return n limit 2
/*
	search
*/
match (n) where id(n)=2251 return n
/*
	Use comparison operator
	Those nodes having relation can't be deleted like this. First, there relation must be deleted then only node can be deleted
	If you wanna delete node and relationship connected to it, use DETACH
	MATCH (a:Module {Name: "CSY3024"}) DETACH DELETE a
*/

match (n) where id(n) IN [2251, 2248] return n 
match (n) where id(n)=2251 delete n
match (n) where id(n) IN [2246, 2247] delete n 
match (n) delete n

/*
	Delete relationship of type TEACHES
*/

match ()-[t:TEACHES]-()
delete t
/*
	Delete relationship of type TEACHES where all node1 have a relationship with node2

	MATCH (:node1)-[r:RELEASED]-(:node2) 
	DELETE r
	
	This will delete all the the artist of Name: "Strapping Young Lad" having relationship type of RELEASED with the album of name
	"Heavy as a Really Heavy Thing"
	
	MATCH (:Artist {Name: "Strapping Young Lad"})-[r:RELEASED]-(:Album {Name: "Heavy as a Really Heavy Thing"}) 
	DELETE r
	
	match(n) delete n => deletes all the node 
	
	MATCH (n)
	DETACH n 
	DELETE n => delete all nodes and relationship
*/