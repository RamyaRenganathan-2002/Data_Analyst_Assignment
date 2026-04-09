# Data_Analyst_Assignment

---

---

## 🗄️ Phase 1 — SQL Proficiency

**Tool Used:** Postgresql pgadmin

### Part A: Hotel Management System
- Created tables for `users`, `bookings`, `booking_commercials`, and `items`
- Inserted sample data and wrote queries to answer 5 analytical questions:
  - Last booked room using `MAX()` on booking date
  - November 2021 billing via multi-table `JOIN` and `quantity × rate` calculation
  - Bills exceeding ₹1000 using `HAVING` with `SUM()`
  - Most and least ordered items per month using `RANK()` window function
  - 2nd highest bill using `ROW_NUMBER()` window function

### Part B: Clinic Management System
- Created tables for `clinic_sales`, `expenses`, and related entities
- Wrote queries to:
  - Calculate revenue grouped by sales channel
  - Determine monthly profit/loss by subtracting aggregated expenses from revenue

---

## 📊 Phase 2 — Spreadsheet Proficiency

**Tool Used:** Microsoft Excel

### Ticket Analysis (`Ticket_Analysis.xlsx`)
- **Sheet 1:** `ticket` — raw ticket data with `cms_id`, `created_at`, `closed_at`
- **Sheet 2:** `feedbacks` — feedback data linked via `cms_id`

**Q1 — INDEX-MATCH:**  
Used `INDEX-MATCH` with `cms_id` as the key to pull `created_at` from the `ticket` sheet into the `feedbacks` sheet. INDEX-MATCH was preferred over VLOOKUP for more flexible and reliable column lookups.

**Q2 — Same Day & Same Hour Analysis:**  
- Added a combined helper column using the formula `=AND(INT(B2)=INT(C2), HOUR(B2)=HOUR(C2))` — `INT()` compares the date portion and `HOUR()` compares the hour portion of `created_at` and `closed_at` in a single check
- Used `COUNTIF` on this column to count `TRUE` values per outlet

---

## 🐍 Phase 3 — Python Proficiency

**Tool Used:** google colab

### Script 1: `01_Time_Converter.py`
Converts total minutes into a human-readable format (e.g., `130` → `2 hrs 10 minutes`).
- Hours calculated using integer division (`//`)
- Remaining minutes using modulo (`%`)

### Script 2: `02_Remove_Duplicates.py`
Removes duplicate characters from a string while preserving the original order.
- Iterates through each character
- Appends to result only if the character hasn't appeared before

---

## ⚙️ Tools & Technologies

| Area         | Tool / Language        |
|--------------|------------------------|
| SQL          | Postgreqsl pgadmin     |
| Spreadsheets | Microsoft Excel        |
| Programming  | Google Colab           |

---

## 📌 Assumptions

- SQL queries were written and tested on MySQL syntax
- All sample data provided in the assignment PDF was manually inserted for testing
- Spreadsheet timestamps are assumed to be in a consistent datetime format
- Python scripts handle standard positive integer inputs for time conversion
