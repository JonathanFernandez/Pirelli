USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_SOLICITUD_ALTERA_IP]    Script Date: 11/24/2015 15:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SELECT_SOLICITUD_ALTERA_STATUS] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
AS
BEGIN
	SELECT CodSolicitud, FlgProcesado, Nota FROM ZoSolicitud_AlteraStatus
	ORDER BY CodSolicitud
END