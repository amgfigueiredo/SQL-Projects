#////////////////////////////////////////////////////////////////////
#QUESTION 1 - Find the monthly total transactions (deposits and withdrawals).

SELECT month(transaction_date) as month, 
	SUM(CASE WHEN transaction_type='Deposit' then amount else 0 END) as total_deposits,
	SUM(CASE WHEN transaction_type='Withdrawal' then amount else 0 END) as total_withdrawal
FROM transactions
GROUP BY month
ORDER BY month;

#////////////////////////////////////////////////////////////////////
#QUESTION 2 - Retrieve customers who have never made a transaction.
SELECT c.name, t.amount 
FROM customers AS c
LEFT JOIN accounts as a 
	ON a.customer_id = c.customer_id
LEFT JOIN transactions as t
	ON t.account_id = a.account_id
WHERE t.amount IS NULL;   
    
#////////////////////////////////////////////////////////////////////
#QUESTION 3 - Show the top customer by total balance across all accounts.

SELECT c.name, sum(a.balance) as total_balance 
FROM customers as c
JOIN accounts as a
	ON c.customer_id = a.customer_id
GROUP BY c.name
ORDER BY total_balance DESC LIMIT 1;

#////////////////////////////////////////////////////////////////////
#QUESTION 4 - Find the account with the highest number of transactions.

SELECT account_id, COUNT(transaction_id) AS nr_transaction
FROM transactions
GROUP BY account_id
ORDER BY nr_transaction DESC LIMIT 1;
    
#////////////////////////////////////////////////////////////////////
#QUESTION 5 - Calculate the compound return on investments after 5 years.
 SELECT investment_id,amount_invested,return_rate, 
 round(amount_invested*POWER(1+return_rate,5),2) as compound_return 
 FROM investments;

#////////////////////////////////////////////////////////////////////
# QUESTION 6 - Identify customers who have an investment but no checking account.

SELECT distinct c.name
FROM customers c
JOIN investments i ON c.customer_id = i.customer_id
LEFT JOIN accounts a ON c.customer_id = a.customer_id AND a.account_type = 'Checking'
WHERE a.account_id IS NULL;

#////////////////////////////////////////////////////////////////////
#QUESTION 7 - Get a list of customers with a balance below the average balance.

SELECT c.name, sum(balance) as total_balance, round((select AVG(balance) from accounts),2) as avg_balance FROM customers as c
JOIN accounts as a
	ON c.customer_id = a.customer_id
GROUP BY c.customer_id
HAVING SUM(BALANCE)<avg_balance;

#////////////////////////////////////////////////////////////////////
#QUESTION 8 - Rank accounts based on their balance.

SELECT account_id, balance, 
RANK() OVER (ORDER BY balance DESC) AS ranking 
FROM accounts;

#////////////////////////////////////////////////////////////////////
#QUESTION 9 - Find the highest transaction in each month.

SELECT month(transaction_date) as month_, max(amount) as highest_transaction
FROM transactions
GROUP BY month_
ORDER BY month_;

#////////////////////////////////////////////////////////////////////
#QUESTION 10- Calculate the percentage of total investments per customer.

SELECT customer_id, amount_invested, 
(amount_invested / (SELECT SUM(amount_invested) FROM investments))*100 as pct_investment
FROM investments; 


