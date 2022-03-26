/* Top Genres have unique customers */
select G.Name, count(DISTINCT C.customerID) as Customers
from customer C
join Invoice I
on I.CustomerId=C.CustomerId
join InvoiceLine IL
on IL.InvoiceId=I.InvoiceId
join Track T
on T.TrackId= IL.TrackId
join Genre G 
on G.GenreId= T.GenreId 
group by 1
order by 2 desc
