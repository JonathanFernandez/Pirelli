USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_SOLICITUD_ALTERA_CLIENTE]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INSERT_SOLICITUD_ALTERA_CLIENTE] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@codSolicitud INTEGER,
	@codCliente CHAR(10),
	@nota NVARCHAR(200)
AS
BEGIN
	INSERT dbo.ZoSolicitud_AlteraCliente VALUES(@codSolicitud, @codCliente, @nota)
END
GO
