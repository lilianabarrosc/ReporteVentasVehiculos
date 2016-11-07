DROP FUNCTION IF EXISTS eliminarAuto () $$

-- =============================================
-- Descripcion	: Elimina un auto existente por el ID
-- =============================================

CREATE OR REPLACE FUNCTION eliminarAuto (
	IN inID integer
)
RETURNS void AS
$BODY$ BEGIN

	DELETE FROM "auto" 
	WHERE inID = "idauto";

EXCEPTION

WHEN SQLSTATE '23503' THEN  
	RAISE EXCEPTION 'No se pudo borrar el  auto';

	
	
END;
$BODY$ LANGUAGE 'plpgsql' VOLATILE
COST 100 $$
Contact GitHub API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Status Help