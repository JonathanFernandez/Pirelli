USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid_vcs]    Script Date: 18/11/2015 2:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create procedure [dbo].[dt_getpropertiesbyid_vcs]
    @id       int,
    @property varchar(64),
    @value    varchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select value
                from dbo.dtproperties
                where @id=objectid and @property=property
                )


GO
