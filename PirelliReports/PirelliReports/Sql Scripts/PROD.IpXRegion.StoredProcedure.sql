USE [Comercial]
GO
/****** Object:  StoredProcedure [PROD].[IpXRegion]    Script Date: 07/11/2015 17:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [PROD].[IpXRegion]
--agrupado por region 
--declare 
@dateDesde date,
@dateHasta date,
@IP nvarchar(7),
@codRegiones nvarchar(max)
as

/*set @year ='2015-01-01'
set @month = 1
set @IP = '2057600'
*/

/*creo una temp con las ip mas vendidas o con la ip que me vino*/
CREATE TABLE #tempIP  (ip NVARCHAR(7))
IF @IP = 'null'-- is null
BEGIN
	INSERT INTO #tempIP 
	SELECT TOP 5 ip
	FROM ZoSolicitud s
	WHERE
	s.fechaCompra BETWEEN @dateDesde AND @dateHasta
	GROUP BY ip
	ORDER BY COUNT(*) DESC
END
ELSE
BEGIN
	insert into #tempIP 
	select @IP
END

/*creo una temp con todas regiones o con las regiones que me vino*/
CREATE TABLE #tempReg  (codReg NVARCHAR(7))
IF @codRegiones = 'null'-- is null
BEGIN
	INSERT INTO #tempReg 
	SELECT REG_COD
	FROM ZoRegion
	
END
ELSE
BEGIN
	INSERT INTO #tempReg 
	SELECT REG_COD
	FROM ZoRegion
	--WHERE REG_COD in (@codRegiones)
	WHERE REG_COD in (select * from  dbo.fnUtilSplit(@codRegiones,','))
END


SELECT
	S.IP as [ip], 
	R.Descripcion AS region, 
	MIN(S.Precio) as [min],
	AVG(s.precio) as [avg],
	MAX(s.precio) as [max]
	
FROM            
	dbo.ZoSolicitud AS S WITH (NOLOCK) 
INNER JOIN dbo.Zoclien1 AS C WITH (NOLOCK) ON 
	C.Cod = S.CodClie 
INNER JOIN dbo.Zoprovincia AS P WITH (NOLOCK) ON 
	C.CodProv = P.Zocod 
INNER JOIN dbo.ZoRegion AS R WITH (NOLOCK) ON 
	R.REG_COD in (SELECT reg.codReg collate SQL_Latin1_General_CP1_CI_AS FROM #tempReg as reg)
WHERE        
	s.fechaCompra BETWEEN @dateDesde AND @dateHasta AND
	s.IP IN (SELECT ip collate SQL_Latin1_General_CP1_CI_AS FROM #tempIP) 
GROUP BY 
	R.Descripcion,
	S.IP
	
ORDER BY
	COUNT(*) DESC--,

	
	--exec IpXRegion '2015/01/01','2015/05/07','null','null'
	--exec IpXRegion '2015/01/01','2015/05/07','null','00,01,03'
drop table #tempIP
drop table #tempReg
GO
