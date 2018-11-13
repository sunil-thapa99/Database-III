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