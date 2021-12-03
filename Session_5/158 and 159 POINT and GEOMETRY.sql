BEGIN TRAN
CREATE TABLE tblGeom
( GXY GEOMETRY,
DESCRIPTION VARCHAR(30),
IDtblgeom INT CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(1,1))

INSERT INTO tblGeom
VALUES (GEOMETRY::STGeomFromText('POINT (3 4)',0),'First point'),
	   (GEOMETRY::STGeomFromText('POINT (3 5)',0),'Second point'), -- This is the best standard to use
	   (GEOMETRY::Point(4,6,0),'Third point'),
	   (GEOMETRY::STGeomFromText('MULTIPOINT ((1 2), (2 3), (3 4))', 0), 'Three Points')
-- ST meaning static
-- We make a Static geometry point from text

-- SRID
-- Spacial Reference system IDentifier

SELECT * FROM tblGeom

ROLLBACK TRAN