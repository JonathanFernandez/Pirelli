USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SINCRONIZAR_CLIENTES]    Script Date: 11/11/2015 1:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SINCRONIZAR_CLIENTES]
AS
BEGIN TRANSACTION 
	INSERT INTO DBO.ZOCLIEN1 (COD, CUIT, TIPO, RAZSOC, DIRSUC, CIUDAD, PAIS, TELEFONOSUC, CODREGION)
	SELECT COD, CUIT, TIPO, [DESC], DIR, PROV, COL008, COL009, REGION
	FROM DBO.ZOCLIEN1_TEMP ORIGEN
	WHERE NOT EXISTS(SELECT * 
					 FROM DBO.ZOCLIEN1 DESTINO
					 WHERE (ORIGEN.COD = DESTINO.COD)
					 ); 
    IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN 1
	END
	                
	UPDATE DBO.ZOCLIEN1 SET FLGBAJALOGICA='1'
	WHERE COD NOT IN (SELECT COD FROM DBO.ZOCLIEN1_TEMP);
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN 2
	END
	
	UPDATE DBO.ZOCLIEN1 SET
	CUIT = TMP.CUIT,
	TIPO = TMP.TIPO,
	RAZSOC = TMP.[DESC],
	DIRSUC = TMP.DIR,
	CIUDAD = TMP.PROV,
	PAIS = TMP.COL008,
	TELEFONOSUC = TMP.COL009,
	CODREGION = TMP.REGION
	FROM DBO.ZOCLIEN1 ORIG
	INNER JOIN DBO.ZOCLIEN1_TEMP TMP
	ON ORIG.COD = TMP.COD;
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN 3
	END
	  	
	-- BORRO TABLA TEMPORAL DE CLIENTES
	DELETE FROM DBO.ZOCLIEN1_TEMP;
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN 4
	END 
COMMIT TRANSACTION [T_SINCRONIZAR_CLIENTES]
		

GO
