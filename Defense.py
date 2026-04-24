import pandas as pd
import numpy as np
import datetime

df = pd.read_excel("Defense_Contracts.xlsx", sheet_name='Raw_Defense_Data')

df = df.drop(columns=['Supplier'])
df = df.rename(columns={'Supplier.1': 'Supplier'})
df = df.rename(columns={'Budget Status': 'Budget_Status'})

formula = r'=AVERAGE\(Q2:Q1500\)'

numeric_cols = ['Unit_Cost_USD_M', 'Total_Contract_USD_M', 
                'Budget_Allocated_USD_M', 'GDP_Defense_Pct', 'R&D_Cost_USD_M']
for col in numeric_cols:
    df[col] = df[col].astype(str).str.replace(formula, '', regex=True)
    df[col] = pd.to_numeric(df[col], errors='coerce')

df['Unit_Cost_USD_M'] = df['Unit_Cost_USD_M'].fillna(df['Unit_Cost_USD_M'].median())
print(df['Unit_Cost_USD_M'].isnull().sum())  

df['GDP_Defense_Pct'] = df['GDP_Defense_Pct'].fillna(df['GDP_Defense_Pct'].mode()[0])
print(df['GDP_Defense_Pct'].isnull().sum())  

df = df.dropna(subset=['Contract_ID'])
print(df['Contract_ID'].isnull().sum())   

df['Military_Personnel'] = df['Military_Personnel'].fillna(df['Military_Personnel'].median())
print(df['Military_Personnel'].isnull().sum())  

df['Supplier_Country'] = df['Supplier_Country'].fillna('Unknown')
print(df['Supplier_Country'].isnull().sum())  


df['Expected_Delivery'] = df['Expected_Delivery'].apply(lambda x: pd.NaT if isinstance(x, datetime.time) else x)
df['Expected_Delivery'] = pd.to_datetime(df['Expected_Delivery'], errors='coerce')
df['Expected_Delivery'] = df['Expected_Delivery'].fillna(df['Expected_Delivery'].median())
print(df['Expected_Delivery'].isnull().sum()) 

#df.to_excel('Defense_Contracts_Clean.xlsx', index=False)
df.to_csv('Defense_Contracts_Clean.csv', index=False)