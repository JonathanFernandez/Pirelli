USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_SOLICITUD_ALTERA_STATUS]    Script Date: 11/24/2015 15:18:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_INSERT_SOLICITUD_ALTERA_STATUS] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@codSolicitud INTEGER,
	@flgProcesado CHAR(1),
	@nota NVARCHAR(200)
AS
BEGIN
	IF (EXISTS (SELECT 1 FROM dbo.ZoSolicitud WHERE CodSolicitud LIKE @codSolicitud))
	BEGIN
		INSERT INTO dbo.ZoSolicitud_AlteraStatus(CodSolicitud, FlgProcesado, Nota) VALUES(@codSolicitud, @flgProcesado, @nota)
	END	
END