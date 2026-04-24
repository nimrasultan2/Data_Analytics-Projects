-- Top 10 most expensive platforms by their average unit cost.
SELECT 
    TOP 10 Platform_Name,
    AVG(Unit_Cost_USD_M) AS Avg_Unit_Cost
FROM 
    DefenseData
GROUP BY 
    Platform_Name
ORDER BY 
    Avg_Unit_Cost DESC;

-- Which Equipment Categories have Over Budget status
SELECT 
    Equipment_Category,
    COUNT(*) AS Over_Budget_Count
FROM 
    DefenseData
WHERE 
    Budget_Status = 'Over Budget'
GROUP BY 
    Equipment_Category
ORDER BY 
    Over_Budget_Count DESC;

-- Total Spending and Status of Contract
SELECT 
    Contract_Status,
    SUM(Total_Contract_USD_M) AS Total_Spending
FROM 
    DefenseData
GROUP BY 
    Contract_Status
ORDER BY 
    Total_Spending DESC;

-- Total Spending by Country (Top 10 buyers)
SELECT 
   TOP 10 Country, SUM(Total_Contract_USD_M) AS Total_Spending
FROM
   DefenseData
GROUP BY 
    Country
ORDER BY 
    Total_Spending DESC;

-- Year-over-Year Spend Trend
SELECT 
  Contract_Year, SUM(Total_Contract_USD_M) AS Total_Spending
FROM 
  DefenseData
GROUP BY 
    Contract_Year
ORDER BY 
    Contract_Year ASC;

-- Budget Overrun Rate by Category
SELECT 
    Equipment_Category,
    COUNT(*) AS Total_Contracts,
    COUNT(CASE WHEN Budget_Status = 'Over Budget' THEN 1 END) AS Over_Budget_Count,
    ROUND(COUNT(CASE WHEN Budget_Status = 'Over Budget' THEN 1 END) * 100.0 / COUNT(*), 2) AS Overrun_Rate_Pct
FROM 
    DefenseData
GROUP BY 
    Equipment_Category
ORDER BY 
    Overrun_Rate_Pct DESC;

-- Top Suppliers by Revenue
SELECT TOP 10
    Supplier,
    SUM(Total_Contract_USD_M) AS Total_Revenue
FROM
    DefenseData
GROUP BY
    Supplier
ORDER BY
    Total_Revenue DESC;

-- NATO vs Non-NATO Spending
SELECT 
  NATO_Member, SUM(Total_Contract_USD_M) AS Total_Spending
FROM 
  DefenseData
GROUP BY
  NATO_Member
ORDER BY 
   Total_Spending DESC;
