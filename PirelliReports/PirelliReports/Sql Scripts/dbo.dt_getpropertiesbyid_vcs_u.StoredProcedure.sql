USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid_vcs_u]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create procedure [dbo].[dt_getpropertiesbyid_vcs_u]
    @id       int,
    @property varchar(64),
    @value    nvarchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select uvalue
                from dbo.dtproperties
                where @id=objectid and @property=property
                )


GO
