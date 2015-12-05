USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_SOLICITUD_ALTERA_CLIENTE]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SELECT_SOLICITUD_ALTERA_CLIENTE] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
AS
BEGIN
	SELECT CodSolicitud, CodClie, Nota FROM ZoSolicitud_AlteraCliente
	ORDER BY CodSolicitud
END
GO
