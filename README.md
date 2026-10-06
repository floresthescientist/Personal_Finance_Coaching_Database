# Personal Finance Coaching Database

**Project | Adonis Flores | Lehman College, Fall 2026**

A relational database for a Personal Finance Coaching business. It tracks clients, their assigned financial coaches, individual savings goals, and monetary transactions. Built with MySQL Workbench.

**Skills demonstrated:** relational database design, primary and foreign keys, one-to-many relationships, ER diagramming, SQL joins, filtering and sorting.

## Database design

The database (`personal_finance_coaching_db`) has four tables:

| Table | Purpose | Primary key |
|---|---|---|
| `Coaches` | Financial coaches who work for the firm | `Coach_id` |
| `Clients` | Customers, each assigned to one coach | `Client_id` |
| `SavingsGoals` | Financial milestones a client is working toward | `Goal_id` |
| `Transactions` | Income and expense records for each client | `Transaction_id` |

**Relationships (all one-to-many):**

| Relationship | Meaning | Foreign key |
|---|---|---|
| Coach **guides** Client | One coach guides many clients; each client has one coach | `Clients.Coach_id` |
| Client **sets** SavingsGoal | One client sets many savings goals | `SavingsGoals.Client_id` |
| Client **has** Transaction | One client has many transactions | `Transactions.Client_id` |

## Files in this repository

| File | What it is |
|---|---|
| [personal_finance_coaching_create_table.sql](personal_finance_coaching_create_table.sql) | **Run first.** Creates the database and the four tables |
| [personal_finance_coaching_data.sql](personal_finance_coaching_data.sql) | **Run second.** Loads sample data and runs the example queries |
| [Project_1_ CIS_345  .mwb](Project_1_%20CIS_345%20%20.mwb) | MySQL Workbench model file (open it in Workbench to see the EER diagram) |
| [Project1_CIS344_Personal_Finance_Coaching_Requirements .pdf](Project1_CIS344_Personal_Finance_Coaching_Requirements%20.pdf) | Mini-world requirements for the business |
| [Financial_Coaching_Project_Report.pdf](Financial_Coaching_Project_Report.pdf) | Final project report |
| IMG_0667.HEIC | Photo of the ER diagram (HEIC files don't preview on GitHub) |

## How to run

1. Open MySQL Workbench and connect to your local MySQL server.
2. Open `personal_finance_coaching_create_table.sql` in a new query tab, select all, and run it. This creates the database and the four tables.
3. Open `personal_finance_coaching_data.sql` in a new query tab, select all, and run it. This loads the sample data (3 coaches, 6 clients, 7 savings goals, 12 transactions) and runs the example queries.
4. Refresh the Schemas panel to see `personal_finance_coaching_db` and its tables.

Run the two scripts in this order and only once each. The tables must exist before data is inserted, and running the data script a second time will cause duplicate key errors.

## Example queries included

- Row counts and full contents of each table
- Savings goals per client, ordered by target amount
- Income and expense tracking per client
- Coaches filtered by specialty
- Clients assigned to a specific coach
- Large transactions (over $1,000)
- Coaches joined to their assigned clients
