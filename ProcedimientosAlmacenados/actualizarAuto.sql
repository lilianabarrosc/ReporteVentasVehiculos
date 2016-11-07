DROP FUNCTION IF EXISTS actualizarAuto () $$

-- =============================================
-- Descripcion	: Modifica un auto existente
-- =============================================

CREATE OR REPLACE FUNCTION actualizarAuto (
	IN inmarca character varying(50)[],
  	IN inmodelo character varying(50)[],
  	IN intipocombustibe character varying(50)[],
	IN inanio integer
)
RETURNS void AS
$BODY$ BEGIN

	UPDATE "auto" 
	SET
		"marca" = inmarca,
		"modelo" = inmodelo,
		"intipocombustibe" = intipocombustibe,
		"anio" = inanio
	WHERE inID = "idauto";
	
END;
$BODY$ LANGUAGE 'plpgsql' VOLATILE
COST 100 $$