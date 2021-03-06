USE [Comercial]
GO
/****** Object:  StoredProcedure [PROD].[IpXCliente]    Script Date: 07/11/2015 17:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [PROD].[IpXCliente]
--agrupado por ip
--declare 
@dateDesde date,
@dateHasta date,
@IP nvarchar(7),
@Clientes nvarchar(max)
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
	INSERT INTO #tempIP 
	SELECT @IP
END
--select * from ##tempIP

/*creo una temp con todas los codmatriz o con las codmatriz que me vino*/
CREATE TABLE #tempClie  (CODCLIMATRIZ NVARCHAR(10))
IF @Clientes = 'null'-- is null
BEGIN
	INSERT INTO #tempClie
	SELECT CodCliMatriz
	FROM ZOCLIEN1 
	WHERE CODCLIMATRIZ IS NOT NULL
	
END
ELSE
BEGIN
	INSERT INTO #tempClie 
	SELECT CodCliMatriz
	FROM ZOCLIEN1
	--WHERE REG_COD in (@codRegiones)
	WHERE CODCLIMATRIZ in (select * from  dbo.fnUtilSplit(@Clientes,','))
END
--select * from #tempClie

SELECT        

	S.IP as [ip], 
	CONVERT(NVARCHAR,C.Cod) +'-'+ C.RazSoc as [razsoc], 
	--C.RazSoc as [razsoc], 
	MIN(S.Precio) as [min],
	AVG(s.precio) as [avg],
	MAX(s.precio) as [max]
	
FROM            
	dbo.ZoSolicitud AS S WITH (NOLOCK) 
INNER JOIN dbo.Zoclien1 AS C WITH (NOLOCK) ON 
	C.Cod = S.CodClie AND
	c.CodCliMatriz IN (SELECT clie.CODCLIMATRIZ collate SQL_Latin1_General_CP1_CI_AS FROM #tempClie as clie)
	--(SELECT reg.codReg collate SQL_Latin1_General_CP1_CI_AS FROM #tempReg as reg)
INNER JOIN dbo.Zoprovincia AS P WITH (NOLOCK) ON 
	C.CodProv = P.Zocod 
INNER JOIN dbo.ZoRegion AS R WITH (NOLOCK) ON 
	R.REG_COD = P.REG_COD
WHERE        
	s.fechaCompra BETWEEN @dateDesde AND @dateHasta AND
	IP IN (SELECT ip collate SQL_Latin1_General_CP1_CI_AS FROM #tempIP) 

GROUP BY 
	--C.RazSoc,
	CONVERT(NVARCHAR,C.Cod) +'-'+ C.RazSoc,
	S.IP

ORDER BY
	COUNT(IP) DESC

DROP TABLE #tempClie
DROP TABLE #tempIP
	

	--exec IpXCliente '2015/01/01','2015/05/08','null','null'
	--exec IpXCliente '2015/01/01','2015/05/08','null','0009700008,0009700008,0009700008,0009700018,0009700039'
GO
