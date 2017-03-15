DROP FUNCTION IF EXISTS autoSeleccionar () $$

-- =============================================
-- Descripcion	: Selecciona un auto
-- =============================================

CREATE OR REPLACE FUNCTION autoSeleccionar (inID integer)
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
	WHERE
		"idauto" = ' || inID;
	
	RETURN QUERY EXECUTE sql;
END;
$BODY$ LANGUAGE 'plpgsql' VOLATILE
COST 100 $$