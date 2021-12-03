 BEGIN TRANSACTION
CREATE TABLE tblGeom
(GXY GEOMETRY,
DESCRIPTION VARCHAR(20),
IDtblGeom INT CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(5,1))
INSERT INTO tblGeom
VALUES (GEOMETRY::STGeomFromText('LINESTRING (1 1, 5 5)', 0),'First line'),
	   (GEOMETRY::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0),'Second line'),
	   (GEOMETRY::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0),'Third line'),
	   (GEOMETRY::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
	   (GEOMETRY::STGeomFromText('POLYGON ((5 2, 7 2, 7 4, 5 4, 5 2))', 0), 'Second Polygon'),
	   (GEOMETRY::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle')
SELECT * FROM tblGeom

SELECT *  FROM tblGeom
WHERE GXY.Filter(GEOMETRY::Parse('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))')) = 1
UNION ALL
SELECT GEOMETRY::STGeomFromText('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))', 0), 'Filter', 0

DECLARE @i AS GEOMETRY
SELECT @i = GEOMETRY::UnionAggregate(GXY) -- Irrelevant error message
FROM tblGeom

SELECT @i AS CombinedShapes

DECLARE @j AS GEOMETRY
SELECT @j = GEOMETRY::CollectionAggregate(GXY) -- Irrelevant error message
FROM tblGeom

SELECT @j

SELECT @i AS CombinedShapes
--union all
SELECT GEOMETRY::EnvelopeAggregate(GXY) AS Envelope FROM tblGeom -- Irrelevant error message
--union all
SELECT GEOMETRY::ConvexHullAggregate(GXY) AS Envelope FROM tblGeom -- Irrelevant error message

ROLLBACK TRANSACTION
