USE [Comercial]
GO
/****** Object:  View [dbo].[DETALLE_VTA]    Script Date: 10/12/2015 23:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DETALLE_VTA]
AS
SELECT     PROD.DATOS_TOTALES_OK.AÑO, PROD.DATOS_TOTALES_OK.PERIODO, PROD.DATOS_TOTALES_OK.CANAL, PROD.DWHRQ.HrqDsc, 
                      SUM(PROD.DATOS_TOTALES_OK.UNIDADES) AS UNIDADES, SUM(PROD.DATOS_TOTALES_OK.Toneladas) AS Toneladas, 
                      LEFT(RIGHT(PROD.DATOS_TOTALES_OK.IP, 7), 5) AS ip5, PROD.DATOS_TOTALES_OK.DESC_IP, 
                      SUM(PROD.DATOS_TOTALES_OK.Precio_lista + PROD.DATOS_TOTALES_OK.Effic_purch_patter + PROD.DATOS_TOTALES_OK.Month_extra + PROD.DATOS_TOTALES_OK.Base_cond
                       + PROD.DATOS_TOTALES_OK.Perform_bonus + PROD.DATOS_TOTALES_OK.fixed_bonus + PROD.DATOS_TOTALES_OK.Other_rebates + PROD.DATOS_TOTALES_OK.Descuento_caja)
                       AS NS, 
                      SUM(PROD.DATOS_TOTALES_OK.Precio_lista + PROD.DATOS_TOTALES_OK.Base_cond + PROD.DATOS_TOTALES_OK.Effic_purch_patter + PROD.DATOS_TOTALES_OK.Month_extra)
                       AS NS_S_NC, 
                      SUM(PROD.DATOS_TOTALES_OK.Base_cond + PROD.DATOS_TOTALES_OK.Effic_purch_patter + PROD.DATOS_TOTALES_OK.Month_extra) 
                      AS descuentos, 
                      SUM(PROD.DATOS_TOTALES_OK.Perform_bonus + PROD.DATOS_TOTALES_OK.fixed_bonus + PROD.DATOS_TOTALES_OK.Other_rebates) AS NC, 
                      PROD.DATOS_TOTALES_OK.HIERARQUIA, SUM(PROD.DATOS_TOTALES_OK.Precio_lista) AS Precio_lista
FROM         PROD.DATOS_TOTALES_OK INNER JOIN
                      PROD.DWHRQ ON PROD.DATOS_TOTALES_OK.HIERARQUIA = PROD.DWHRQ.HrqCod
GROUP BY PROD.DATOS_TOTALES_OK.AÑO, PROD.DATOS_TOTALES_OK.PERIODO, PROD.DATOS_TOTALES_OK.CANAL, PROD.DWHRQ.HrqDsc, 
                      LEFT(RIGHT(PROD.DATOS_TOTALES_OK.IP, 7), 5), PROD.DATOS_TOTALES_OK.DESC_IP, PROD.DATOS_TOTALES_OK.HIERARQUIA

GO
