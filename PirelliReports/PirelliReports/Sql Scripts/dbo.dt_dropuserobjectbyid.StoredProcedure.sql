USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[dt_dropuserobjectbyid]    Script Date: 11/11/2015 1:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
**	Drop an object from the dbo.dtproperties table
*/
create procedure [dbo].[dt_dropuserobjectbyid]
	@id int
as
	set nocount on
	delete from dbo.dtproperties where objectid=@id

GO
