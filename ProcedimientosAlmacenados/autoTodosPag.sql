DROP FUNCTION IF EXISTS autoTodosPag () $$

-- =============================================
-- Descripcion	: Selecciona autos por un rango
-- =============================================

CREATE OR REPLACE FUNCTION autoTodosPag (inIndex integer, inNext integer)
RETURNS SETOF "auto" AS
$BODY$ DECLARE
	sql TEXT;
BEGIN
	sql = 'SELECT
		"idauto",
		"marca",
		"modelo",
		"tipocombustibe",
		"anio"
	FROM
		"auto"
	ORDER BY "idauto" LIMIT ' || inNext || ' OFFSET ' || inIndex;
	
	RETURN QUERY EXECUTE sql;

END;
$BODY$ LANGUAGE 'plpgsql' VOLATILE
COST 100 $$