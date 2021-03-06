USE [Comercial]
GO
/****** Object:  StoredProcedure [PROD].[SP_UPDATE_ZOCLIEN1_FROM_EXCEL]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Emanuel Barbera
-- Create date: Agosto 2014
-- Description:	SP Temporal para Actualizar Maestro de Clientes desde un Excel hasta gestionarlo 100% por Sistema
-- =============================================
CREATE PROCEDURE [PROD].[SP_UPDATE_ZOCLIEN1_FROM_EXCEL] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE A  SET 
	A.CodCliMatriz = E.[Código Cliente (Maestro)],
	A.CodCliRefill = E.[Cod (Destino de la factura)],
	A.CentroEmisor = RIGHT(CAST('0000' as VARCHAR) + CAST(E.[Centro Emisor] as VARCHAR), 4),
	A.CUIT = RTRIM(ISNULL(REPLACE(E.[CUIT], '-',''),'')),
	A.Email = E.[E-mail],
	A.PaginaWEB = E.[Página Web],
	A.NomFant = E.[Nombre de Fantasía],
	A.RazSoc = E.[Razón Social],
	A.CTC_CAR = E.[CTC CAR],
	A.CTC_TRUCK = E.[CTC TRUCK],
	A.Barrio = RTRIM(E.[Barrio]),
	A.Ciudad = RTRIM(E.[Ciudad]),
	A.TerminalPOS = RTRIM(CAST(E.[Número de terminal Pos] as INT)),
	A.CodProv = RTRIM(E.[Provincia]),
	A.TelefonoSuc = RTRIM(E.[Telefono Sucursal]),
	A.TelefonoFact = RTRIM(E.[Telefono factura])
	FROM dbo.ZOCLIEN1 AS A 
	INNER JOIN 
	dbo.Maestro_PDV_Comercial E ON CAST('000' as varchar) +  E.[Cod Sucursal (Emision de factura)] = A.Cod
	
	
END

GO
