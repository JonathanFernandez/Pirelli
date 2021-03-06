USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_ZOCLIENTE]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SP_SELECT_ZOCLIENTE @COD='0009200212',@RAZSOC='%',@CODPROV='%',@FLGBAJALOGICA='1'
CREATE PROCEDURE [dbo].[SP_SELECT_ZOCLIENTE] 
(--declare
 @COD VARCHAR(10) = '%%',
 @RAZSOC VARCHAR(45) = '%',
 @CODPROV VARCHAR(2)  = '%',
 @FLGBAJALOGICA CHAR(1)  = '%'
 
)AS
BEGIN
--select @COD='0009200212',@RAZSOC='%',@CODPROV='%',@FLGBAJALOGICA='1'
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
		--AND		FLGBAJALOGICA LIKE @FLGBAJALOGICA
		
		
END

GO
