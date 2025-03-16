#///////////////////////////////////////////////////////
#Question 1 - Retrieve all customers from the database.
SELECT * FROM customers;

#///////////////////////////////////////////////////////
#Question 2 - Show all transactions that are deposits.
SELECT * FROM transactions WHERE transaction_type='Deposit';

#///////////////////////////////////////////////////////
#Question 3 - Get the total balance for each account type.
SELECT account_type,sum(balance) AS total_balance FROM accounts GROUP BY account_type;

#///////////////////////////////////////////////////////
#Question 4 - Find all accounts opened before 2022.
SELECT * FROM accounts WHERE year(opened_date)<2022;
#OR
SELECT * FROM accounts WHERE opened_date<'2022-01-01';

#///////////////////////////////////////////////////////
#QUESTION 5  - Display the names of customers who have checking accounts.
SELECT DISTINCT cus.name 
FROM customers as cus
JOIN accounts as acc
	ON cus.customer_id = acc.customer_id
WHERE acc.account_type='Checking'
ORDER BY cus.name;

#///////////////////////////////////////////////////////
#QUESTION 6 - Count the number of transactions in January 2024.
SELECT COUNT(transaction_id) AS nr_of_transations 
FROM transactions
WHERE YEAR(transaction_date)=2024;
#----------OR ----------------
SELECT COUNT(*) AS nr_of_transations 
FROM transactions
WHERE transaction_date BETWEEN '2024-01-01' AND '2024-12-31';

#///////////////////////////////////////////////////////
#QUESTION 7 - Get the highest transaction amount.
SELECT MAX(amount) FROM transactions;

#///////////////////////////////////////////////////////
#QUESTION 8 - List all investments sorted by highest return rate.
SELECT * FROM investments ORDER BY return_rate DESC;

#///////////////////////////////////////////////////////
#QUESTION 9 - Find accounts with a balance greater than $2000.
SELECT * FROM accounts WHERE balance>2000;

#///////////////////////////////////////////////////////
#QUESTION 10 - Show all customers who joined after January 1, 2021.
SELECT * FROM customers WHERE date_joined>'2021-01-01';

