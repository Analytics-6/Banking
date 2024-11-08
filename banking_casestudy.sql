select * from products;
select * from Employees;
select * from Customers;
select * from Accounts;
select * from Transactions;
select * from Customer_Accounts;

1) Fetch the transaction id, date and amount of all debit transactions.

select transaction_id, transaction_date, transaction_amount 
from transactions
where credit_debit_flag = 'D'


2) Fetch male employees who earn more than 5000 salary.

select *
from employees
where gender = 'M' and salary > 5000


3) Fetch employees whose name starts with J or whose salary is greater than or equal to 7000.

select * 
from employees
where emp_name like 'J%' or salary >= 7000


4) Fetch accounts with balance in between 1000 to 3000

select * from accounts
where balance between 1000 and 3000


5) Using SQL, find out if a given number is even or odd ? (Given numbers are 432, 77)

select
case when 77%2=1 then 'odd' else 'even' end as odd_flag,
case when 432%2=0 then 'even' else 'odd' end as even_flag


6) Find customers who did not provide a phone no

select * from customers
where phone is null


7) Find all the different products purchased by the customers.

select distinct ca.prod_id as prod_id, p.prod_name, c.first_name||' '||c.last_name as cust_name
from customer_accounts ca
join products p on p.prod_id = ca.prod_id
join customers c on c.customer_id = ca.customer_id
order by prod_id


8) Sort all the active accounts based on highest balance and 
based on the earliest opening date.

select * 
from accounts
where account_status='Active'
order by balance desc, date_of_opening


9) Fetch the oldest 5 transactions.

select * 
from transactions
order by transaction_date
limit 5


10) Find customers who are either from Bangalore/Chennai 
and their phone number is available OR those who were born before 1990.

select *
from customers 
where (address in ('Bangalore','Chennai') and phone is not null)
or extract(year from dob) < 1990

select * 
from Customers
where (address in ('Bangalore' , 'Chennai') and phone is not null)
or to_char(dob,'yyyy') < '1990';


11) Find total no of transactions in Feb 2024.

select count(1) as tot_no_of_transactions
from transactions
where to_char(transaction_date, 'Mon') = 'Feb'

or

select count(1) as tot_no_of_transactions
from transactions
where extract(month from transaction_date) = 2


12) Find total no of products purchased by customer "Satya Sharma".

select concat(c.first_name,' ',c.last_name) as cust_name, count(1) as no_of_prod
from customers c
join customer_accounts ca on ca.customer_id = c.customer_id
join products p on p.prod_id = ca.prod_id
where concat(c.first_name,' ',c.last_name) = 'Satya Sharma'
group by cust_name


13) Display the full names of all employees and customers.

select emp_name from employees
union
select concat(first_name,' ',last_name) as cust_name
from customers


14) Categorise accounts based on their balance.
[Below 1k is Low balance, between 1k to 2k is average balance, above 2k is high balance]

select *,
case when balance < 1000 then 'low balance'
     when balance between 1000 and 2000 then 'average balance'
     else 'high balance'
end as balance_type
from accounts


15) Find the total balance of all savings account.

select p.prod_name as account_type, sum(balance) as total_balance
from products p
join customer_accounts ca on ca.prod_id = p.prod_id
join accounts a on a.account_no = ca.account_no
where p.prod_name = 'Savings Account'
group by account_type


16) Display the total account balance in all the current and savings account.

select p.prod_name as account_type, sum(balance) as total_balance
from products p
join customer_accounts ca on ca.prod_id = p.prod_id
join accounts a on a.account_no = ca.account_no
where p.prod_name in ('Current Account','Savings Account')
group by account_type








