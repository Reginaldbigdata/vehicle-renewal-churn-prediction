# Vehicle Renewal Churn Analysis & 2026 Prediction

##  Project Overview

This project performs an end-to-end analysis of vehicle renewal data to:

- Identify customer churn between 2024 and 2025
- Calculate retention and churn rates using SQL
- Predict the likelihood of customer renewals in 2026 using machine learning
- Produce Excel-ready outputs for business decision-making

The project demonstrates a complete data workflow from data entry and SQL analysis to predictive modeling and reporting.

## Data Sources
The data used in this project was manually entered in Excel and exported as CSV files.

### Files:
- `2024_renewals.csv` — Vehicle renewals recorded in 2024
- `2025_renewals.csv` — Vehicle renewals recorded in 2025

### Columns:
- DATE
- SACCO
- REGISTRATION
- NAME
- CONTACT

## SQL Analysis: Churn & Retention

### Definition of Churn
A **churned customer** is defined as a customer who renewed in 2024 but did **not** renew in 2025.


### SQL Objectives
- Identify churned customers
- Classify customers as *Returned* or *Churned*
- Calculate retention and churn rates

### Techniques Used
- `LEFT JOIN`
- `NOT EXISTS`
- `COUNT(DISTINCT)`
- Business classification logic

SQL scripts are available in the `sql/` folder.


## Machine Learning: 2026 Renewal Prediction

### Feature Engineering
The following features were created from the 2025 data:
- **Registration Month** – captures seasonal renewal behavior
- **Has Contact** – indicates customer reachability
- **Sacco Size** – represents organizational scale and influence

### Model Used
- **Random Forest Classifier**


The model outputs:
- `Renewal_Prob_2026` — Probability of renewal in 2026
- `Predicted_Renewal_2026` — Binary renewal prediction



## Outputs & Reporting
Predictions are exported as CSV files for use in Excel, where conditional formatting is applied to highlight:
- High-probability renewals (≥ 0.80)
- Medium-probability renewals
- Low-probability renewals

Final outputs are stored in the `outputs/` folder.


## Tools & Technologies
- Excel
- MySQL
- Python (Pandas, NumPy, Scikit-learn)
- Jupyter Notebook / VS Code
- GitHub


##  Business Impact
This analysis helps stakeholders:
- Identify customers at high risk of churn
- Prioritize follow-ups using probability scores
- Improve renewal rates through targeted engagement strategies

##  Notes & Limitations
- The 2026 renewal target variable is simulated due to lack of historical 2026 data
- Model predictions should be interpreted as directional insights rather than absolute outcomes

