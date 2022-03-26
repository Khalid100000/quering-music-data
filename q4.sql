/* Top Genres have unique Artists */
select G.Name, count(DISTINCT At.ArtistId) as Artists
from Genre G
join Track T 
on G.GenreId= T.GenreId 
join Album Am
on Am.AlbumId=T.AlbumId
join Artist At
on At.ArtistId=Am.ArtistId
group by 1
order by 2 desc
limit 15