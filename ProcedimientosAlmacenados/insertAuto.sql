DROP FUNCTION IF EXISTS insertAuto() $$

-- =============================================
-- Descripcion	: Crea un auto nuevo
-- =============================================

CREATE OR REPLACE FUNCTION insertAuto (
	OUT outID integer,

	IN inmarca character varying(50)[],
  	IN inmodelo character varying(50)[],
  	IN intipocombustibe character varying(50)[],
	IN inanio integer
)
RETURNS integer AS
$BODY$ BEGIN

	INSERT INTO "auto"
	(
		"marca",
		"modelo",
		"tipocombustibe",
		"inanio"
	)
	VALUES
	(
		inmarca,
		inmodelo,
		intipocombustibe,
		inanio
	);

	outID = lastval();
	
END;
$BODY$ LANGUAGE 'plpgsql' VOLATILE
COST 100 $$