USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[dt_dropuserobjectbyid]    Script Date: 04/12/2015 18:38:44 ******/
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
