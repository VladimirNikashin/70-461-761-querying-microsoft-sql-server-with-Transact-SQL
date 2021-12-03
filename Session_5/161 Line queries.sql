BEGIN TRAN

CREATE TABLE tblGeom
(GXY GEOMETRY, DESCRIPTION VARCHAR(20),
IDtblGeom INT CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY (5,1))

INSERT INTO tblGeom
VALUES (GEOMETRY::STGeomFromText('LINESTRING(1 1, 5 5)', 0), 'First line'),
	   (GEOMETRY::STGeomFromText('LINESTRING(5 1, 1 4, 2 5, 5 1)', 0), 'Second line'),
	   (GEOMETRY::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0), 'Third line'),
	   (GEOMETRY::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
	   (GEOMETRY::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle')
	   -- Polygon must have the same start point as its end point
	   -- CIRCULARSTRING must have the same start point as its end point

	   -- all object SRID's must be the same
	   -- the 0 thats not in the string is the the SRID

SELECT * FROM tblGeom --ORDER BY IDtblGeom DESC
SELECT IDtblGeom, GXY.STGeometryType() AS MyType
, GXY.STStartPoint().ToString() AS StartingPoint
, GXY.STEndPoint().ToString() AS EndingPoint
, GXY.STPointN(1).ToString() AS FirstPoint
, GXY.STPointN(2).ToString() AS SecondPoint
, GXY.STPointN(1).STX AS FirstPoint
, GXY.STPointN(1).STY AS SecondPoint
, GXY.STBoundary().ToString() AS Boundary
, GXY.STLength() AS MyLength
, GXY.STNumPoints() AS NumberPoints
FROM tblGeom

DECLARE @g AS GEOMETRY
SELECT @g = GXY FROM tblGeom WHERE IDtblGeom = 5

SELECT IDtblGeom, GXY.STIntersection(@g).ToString() AS Intersection
, GXY.STDistance(@g) AS DistanceFromFirstLine
FROM tblGeom

SELECT GXY.STUnion(@g), DESCRIPTION
FROM tblGeom
WHERE IDtblGeom = 8

ROLLBACK TRAN