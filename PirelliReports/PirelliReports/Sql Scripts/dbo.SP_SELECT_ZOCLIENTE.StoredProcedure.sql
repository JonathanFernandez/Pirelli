USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_ZOCLIENTE]    Script Date: 19/11/2015 1:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SELECT_ZOCLIENTE] 
(
 @COD VARCHAR(10) = '%%',
 @RAZSOC VARCHAR(45) = '%',
 @CODPROV VARCHAR(2)  = '%',
 @FLGBAJALOGICA VARCHAR(1)  = '%'
 
)
AS
BEGIN

	 SELECT [COD]
      ,[CODCLIMATRIZ]
      ,[CODCLIREFILL]
      ,[CUIT]
      ,[CENTROEMISOR]
      ,[TIPO]
      ,[RAZSOC]
      ,[NOMFANT]
      ,[DIRSUC]
      ,[DIRFACT]
      ,[BARRIO]
      ,[CIUDAD]
      ,[CODPROV]
      ,[PAIS]
      ,[CODREGION]
      ,[TELEFONOSUC]
      ,[TELEFONOFACT]
      ,[TERMINALPOS]
      ,[EMAIL]
      ,[PAGINAWEB]
      ,[CTC_CAR]
      ,[CTC_TRUCK]
      ,[NOTA]
      ,[FECHAALTA]
      ,[FECHAUPD]
      ,[FLGBAJALOGICA]
      ,[FLGFILBUSQ]
      ,[LATITUD]
      ,[LONGITUD]
  FROM
		[DBO].[ZOCLIEN1]
  WHERE 
		PAIS = 'AR'
		AND
		COD LIKE @COD 
		AND
		CODPROV LIKE @CODPROV 
		AND
		RAZSOC LIKE @RAZSOC 
		AND
		FLGBAJALOGICA LIKE @FLGBAJALOGICA
		
		
END

GO
