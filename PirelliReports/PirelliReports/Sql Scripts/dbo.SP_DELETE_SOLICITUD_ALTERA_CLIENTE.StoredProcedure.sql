USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_SOLICITUD_ALTERA_CLIENTE]    Script Date: 22/11/2015 15:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DELETE_SOLICITUD_ALTERA_CLIENTE] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	
AS
BEGIN
	DELETE FROM dbo.ZoSolicitud_AlteraCliente
END
GO
