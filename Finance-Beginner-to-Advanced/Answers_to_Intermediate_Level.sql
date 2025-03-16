#/////////////////////////////////////////////////
#QUESTION 1 - Find the average balance for each account type.

SELECT account_type, round(avg(balance),2) AS avg_balance FROM accounts GROUP BY account_type;

#/////////////////////////////////////////////////
#QUESTION 2 - Show all transactions along with customer names.

SELECT tr.*, cus.name 
FROM transactions as tr
JOIN accounts as acc
	ON tr.account_id = acc.account_id
JOIN customers as cus
	ON acc.customer_id=cus.customer_id;

#/////////////////////////////////////////////////
#QUESTION 3 - Find the customer with the highest account balance.

SELECT cus.name, acc.balance 
FROM accounts as acc
JOIN customers as cus
	ON cus.customer_id = acc.customer_id
ORDER BY acc.balance DESC LIMIT 1;

#/////////////////////////////////////////////////
#QUESTION 4 - Show the total deposits and withdrawals for each account.

SELECT account_id, 
	SUM(CASE WHEN transaction_type='Deposit' THEN amount ELSE 0 END) AS total_deposits,
	SUM(CASE WHEN transaction_type='Withdrawal' THEN amount ELSE 0 END) AS total_withdrawals
FROM transactions
GROUP BY account_id;

#/////////////////////////////////////////////////
#QUESTION 5 - Retrieve all transactions with amounts greater than the average transaction amount.

SELECT * FROM transactions WHERE amount > (SELECT AVG(amount) FROM transactions);

#/////////////////////////////////////////////////
#QUESTION 6  - Find all customers who have both a savings and a checking account.
SELECT c.name, a1.account_type as account_1, a2.account_type as account_2 FROM customers as c
JOIN accounts as a1
ON a1.customer_id = c.customer_id
JOIN accounts as a2
ON a2.customer_id = c.customer_id
WHERE a1.account_type='Savings' and a2.account_type='Checking';


#/////////////////////////////////////////////////
#QUESTION 7 - Get the top 3 highest investments by amount.

SELECT * FROM investments ORDER BY amount_invested DESC LIMIT 3;

#/////////////////////////////////////////////////
#QUESTION 8 - Calculate the total invested amount for each customer.

SELECT c.name, sum(i.amount_invested) as total_invested 
FROM customers as c
JOIN investments as i
	ON c.customer_id = i.customer_id
GROUP BY c.name;

#/////////////////////////////////////////////////
#QUESTION 9 - Display the name of customers with more than one account.
SELECT c.name 
FROM customers as c
JOIN accounts as a
	ON c.customer_id = a.customer_id
GROUP BY c.name
HAVING count(a.account_id)>1;


#/////////////////////////////////////////////////
#QUESTION 10 - Find the return amount for each investment (amount_invested * return_rate).
SELECT *, (amount_invested*return_rate) as return_amount FROM investments;