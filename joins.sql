--- question 1

select count(distinct customer_id) as customers
from customer as cu
left join address as a on cu.address_id = a.address_id 
where a.district = 'Texas'


-- question 2
select p.payment_id, concat(cu.first_name,' ',cu.last_name)
from customer as cu
left join payment as p on cu.customer_id = p.customer_id 
where amount > 6.99

-- question 3

select concat(cu.first_name,' ',cu.last_name)
from customer as cu
where customer_id in (
select customer_id 
from payment 
where amount > 175.00)

-- question 4


select concat(cu.first_name,' ',cu.last_name)
from customer as cu
left join address as a on cu.address_id = a.address_id 
left join city c ON a.city_id = c.city_id
where c.city = 'Nepal'

-- question 5
select concat(s.first_name,' ',s.last_name) as staff_member, count(distinct p.payment_id ) 
from staff as s
left join payment p on s.staff_id = p.staff_id 
group by 1 
order by 2 desc
limit 1

-- question 7

select concat(cu.first_name,' ',cu.last_name)
from customer as cu
where customer_id in (
select customer_id 
from payment 
where amount > 6.99
group by 1
having count(distinct payment_id) = 1)

-- question 8
select count(distint rental_id)
from payment
where amount < 1
