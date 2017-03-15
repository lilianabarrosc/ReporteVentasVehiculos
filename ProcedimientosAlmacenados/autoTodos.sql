DROP FUNCTION IF EXISTS autoTodos () $$

-- =============================================
-- Descripcion	: Selecciona todos los autos
-- =============================================

CREATE OR REPLACE FUNCTION autoTodos ()
RETURNS SETOF "auto" AS
$BODY$ DECLARE
	sql TEXT;
BEGIN
	sql = 'SELECT * 
	FROM
		"auto"';
	
	RETURN QUERY EXECUTE sql;
END;
$BODY$ LANGUAGE 'plpgsql' VOLATILE
COST 100 $$