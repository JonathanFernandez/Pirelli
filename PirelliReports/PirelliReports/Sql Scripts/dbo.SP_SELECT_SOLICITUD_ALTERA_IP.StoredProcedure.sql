USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_SOLICITUD_ALTERA_IP]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SELECT_SOLICITUD_ALTERA_IP] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
AS
BEGIN
	SELECT CodSolicitud, IP, Pais, Nota FROM ZoSolicitud_AlteraIP
	ORDER BY CodSolicitud
END
GO
