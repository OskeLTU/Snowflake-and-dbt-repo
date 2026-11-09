### 1. Staging Layer (`stg_`)
* **Purpose:** The 1:1 mirror of raw source data. 
* **What it does:** Renames columns to standard naming conventions, casts data types (e.g., strings to timestamps), and strips whitespace. It contains no business logic or aggregations.
* **Access Rule:** Internal plumbing. Never queried directly by end-users.

### 2. Intermediate Layer (`int_`)
* **Purpose:** The "factory workshop" for complex business logic, joins, and data prep.
* **What it does:** Joins staging models together, applies intermediate calculations, and handles business rules before final aggregation. Often built as `ephemeral` models (temporary CTEs) to save warehouse space.
* **Access Rule:** Internal plumbing. Never queried directly by end-users.

### 3. Marts Layer (`dim_` & `fct_`)
* **Purpose:** Clean, tested, and trusted business entities and metrics.
* **What it contains:** 
  * **Dimension Tables (`dim_`):** Descriptive entities (e.g., `dim_customers`, `dim_products`). Grain is strictly one row per unique entity, enforced via `DISTINCT` and primary key tests (`unique`, `not_null`).
  * **Fact Tables (`fct_`):** Numerical measurements, events, or aggregations (e.g., `fct_customer_summary`, `fct_orders`). 
* **Access Rule:** Safe and intended for direct querying by analysts.

### 4. Reporting Layer (`rpt_`)
* **Purpose:** Presentation-ready, wide reporting models tailored for specific dashboards or business teams.
* **What it does:** Frequently joins core mart dimensions.

## Other concepts
* **Singular Test:** A custom SQL query saved in the `tests/` folder designed to check business logic (e.g., ensuring `signup_date <= current_date`). If the query returns any rows, the test fails.
* **Generic Test:** Declarative tests defined in `schema.yml` files (like `unique`, `not_null`, `accepted_values`) used to protect structural integrity.