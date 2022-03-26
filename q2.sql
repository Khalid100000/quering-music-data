/* finding top custoemrs who spend the most 
on the artist with the most earnings*/

select AT.Name as Artist_Name, sum(IL.UnitPrice * IL.Quantity) as AmountSpent, C.CustomerId , ( C.FirstName ||" "|| C.LastName||"(" || C.CustomerId || ")" ) as 'CustomerFullName(id)'
from Customer C
join Invoice I
on I.CustomerId=C.CustomerId
join InvoiceLine IL
on IL.InvoiceId=I.InvoiceId
join Track T 
on T.TrackId=IL.TrackId
join Album A 
on A.AlbumId=T.AlbumId
join Artist AT
on AT.ArtistId=A.ArtistId
where AT.Name= (select Name from (select Artist.Name , sum(InvoiceLine.Quantity *InvoiceLine.UnitPrice )
from Artist 
join Album 
on Artist.ArtistId=Album.ArtistId
join Track
on album.AlbumId=track.AlbumId
join InvoiceLine
on InvoiceLine.TrackId=track.TrackId
group by artist.Name 
order by 2 desc
limit 1))
group by 3
order by 2 desc
limit 15