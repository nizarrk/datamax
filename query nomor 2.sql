/*Data product sorting berdasarkan harga termurah */
select 
	p.name, p.harga 
from 
	products p 
order by 
	p.harga 
asc

/*Data product untuk category tertentu*/
select 
	p.name, p.harga, c.name, c2.name as parent_category 
from 
	products p 
join 
	categories c 
on 
	c.id = p.category_id 
left join 
	categories c2 
on 
	c.parent_id = c2.id
where 
	c.name = 'basah'
	

/*Statistik jumlah produk tiap user*/
select 
	u.uid, u.name, 
	(select count(p.id) from products p where p.user_id = u.id) 'total product' 
from 
	users u 
	

/*Statistik jumlah gambar tiap product*/
select
	p.name,
	(select count(pi.id) from product_images pi where p.id = pi.product_id) 'total image'
from
	products p 
	
	
/*Statistik jumlah produk dan jumlah user tiap category*/
select
	c.name,
	(select count(p.id) from products p where p.category_id = c.id) 'count product',
	(select count(p.id) from products p join users u on p.user_id = u.id where p.category_id = c.id) 'count user'
from
	categories c
	