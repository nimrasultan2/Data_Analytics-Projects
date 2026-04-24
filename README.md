# 🛡️ DEFENSE CONTRACTS ANALYSIS REPORT
### A Full-Stack Data Analytics Project | Python · SQL Server · Power BI

> *"From raw, formula-contaminated Excel data to a production-grade intelligence dashboard — uncovering how the world spends on war."*

---

## Project Overview

This project performs an **end-to-end analysis of global defense procurement contracts** — tracking which countries buy what, from whom, for how much, and whether they stay within budget.
The dataset contained **1,496 defense contracts** spanning multiple countries, suppliers, equipment categories, and years. The goal: transform messy, real-world data into **actionable strategic intelligence** for defense budget planning and procurement decision-making.

---

##  The Problem
Global defense spending is rising — but procurement decisions are riddled with inefficiencies:

- Contracts go **over budget** without accountability
- **Supplier dependencies** create geopolitical vulnerabilities  
- Spending patterns across **NATO vs Non-NATO** nations remain poorly understood
- No clear visibility into **which platforms drain the most money**

This report answers all of that.

---

## The Stack

| Tool | Purpose |
|------|---------|
| **Python (Pandas)** | Data cleaning & preprocessing |
| **SQL Server (SSMS)** | Analytical queries & aggregations |
| **Power BI** | Interactive dashboard & visualizations |
| **Excel** | Raw data source |

---

## Data Cleaning (Python)

The raw dataset was far from clean. Issues found and resolved:

| Issue | Fix Applied |
|-------|------------|
| Duplicate Supplier column with Excel formula contamination | Dropped dirty column, renamed clean one |
| Formula strings embedded in numeric columns (=AVERAGE(Q2:Q1500)) | Stripped via regex + pd.to_numeric() |
| datetime.time objects mixed into date column | Replaced with pd.NaT, converted via pd.to_datetime() |
| 16 null Contract_ID rows | Dropped — no identifier = unusable row |
| Nulls in Military_Personnel | Filled with column median |
| Nulls in Supplier_Country | Filled with 'Unknown |
| Nulls in Expected_Delivery | Converted to datetime, filled with median date |
| Inconsistent column naming (Budget Status) | Renamed to Budget_Status |

**Result:** Clean, fully typed dataset exported as `Defense_Contracts_Clean.xlsx`

---

## SQL Analysis (SQL Server)

Eight analytical queries written to extract insights:

```sql
-- Example: Budget Overrun Rate by Equipment Category
SELECT 
    Equipment_Category,
    COUNT(*) AS Total_Contracts,
    COUNT(CASE WHEN Budget_Status = 'Over Budget' THEN 1 END) AS Over_Budget_Count,
    ROUND(COUNT(CASE WHEN Budget_Status = 'Over Budget' THEN 1 END) * 100.0 / COUNT(*), 2) AS Overrun_Rate_Pct
FROM DefenseData
GROUP BY Equipment_Category
ORDER BY Overrun_Rate_Pct DESC;
```

| # | Query | Key Finding |
|---|-------|-------------|
| 1 | Top 10 Platforms by Unit Cost | Lynx KF41 & Challenger 3 are most expensive |
| 2 | Over Budget by Equipment Category | Aircraft has highest over-budget count |
| 3 | Total Spending by Contract Status | Majority of spending in delivered contracts |
| 4 | Top 10 Buying Countries | Dominated by major military powers |
| 5 | Year-over-Year Spend Trend | Stable 2015–2023, sharp spike in 2024 |
| 6 | Budget Overrun Rate by Category | Training Equipment has highest overrun rate % |
| 7 | Top Suppliers by Revenue | **Hanwha Defense** leads globally |
| 8 | NATO vs Non-NATO Spending | Non-NATO nations account for majority of spending |

---

## 📊 Dashboard (Power BI)

A dark-themed, single-page interactive dashboard featuring:

-  **KPI Cards** — Total Contract Spending, Total Revenue, Overrun Rate, Best Supplier Country
-  **Bar Chart** — Top 10 Most Expensive Platforms
-  **Pie Chart** — Equipment Categories Over Budget
-  **Donut Charts** — Contract Status Breakdown · NATO vs Non-NATO
-  **Map Visuals** — Spending by Country · Top 10 Defense Spenders
-  **Treemap** — Top Suppliers by Revenue
-  **Line Chart** — Defense Spending Trend Over Years
-  **Table** — Budget Overrun Rate by Category

---

## Key Insights

-  **2024 saw the sharpest spike** in global defense spending — driven by geopolitical tensions, NATO rearmament commitments, and Indo-Pacific escalations
-  **Aircraft** has the highest absolute over-budget contract count (69 contracts)
-  **Training Equipment** has the highest overrun *rate* — underfunded and poorly planned compared to high-profile procurements
-  **Hanwha Defense (South Korea)** is the #1 supplier by revenue — a signal of South Korea's growing dominance in global arms exports
-  **Non-NATO nations** account for a larger share of total defense spending
-  **Lynx KF41 & Challenger 3** are the most expensive platforms per unit


---

## Let’s Connect
* **Portfolio:** [https://nimra-sultan-za9icja.gamma.site/]
* **LinkedIn:** [www.linkedin.com/in/nimra-sultan-1822043a3]
* **Vibe:** Always learning. Always optimizing.
