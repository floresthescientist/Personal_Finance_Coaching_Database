USE personal_finance_coaching_db;


-- coaches (insert first* Clients need it)

INSERT INTO Coaches (Coach_id, First_Name, Last_name, Specialty, Email) VALUES
(1, 'Maria',  'Santos',  'Debt Reduction',      'maria.santos@financecoach.com'),
(2, 'James',  'Carter',  'Retirement Planning', 'james.carter@financecoach.com'),
(3, 'Aisha',  'Patel',   'Budgeting',           'aisha.patel@financecoach.com');


-- Clients (each client has one coach)

INSERT INTO Clients (Client_id, First_name, Last_name, Email, Phone, Coach_id) VALUES
(101, 'Daniel', 'Reyes',    'daniel.reyes@email.com',    '914-555-0101', 1),
(102, 'Emily',  'Brooks',   'emily.brooks@email.com',    '914-555-0102', 1),
(103, 'Marcus', 'Lee',      'marcus.lee@email.com',      '646-555-0103', 2),
(104, 'Sophia', 'Nguyen',   'sophia.nguyen@email.com',   '646-555-0104', 2),
(105, 'Tyler',  'Johnson',  'tyler.johnson@email.com',   '718-555-0105', 3),
(106, 'Grace',  'Martinez', 'grace.martinez@email.com',  '718-555-0106', 3);


-- SavingsGoals (each goal belongs to one client)

INSERT INTO SavingsGoals (Goal_id, Goal_name, Target_amount, Current_amount, Target_date, Client_id) VALUES
(1001, 'Emergency Fund',       5000.00,  1800.00, '2027-06-30', 101),
(1002, 'Buy a Car',           12000.00,  3500.00, '2027-12-31', 102),
(1003, 'Down Payment on Home', 40000.00, 12500.00, '2028-09-01', 103),
(1004, 'Pay Off Credit Card',  3000.00,  2100.00, '2026-12-15', 104),
(1005, 'Vacation to Italy',    4500.00,   900.00, '2027-05-20', 105),
(1006, 'Emergency Fund',       6000.00,  2400.00, '2027-03-31', 106),
(1007, 'New Laptop',           1500.00,   600.00, '2026-11-30', 101);


-- Transactions (each transaction belongs to one client)
-- Type is either 'Income' or 'Expense'

INSERT INTO Transactions (Transaction_id, Category, Amount, Transaction_date, Type, Client_id) VALUES
(5001, 'Salary',        2800.00, '2026-09-01 09:00:00', 'Income',  101),
(5002, 'Rent',          1200.00, '2026-09-02 08:30:00', 'Expense', 101),
(5003, 'Groceries',      145.75, '2026-09-05 17:45:00', 'Expense', 102),
(5004, 'Salary',        3200.00, '2026-09-01 09:00:00', 'Income',  102),
(5005, 'Utilities',      210.40, '2026-09-08 12:10:00', 'Expense', 103),
(5006, 'Salary',        4500.00, '2026-09-01 09:00:00', 'Income',  103),
(5007, 'Groceries',      180.20, '2026-09-10 18:20:00', 'Expense', 104),
(5008, 'Freelance Work',  650.00, '2026-09-12 14:00:00', 'Income',  104),
(5009, 'Dining Out',      62.50, '2026-09-14 20:15:00', 'Expense', 105),
(5010, 'Rent',          1350.00, '2026-09-02 08:30:00', 'Expense', 105),
(5011, 'Salary',        2950.00, '2026-09-01 09:00:00', 'Income',  106),
(5012, 'Transportation',  95.00, '2026-09-16 07:50:00', 'Expense', 106);


-- Quick check

SELECT COUNT(*) AS coaches      FROM Coaches;
SELECT COUNT(*) AS clients      FROM Clients;
SELECT COUNT(*) AS savingsgoals FROM SavingsGoals;
SELECT COUNT(*) AS transactions FROM Transactions;

-- shows all data from each table
SELECT * 
FROM Coaches;

SELECT * 
FROM clients;

SELECT * 
FROM SavingsGoals;

SELECT * 
FROM Transactions; 

-- Savings Goal breakdown by client 
SELECT goal_name, target_amount, Current_amount,client_id
FROM SavingsGoals
ORDER BY client_id, target_amount DESC; 

-- Client Expense Tracking 
SELECT Category, Amount, Type, Client_id
FROM Transactions 
WHERE TYPE = 'Expense'
ORDER BY Client_id, Amount;

-- Client Income Tracking 
SELECT Category, Amount, Type, Client_id
FROM Transactions 
WHERE TYPE = 'Income'
ORDER BY Client_id, Amount;

-- find all coaches by specialty 
SELECT first_name, last_name, email, specialty
FROM coaches 
WHERE Specialty = 'Budgeting';

-- find clients for a specfic coach 
SELECT first_name, Last_name, Email, Phone
FROM clients 
WHERE coach_id = 1; 

-- filter large transactions 
SELECT transaction_id, Category, Amount, Type, Client_id 
FROM transactions
WHERE Amount > 1000;

-- Coaches and Their Assigned Clients 
SELECT 
	co.First_name AS Coach_first_name,
    co.Last_name AS Coach_last_name,
    co.Specialty AS Coach_specialty,
    c.First_name AS Client_first_name,
    c.Last_name AS Client_last_name

FROM Coaches As co 
LEFT JOIN Clients AS c ON co.Coach_id = c.Coach_id; 