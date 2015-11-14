USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SINCRONIZAR_CLIENTES]    Script Date: 11/13/2015 18:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SINCRONIZAR_CLIENTES]
AS
BEGIN
	INSERT INTO DBO.ZOCLIEN1 (COD, CUIT, TIPO, RAZSOC, DIRSUC, CIUDAD, PAIS, TELEFONOSUC, CODREGION, Latitud, Longitud)
	SELECT COD, CUIT, TIPO, [DESC], DIR, PROV, COL008, COL009, REGION, LATITUD, LONGITUD
	FROM DBO.ZOCLIEN1_TEMP ORIGEN
	WHERE NOT EXISTS(SELECT * 
					 FROM DBO.ZOCLIEN1 DESTINO
					 WHERE (ORIGEN.COD = DESTINO.COD)
					 ); 
         
	UPDATE DBO.ZOCLIEN1 SET FLGBAJALOGICA='1'
	WHERE COD NOT IN (SELECT COD FROM DBO.ZOCLIEN1_TEMP);
	
	UPDATE DBO.ZOCLIEN1 SET
	CUIT = TMP.CUIT,
	TIPO = TMP.TIPO,
	RAZSOC = TMP.[DESC],
	DIRSUC = TMP.DIR,
	CIUDAD = TMP.PROV,
	PAIS = TMP.COL008,
	TELEFONOSUC = TMP.COL009,
	CODREGION = TMP.REGION,
	LATITUD = TMP.LATITUD,
	LONGITUD = TMP.LONGITUD
	FROM DBO.ZOCLIEN1 ORIG
	INNER JOIN DBO.ZOCLIEN1_TEMP TMP
	ON ORIG.COD = TMP.COD and
	ORIG.CodRegion = TMP.region;
	  	
	-- BORRO TABLA TEMPORAL DE CLIENTES
	DELETE FROM DBO.ZOCLIEN1_TEMP;
END

