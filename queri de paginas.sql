select distinct 
	pag.PAGINA_ID,pag.PAGINA 
from 
	MD_USUARIOS u
inner join GRUPOS_USUARIOS gu with(nolock) on
	gu.USU_ID = u.USU_ID
inner join MD_GRUPOS g with(nolock) on 
	g.GRUPO_ID = gu.GRUPO_ID
inner join GRUPOS_PERMISOS gp with(nolock) on 
	gp.GRUPO_ID = gu.GRUPO_ID
inner join MD_PERMISOS per with(nolock) on
	per.PERMISO_ID = gp.PERMISO_ID
inner join PERMISO_PAGINAS pp with(nolock) on
	pp.PERMISO_ID = gp.PERMISO_ID
inner join MD_PAGINAS pag with(nolock) on	
	pag.PAGINA_ID = pp.PAGINA_ID

where u.USU_ID = 'Lucas'
order by pag.PAGINA_ID asc

select * from GRUPOS_USUARIOS
select * from MD_GRUPOS
select * from GRUPOS_PERMISOS
select * from MD_PERMISOS
select * from PERMISO_PAGINAS
select * from MD_PAGINAS



select * from MD_USUARIOS