USE [Comercial]
GO
/****** Object:  View [dbo].[descuentos_zdpr_dex_de2]    Script Date: 10/12/2015 23:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[descuentos_zdpr_dex_de2]
AS
SELECT     TOP 100 PERCENT CONDICION, ZZFAM, CODCLIENTE, MATNR, VALOR_COND, ZZMAR, BONUS, SPART, ZZBAT, ZZLIN, VALOR_CALC, ZZGRU, 
                      DESCCONDICION
FROM         dbo.precios_vp
WHERE     (CONDICION = 'zdex') OR
                      (CONDICION = 'zdpr') OR
                      (CONDICION = 'zde2')
ORDER BY CODCLIENTE, MATNR

GO
