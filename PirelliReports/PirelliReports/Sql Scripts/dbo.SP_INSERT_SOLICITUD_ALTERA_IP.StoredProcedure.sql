USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_SOLICITUD_ALTERA_IP]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_INSERT_SOLICITUD_ALTERA_IP] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	--DECLARE
	@CODSOLICITUD INT,
	@IP CHAR(7),
    @PAIS CHAR(2),
	@NOTA NVARCHAR(200)
AS
BEGIN
--SELECT @CODSOLICITUD=40083,@IP='1171900',@PAIS='AR',@NOTA=N'PRUEBA MODIFICACION MASIVA'
	IF (EXISTS (SELECT 1 FROM dbo.ZoSolicitud WHERE CodSolicitud LIKE @codSolicitud))
	BEGIN
		INSERT INTO DBO.ZOSOLICITUD_ALTERAIP(CODSOLICITUD,IP,PAIS,NOTA)VALUES(@CODSOLICITUD, @IP, @PAIS, @NOTA)
	END
END

--EXEC SP_INSERT_SOLICITUD_ALTERA_IP @CODSOLICITUD=40083,@IP='1171900',@PAIS='AR',@NOTA=N'PRUEBA MODIFICACION MASIVA'
GO
