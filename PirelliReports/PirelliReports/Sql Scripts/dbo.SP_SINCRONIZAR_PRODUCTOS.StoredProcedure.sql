USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SINCRONIZAR_PRODUCTOS]    Script Date: 11/11/2015 1:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SINCRONIZAR_PRODUCTOS]
AS
BEGIN
	INSERT INTO DBO.ZOPRODU1 (IP, DESCRIP, PAIS, OTRO, FAMILIA, MARCA, RANGO)
	SELECT ORIGEN.IP, ORIGEN.DESCRIP, ORIGEN.PAIS, ORIGEN.OTRO, ORIGEN.FAMILIA, ORIGEN.MARCA, ORIGEN.RANGO
	FROM DBO.ZOPRODU1_TEMP ORIGEN
	WHERE NOT EXISTS(SELECT * 
					 FROM DBO.ZOPRODU1 DESTINO
					 WHERE (ORIGEN.IP = DESTINO.IP)
					 );
	                
	--SE IGNORAN LAS IP DUPLICADAS
	UPDATE DBO.ZOPRODU1
	SET
	FLGBAJALOGICA = '1'
	FROM DBO.ZOPRODU1
	INNER JOIN
	(
	SELECT IP, DESCRIP, PAIS, OTRO, FAMILIA, MARCA, RANGO, FLGBAJALOGICA FROM
	(SELECT *  FROM  ZOPRODU1 WHERE PAIS > (SELECT MIN(PAIS) FROM ZOPRODU1 TBL1 WHERE ZOPRODU1.IP = TBL1.IP))AS TAB_TEMP
	) AS TABLA ON TABLA.IP=DBO.ZOPRODU1.IP AND TABLA.PAIS=ZOPRODU1.PAIS;
	
	UPDATE DBO.ZOPRODU1 
	SET
	DESCRIP = TMP.DESCRIP,
	PAIS = TMP.PAIS,
	OTRO = TMP.OTRO,
	FAMILIA = TMP.FAMILIA,
	MARCA = TMP.MARCA,
	RANGO = TMP.RANGO
	FROM DBO.ZOPRODU1 ORIG
	INNER JOIN DBO.ZOPRODU1_TEMP TMP ON 
	ORIG.IP = TMP.IP and
	orig.pais = tmp.pais;

	-- SE BORRA TABLA DE PRODUCTOS TEMPORAL
	DELETE FROM DBO.ZOPRODU1_TEMP;
END
GO
