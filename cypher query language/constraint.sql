/*
	Create unique constraint on propert code of label Module
*/
CREATE CONSTRAINT ON (m:Module) ASSERT m.code IS UNIQUE;
/*
	View constraints, indexes using :schema
*/
:schema
/*
	Drop unique constraint on property code of label Module
*/
DROP CONSTRAINT ON (m:Module) ASSERT m.code IS UNIQUE;

-- Create and drop index on property code of label Module
CREATE INDEX ON :Module(code);
DROP INDEX ON :Module(code);

-- SET clause
-- It is used to update labels n nodes and properties on nodes and relationships.
/*
	Match Module with code name CSY2024, add attributes
*/
CREATE (m:Module{code:'CSY2024'});

MATCH (m:Module{code:'CSY2024'})
SET m.level=6
RETURN m

MATCH (m:Module{code:'CSY2024'})
SET m += {credit: 20, desc:'advanced database module'}
RETURN m

-- Copying properties between nodes and between relationships
CREATE (n:Module{code:'CSY2038', name:'Database 2'})

MATCH (m:Module{code:'CSY2024'}), (n:Module{code:'CSY2038'})
SET n=m RETURN m, n


-- Task (Update label)

MATCH (m:Module{code:'CSY2024'})
SET m:module
RETURN m