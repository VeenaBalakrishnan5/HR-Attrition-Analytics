# HR-Attrition-Analytics
## Project Overview

Employee attrition is one of the most expensive workforce challenges faced by organizations. This project combines Data Analytics, Machine Learning, SQL, and Power BI to identify employees at risk of leaving, understand the drivers of attrition, and estimate the financial impact on the organization.

The solution provides:

* Attrition trend analysis
* Employee risk scoring
* Key attrition drivers
* Department-wise attrition insights
* Estimated attrition cost analysis
* Interactive Power BI dashboard

---

## Business Problem

Organizations often discover employee resignation only after the employee decides to leave.

This project aims to:

* Identify employees with high attrition risk
* Understand factors driving employee turnover
* Estimate financial impact of attrition
* Support HR teams in retention planning

---

## Tech Stack

### Python

* Pandas
* NumPy
* Scikit-Learn
* Matplotlib

### SQL Server

* Data storage
* Business analysis queries

### Power BI

* Interactive dashboards
* Executive reporting

---

## Data Cleaning

The following issues were identified and corrected:

* Duplicate employee records removed
* Invalid age values corrected
* Invalid monthly income values corrected
* Missing values handled
* Department names standardized
* Gender values standardized
* Overtime values standardized

Result:

* Clean dataset ready for analysis
* No missing values
* No duplicate records

---

## Machine Learning

### Models Used

#### Logistic Regression

Used as an interpretable baseline model.

#### Random Forest Classifier

Used for employee attrition prediction and risk scoring.

---

## Risk Scoring Methodology

Random Forest predicted probabilities were converted into a risk score ranging from 0–100.

### Risk Categories

| Score  | Category    |
| ------ | ----------- |
| 0–30   | Low Risk    |
| 31–60  | Medium Risk |
| 61–100 | High Risk   |

---

## Key Drivers of Attrition

Feature importance analysis identified the following major factors:

1. Monthly Income
2. Overtime
3. Work-Life Balance
4. Years at Company
5. Age
6. Total Working Years
7. Environment Satisfaction
8. Distance From Home
9. Job Role
10. Job Satisfaction

---

# Dashboard Pages

## 1. Executive Overview

<img width="1345" height="760" alt="Executive_Overview" src="https://github.com/user-attachments/assets/3d846004-e0bf-4491-a4a1-b49defead8ff" />


Features:

* Total Employees
* Attrition Rate
* Cost of Attrition
* High-Risk Employees
* Department Analysis
* Job Role Analysis
* Tenure Analysis

---

## 2. Risk & Drivers

<img width="1347" height="755" alt="Risk Drivers" src="https://github.com/user-attachments/assets/9cfa00f9-f7b0-40cd-bafe-77dad8bf34ae" />


Features:

* Income vs Risk Score Analysis
* High Risk Employee Table
* Department Risk Distribution
* Feature Importance Analysis

---

## 3. Cost Impact Analysis

<img width="1348" height="751" alt="Cost_Impact" src="https://github.com/user-attachments/assets/1f27a2a5-0562-4d3f-8baa-d31af09ff1ff" />


Features:

* Total Attrition Cost
* Potential Cost at Risk
* Department Cost Breakdown
* Tenure-Based Cost Analysis
* Risk by Job Role

---

## Key Insights

### Workforce Overview

* Total Employees: 1,470
* Attrition Rate: 13.7%
* High Risk Employees: 93

### Department Insights

* Research & Development contributes the highest attrition cost.
* Sales department shows significant employee turnover.
* Human Resources has the lowest overall attrition volume.

### Risk Insights

* Lower income employees show higher attrition risk.
* Overtime is one of the strongest predictors of attrition.
* Poor work-life balance increases attrition probability.

### Financial Impact

* Estimated attrition cost exceeds $8 million.
* Majority of costs originate from early-tenure employees.

---

### Business Recommendations 

* Review overtime policies for high-risk departments.
* Improve work-life balance initiatives.
* Focus retention efforts on employees with less than 5 years tenure.
* Introduce compensation reviews for low-income employee groups.
* Develop targeted retention programs for Sales and R&D teams.
