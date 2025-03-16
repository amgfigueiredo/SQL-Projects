# Finance Industry - SQL Project

This project is a SQL-based financial database designed for my portfolio. It includes customer accounts, transactions, and investments, making it suitable for practicing SQL queries ranging from beginner to advanced levels.

## Datasets

The project contains four datasets, each stored as a CSV file - [Download dataset](https://github.com/amgfigueiredo/SQL-Projects/tree/f08e0537e06972f6910de98379e95521727ed791/Finance-Beginner-to-Advanced/dataset)

- **customers.csv**: Contains customer details.

- **accounts.csv**: Stores account information.

- **transactions.csv**: Records financial transactions.

- **investments.csv**: Includes investment data.

## Setup Instructions
**Create Database**
```sql
CREATE DATABASE FinanceDB;
USE FinanceDB;
```
## Database Schema
**Customers Table**
```sql
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    date_joined DATE NOT NULL
);
```
**Accounts Table**
```sql
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    account_type ENUM('Savings', 'Checking', 'Investment') NOT NULL,
    balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    opened_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);
```
**Transactions Table**
```sql
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    transaction_date DATE NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_type ENUM('Deposit', 'Withdrawal') NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE
);
```
**Investments Table**
```sql
CREATE TABLE Investments (
    investment_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    investment_type ENUM('Stocks', 'Bonds', 'Mutual Funds', 'ETF') NOT NULL,
    amount_invested DECIMAL(12,2) NOT NULL,
    return_rate DECIMAL(5,4) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);
```
## [Download CSV files dataset](https://github.com/amgfigueiredo/SQL-Projects/tree/f08e0537e06972f6910de98379e95521727ed791/Finance-Beginner-to-Advanced/dataset) & load data into MySQL
```sql
#Go to Datasets and download each file. Change the "Load Data" file location
LOAD DATA INFILE '/customers.csv' 
INTO TABLE Customers 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE '/accounts.csv' 
INTO TABLE Accounts 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE '/transactions.csv' 
INTO TABLE Transactions 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE '/investments.csv' 
INTO TABLE Investments 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
```
(In Alternative, you can use MySQL Table Data Wizard Import to load your [CSV files](https://github.com/amgfigueiredo/SQL-Projects/tree/f08e0537e06972f6910de98379e95521727ed791/Finance-Beginner-to-Advanced/dataset) )

## Beginner Level
**Build the queries to answer the following questions**
```
1. Retrieve all customers from the database.
2. Show all transactions that are deposits.
3. Get the total balance for each account type.
4. Find all accounts opened before 2022.
5. Display the names of customers who have checking accounts.
6. Count the number of transactions in January 2024.
7. Get the highest transaction amount.
8. List all investments sorted by highest return rate.
9. Find accounts with a balance greater than $2000.
10. Show all customers who joined after January 1, 2021.
```
## Intermediate Level
**Build the queries to answer the following questions**
```
11. Find the average balance for each account type.
12. Show all transactions along with customer names.
13. Find the customer with the highest account balance.
14. Show the total deposits and withdrawals for each account.
15. Retrieve all transactions with amounts greater than the average transaction amount.
16. Find all customers who have both a savings and a checking account.
17. Get the top 3 highest investments by amount.
18. Calculate the total invested amount for each customer.
19. Display the name of customers with more than one account.
20. Find the return amount for each investment (amount_invested * return_rate).
```

## Advanced Level
**Build the queries to answer the following questions**
```
21. Find the monthly total transactions (deposits and withdrawals).
22. Retrieve customers who have never made a transaction.
23. Show the top customer by total balance across all accounts.
24. Find the account with the highest number of transactions.
25. Calculate the compound return on investments after 5 years.
26. Identify customers who have an investment but no checking account.
27. Get a list of customers with a balance below the average balance.
28. Rank accounts based on their balance.
29. Find the highest transaction in each month.
30. Calculate the percentage of total investments per customer.
```



## Happy Coding!!
