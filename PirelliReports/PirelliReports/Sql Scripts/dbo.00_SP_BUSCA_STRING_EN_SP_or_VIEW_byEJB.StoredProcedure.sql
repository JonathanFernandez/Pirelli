USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[00_SP_BUSCA_STRING_EN_SP_or_VIEW_byEJB]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- INPUTS: @strFind -> Cadena a buscar en StoredProcedures
--@varDBName -> DB en la que se buscará, por defecto en Northwind
-- OUTPUTS: Nombres de SP que contienen la cadena buscada
-- DEPENDENCIES: Ninguna
-- DESCRIPTION:

/*

El método consta de utilizar una SP que busca entre las tablas de sistema 

de una determinada DB, utilizando un LIKE contra el campo dónde el motor 

guarda el texto de los SP. Es importante destacar que, obviamente, esto no 

funciona con los SP encriptados. */

-------------------------------------------------

CREATE proc [dbo].[00_SP_BUSCA_STRING_EN_SP_or_VIEW_byEJB]

@strFind varchar (100),
@varDBName varchar (100) = 'Northwind'

as BEGIN

declare @varQuery varchar (1000)  

select @varQuery = 'SELECT distinct name SP_Name, ''sp_helptext '''''' + name + ''''''''SP_HT FROM [' + @varDBName + '].[dbo].[sysobjects] inner join [' + @varDBName + '].[dbo].[syscomments] ' +

'on [' + @varDBName + '].[dbo].[sysobjects].id = [' + @varDBName + '].[dbo].[syscomments].id ' +

'where (xtype = ''P'' or xtype = ''V'')  and text like ''%' + @strFind + '%'' order by name '

exec (@varQuery)

END --sp



GO
