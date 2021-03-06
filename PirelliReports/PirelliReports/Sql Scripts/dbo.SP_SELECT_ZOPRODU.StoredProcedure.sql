USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_ZOPRODU]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_ZOPRODU]
(
@IP VARCHAR(7) = '%',
@DESCRIP VARCHAR(50) = '%',
@PAIS VARCHAR(2) = '%',
@OTRO VARCHAR(20) = '%',
@FAMILIA VARCHAR(2) = '%',
@MARCA VARCHAR(2) = '%',
@RANGO VARCHAR(1) = '%',
@RODADO FLOAT = 0,
@FLGBAJALOGICA VARCHAR(1) = '%'

)
AS
BEGIN
	SELECT  
		[IP],
		[DESCRIP],
	    [PAIS],
        [OTRO],
        [FAMILIA],
        [MARCA],
        [RANGO],
        [RODADO],
        [FLGBAJALOGICA],
        [FLGFILBUSQ]
	 FROM 
		ZOPRODU1
	 WHERE 
		IP LIKE @IP AND
		DESCRIP LIKE @DESCRIP AND
		PAIS LIKE @PAIS AND
		OTRO LIKE @OTRO AND
		FAMILIA LIKE @FAMILIA AND
		MARCA LIKE @MARCA AND
		RANGO LIKE @RANGO AND
		(RODADO = @RODADO OR RODADO > 0) AND
		FLGBAJALOGICA LIKE @FLGBAJALOGICA


END

GO
