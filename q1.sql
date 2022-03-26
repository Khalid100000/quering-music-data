/* finding which artist has earned the most
 according to the */
select Artist.Name , sum(InvoiceLine.Quantity *InvoiceLine.UnitPrice ) as total_Spendings
from Artist 
join Album 
on Artist.ArtistId=Album.ArtistId
join Track
on album.AlbumId=track.AlbumId
join InvoiceLine
on InvoiceLine.TrackId=track.TrackId
group by artist.Name 
order by 2 desc
limit 15
