USE [Comercial]
GO
/****** Object:  StoredProcedure [PROD].[SP_INSERT_UPDATE_ZOTIPOPROMOxIP]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Emanuel Barbera
-- Create date: Ocutbre 2014
-- Description:	SP para Actualizar la Tabla ZoTipoPromoXIP, caso se generen nuevas IP, o se de de baja alguna.
-- =============================================
--EXEC SP_INSERT_UPDATE_ZOTIPOPROMOxIP 
CREATE PROCEDURE [PROD].[SP_INSERT_UPDATE_ZOTIPOPROMOxIP] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE dbo.ZoTipoPromoXIP WHERE CodTipoPromo IN ('63','65', '66','79')
	
	/***********************************************************
							PROMO PULGADAS
	************************************************************/						
	--R13
	INSERT INTO dbo.ZoTipoPromoXIP
	SELECT DISTINCT '66', IP, 6.5	FROM ZoProdu1 WHERE Rodado = 13 --AND  FlgBajaLogica = 0
	--R14
	INSERT INTO dbo.ZoTipoPromoXIP
	SELECT DISTINCT '66', IP, 7		FROM ZoProdu1 WHERE Rodado = 14 --AND  FlgBajaLogica = 0
	--R15	
	INSERT INTO dbo.ZoTipoPromoXIP
	SELECT DISTINCT '66', IP, 7.5	FROM ZoProdu1 WHERE Rodado = 15 --AND  FlgBajaLogica = 0
	--R16
	INSERT INTO dbo.ZoTipoPromoXIP
	SELECT DISTINCT '66', IP, 8		FROM ZoProdu1 WHERE Rodado = 16 --AND  FlgBajaLogica = 0
	--R17
	INSERT INTO dbo.ZoTipoPromoXIP
	SELECT DISTINCT '66', IP, 8.5	FROM ZoProdu1 WHERE Rodado = 17 --AND  FlgBajaLogica = 0
	--R18
	INSERT INTO dbo.ZoTipoPromoXIP
	SELECT DISTINCT '66', IP, 9		FROM ZoProdu1 WHERE Rodado = 18 --AND  FlgBajaLogica = 0
	--R19
	INSERT INTO dbo.ZoTipoPromoXIP
	SELECT DISTINCT '66', IP, 9.5	FROM ZoProdu1 WHERE Rodado = 19 --AND  FlgBajaLogica = 0
	--R20
	INSERT INTO dbo.ZoTipoPromoXIP
	SELECT DISTINCT '66', IP, 10	FROM ZoProdu1 WHERE Rodado = 20 --AND  FlgBajaLogica = 0
	
	
	
	/***********************************************************
							PROMO TRUCK
	************************************************************/
	INSERT INTO dbo.ZoTipoPromoXIP
	SELECT DISTINCT '63', IP, 4
	FROM ZoProdu1 ZP	INNER JOIN  T000_FAMILIA FA ON FA.FAMICODI = ZP.Familia
	WHERE FA.FAMIAGRCODI = 'TRUCK' --AND FlgBajaLogica = 0 
		UNION ALL
	SELECT DISTINCT '65', IP, 4
	FROM ZoProdu1 ZP	INNER JOIN  T000_FAMILIA FA ON FA.FAMICODI = ZP.Familia
	WHERE FA.FAMIAGRCODI = 'TRUCK' --AND FlgBajaLogica = 0
		UNION ALL
	SELECT DISTINCT '79', IP, CASE WHEN IP = '2393500' THEN 5 ELSE 4 END
	FROM ZoProdu1 ZP	INNER JOIN  T000_FAMILIA FA ON FA.FAMICODI = ZP.Familia
	WHERE FA.FAMIAGRCODI = 'TRUCK' --AND FlgBajaLogica = 0 
			AND IP NOT IN ('1466700','1467300','1622100','1680700')
	




END

GO
