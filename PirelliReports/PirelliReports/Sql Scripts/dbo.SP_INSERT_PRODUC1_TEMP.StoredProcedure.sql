USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_PRODUC1_TEMP]    Script Date: 22/11/2015 15:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INSERT_PRODUC1_TEMP] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@IP CHAR(7), 
	@DESCRIPCION CHAR(30),
	@PAIS CHAR(51),
	@OTRO CHAR(20), 
	@FAMILIA CHAR(50),
	@MARCA CHAR(2),
	@RANGO CHAR(1)
AS
BEGIN
	INSERT INTO DBO.ZOPRODU1_TEMP(IP,DESCRIP, PAIS, OTRO, FAMILIA, MARCA, RANGO) VALUES (@IP, @DESCRIPCION, @PAIS, @OTRO, @FAMILIA, @MARCA, @RANGO);
END

GO
