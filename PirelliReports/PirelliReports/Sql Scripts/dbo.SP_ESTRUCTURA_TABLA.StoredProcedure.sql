USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_ESTRUCTURA_TABLA]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Barbera - Galiano
-- Create date: Marzo 2013
-- Description:	Query que devuelve los Campos, sus Tipos y Primary Keys de los mismos.
-- =============================================
--SP_ESTRUCTURA_TABLA 'ZZZZ__ELIMINAR__TEST'
CREATE PROCEDURE [dbo].[SP_ESTRUCTURA_TABLA] @TABLA AS NVARCHAR(250), @TIPO AS INT = 0
AS
BEGIN

IF @TIPO=0

BEGIN
		SELECT 
			so.object_id 'TABLE_NAME',
			so.name 'TABLE_NAME',                             
			sc.column_id 'COLUMN_ID',
			sc.name 'COLUMN_NAME',					  
			st.name AS 'TYPE',
			sc.max_length 'LENGTH',
			sc.is_identity 'IS_IDENTITY',
			ISNULL(PKTEMP.is_primary_KEY,0) 'IS_PK',
			
			--Descripción del Campo
			ISNULL(sep.value, sc.name) 'DESCRIPTION',
			
			--Foreing Key's
			[Refrenced table] 'PK_TABLE',
			[Refrenced column] 'PK_COLUMN',
			ISNULL([FK Query],'') 'PK_QUERY'
			
		FROM 
			sysobjects so 
		INNER JOIN 
			syscolumns sc ON so.object_id = sc.object_id 
		INNER JOIN 
			systypes st ON st.system_type_id = sc.system_type_id AND st.name != 'sysname'
		LEFT JOIN 
			sysextended_properties sep ON so.object_id = sep.major_id AND sc.column_id = sep.minor_id

		/****************************************************************************	
										FOREIGN KEY
		****************************************************************************/
		LEFT JOIN	
			(SELECT	  
			tp.object_id,  
			cp.column_id,
			tr.name 'Refrenced table',
			cr.name 'Refrenced column',
			sep.value 'FK Query'--, tp.name 'Parent table', cp.name 'cp.name', cr.column_id 'cr.column_id'
		    
			FROM 
				sysforeignkeys fk
			INNER JOIN 
				systables tp ON fk.parent_object_id = tp.object_id
			INNER JOIN 
				systables tr ON fk.referenced_object_id = tr.object_id
			INNER JOIN 
				sysforeign_key_columns fkc ON fkc.constraint_object_id = fk.object_id
			INNER JOIN 
				syscolumns cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
			INNER JOIN 
				syscolumns cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id
			LEFT JOIN 
			sysextended_properties sep ON fk.object_id = sep.major_id --AND sc.column_id = sep.minor_id

			--WHERE tp.name = @TABLA 
			) as FKTEMP 
			
		ON FKTEMP.object_id = so.object_id and FKTEMP.column_id = sc.column_id

		/**********************************************************************	
									IS_PRIMARY_KEY
		**********************************************************************/
		LEFT JOIN
				(SELECT 
					i.object_id, 
					ic.column_id, 
					i.is_primary_key
					
				FROM 
					sysindexes AS i
				INNER JOIN 
					sysindex_columns AS ic	ON i.OBJECT_ID = ic.OBJECT_ID AND i.index_id = ic.index_id --WHERE i.is_primary_key = 1
				) as PKTEMP		
						
		ON PKTEMP.object_id = so.object_id and PKTEMP.column_id = sc.column_id
		/*********************************************************************/


		WHERE	--so.type = 'U' AND 
				so.name = @TABLA 

		ORDER BY sc.column_id, so.name, sc.name
	END
	
IF @TIPO = 1
	BEGIN

		SELECT 'MD_GRUPOS' as [TABLE], 'Maestro de Grupos' as [DESC]
			UNION ALL
		SELECT 'MD_SUBGRUPOS', 'Maestro de Subgrupos'
		--	UNION ALL
		--SELECT 'MD_OPERARIOS', 'Maestro de Operarios'					
		--	UNION ALL
		--SELECT 'MD_USUARIOS', 'Maestro de Usuarios'	

	END

END


/****************************************
			--PRIMARYS KEYS--
****************************************/	
/*
SELECT 
	i.name AS IndexName, 
	OBJECT_NAME(ic.OBJECT_ID) AS TableName, 
    COL_NAME(ic.OBJECT_ID,ic.column_id) AS ColumnName, 
    i.is_primary_key
    
FROM 
	sys.indexes AS i
	
INNER JOIN 
	sys.index_columns AS ic ON i.OBJECT_ID = ic.OBJECT_ID AND i.index_id = ic.index_id
	
WHERE i.is_primary_key = 1
*/

/****************************************
			--FOREINGS KEYS--
****************************************/	
/*
SELECT
    fk.name 'FK Name',
    tp.name 'Parent table',
    cp.name, cp.column_id,
    tr.name 'Refrenced table',
    cr.name, cr.column_id
FROM 
    sys.foreign_keys fk
INNER JOIN 
    sys.tables tp ON fk.parent_object_id = tp.object_id
INNER JOIN 
    sys.tables tr ON fk.referenced_object_id = tr.object_id
INNER JOIN 
    sys.foreign_key_columns fkc ON fkc.constraint_object_id = fk.object_id
INNER JOIN 
    sys.columns cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
INNER JOIN 
    sys.columns cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id
ORDER BY
    tp.name, cp.column_id

*/








GO
