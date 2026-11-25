# E-Commerce Business Performance & Customer Analytics

An end-to-end data analytics project focused on evaluating e-commerce business performance, customer purchasing behaviour, product profitability, website traffic, and conversion trends using **Excel, Python, SQL, and Power BI**.

## Project Overview

This project analyzes e-commerce transactional and website activity data to understand business performance and identify actionable insights.

The analysis covers revenue and profitability, product performance, customer purchasing patterns, marketing channel effectiveness, device-wise conversion, and website engagement.

The objective is to transform raw business data into meaningful insights that can support data-driven decision-making.

## Business Objectives

- Evaluate overall sales, revenue, costs, and profitability.
- Identify top-performing products based on revenue and profit.
- Analyze customer purchasing behaviour and repeat purchase patterns.
- Measure website traffic and conversion performance across acquisition sources.
- Compare desktop and mobile user engagement and conversion.
- Identify business performance trends and opportunities for improvement.
- Develop an interactive Power BI dashboard for business monitoring.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data inspection, analysis, and reporting |
| Python | Data cleaning, exploratory data analysis, and visualization |
| Pandas & NumPy | Data manipulation and numerical analysis |
| Matplotlib & Seaborn | Data visualization |
| SQL | Business queries and KPI analysis |
| SQLite | SQL-based analysis environment |
| Power BI | Interactive dashboard and business reporting |
| Jupyter Notebook | Analytical workflow and documentation |
| GitHub | Project version control and documentation |

## Project Workflow

1. **Data Understanding:** Reviewed the available datasets, their structure, columns, data types, and relationships.
2. **Data Cleaning:** Handled missing values, checked duplicate records, validated keys, and converted date columns.
3. **Data Analysis:** Performed exploratory analysis to identify business trends and patterns.
4. **SQL Analysis:** Used SQL queries to answer business questions and calculate key performance indicators.
5. **Dashboard Preparation:** Exported analytical datasets for Power BI.
6. **Visualization:** Developed an interactive Power BI dashboard to communicate business performance.
7. **Insights:** Interpreted the results and identified potential business improvement opportunities.

## Analysis Performed

### 1. Microsoft Excel

Used Excel for initial data inspection and business analysis.

Key areas:
- Data exploration and organization
- Sales and revenue analysis
- Business calculations
- Summary reporting

**Workbook:** `Ecommerce_Business_Analysis.xlsx`

### 2. Python – Data Cleaning & Exploratory Data Analysis

Performed data preparation and exploratory analysis using Pandas, NumPy, Matplotlib, and Seaborn.

Key activities:
- Loaded and inspected the available datasets.
- Checked missing values and duplicate records.
- Validated primary keys and foreign-key relationships.
- Converted date columns into appropriate datetime formats.
- Handled missing attribution values using an `Unknown` category.
- Combined business data for integrated analysis.
- Analyzed sales, customers, products, traffic sources, devices, and website engagement.
- Created visualizations to communicate analytical findings.
- Prepared datasets for Power BI reporting.

**Notebook:** `python_analysis/notebooks/01_Data_Understanding.ipynb`

### 3. SQL – Business Analysis

Used SQL to answer business questions and calculate business performance metrics.

The analysis covered:

1. Monthly revenue trends
2. Top-performing products
3. Seller-wise sales analysis
4. Average Order Value (AOV)
5. Repeat customer analysis
6. Repeat customer percentage
7. Delivery delay analysis
8. State-wise customer or sales analysis
9. Product review rating analysis
10. Monthly revenue growth
11. Website users with sessions but no orders
12. Overall business performance KPIs

**Data availability note:** Some questions could not be answered using the available dataset because seller information, delivery dates, geographic state information, and product review ratings were not available. These questions were treated as data limitations rather than being answered using assumptions.

The website-user analysis identifies users with sessions but no recorded orders in the available data. It should not be interpreted as proof that those users have never purchased.

### 4. Power BI – Interactive Dashboard

Developed a Power BI dashboard to present business performance metrics and analytical findings.

The dashboard file is available in the repository:

`ECommerce_Analytics_Dashboard.pbix`

The analysis prepared for dashboard reporting includes:

- Sales and profitability
- Monthly sales and profit trends
- Product performance
- Customer analysis
- Traffic source performance
- Device-wise conversion and engagement

## Key Business Findings

The following results are based on the analyzed dataset.

### Overall Business Performance

| KPI | Result |
|---|---:|
| Total Orders | 32,313 |
| Total Customers | 31,696 |
| Total Items Sold | 40,025 |
| Gross Revenue | $1,938,509.75 |
| Cost of Goods Sold | $722,370.25 |
| Gross Profit | $1,216,139.50 |
| Refunds | $85,338.69 |
| Net Revenue | $1,853,171.06 |
| Average Order Value | $59.99 |
| Gross Profit Margin | 62.74% |
| Refund Rate | 4.40% |

### Customer Analysis

- Total customers analyzed: 31,696.
- Repeat customers: 591 (1.86%).
- One-time customers: 31,105 (98.14%).

The low repeat-customer share indicates an opportunity to investigate customer retention and repeat-purchase strategies.

### Product Performance

| Product | Revenue | Gross Profit |
|---|---:|---:|
| Original Mr. Fuzzy | $1,211,057.74 | $738,893.00 |
| Forever Love Bear | $347,702.04 | $217,350.00 |
| Birthday Sugar Panda | $229,260.15 | $157,027.50 |
| Hudson River Mini Bear | $150,489.82 | $102,869.00 |

Original Mr. Fuzzy contributed the highest revenue and gross profit among the analyzed products.

### Marketing Source Performance

| Traffic Source | Sessions | Conversion Rate |
|---|---:|---:|
| gsearch | 316,035 | 6.75% |
| Unknown | 83,328 | 7.34% |
| bsearch | 62,823 | 7.19% |
| socialbook | 10,685 | 3.21% |

gsearch generated the highest session volume. socialbook had the lowest conversion rate among the listed sources.

### Device Performance

| Device | Sessions | Conversion Rate | Revenue |
|---|---:|---:|---:|
| Desktop | 327,027 | 8.50% | $1,665,757.84 |
| Mobile | 145,844 | 3.09% | $272,751.91 |

Desktop users showed a higher conversion rate and generated substantially more revenue than mobile users. Improving the mobile user experience may represent an opportunity for conversion improvement.

### Website Engagement

- Total sessions: 472,871.
- Single-page sessions: 211,640.
- Multiple-page sessions: 261,231.
- Average pageviews per session: 2.51.
- Single-page session rate: 44.76%.

The single-page session rate was higher on mobile (52.75%) than desktop (41.19%), indicating a potential area for further user-experience analysis.


## How to Explore the Project

1. Clone or download this repository.
2. Open `Ecommerce_Business_Analysis.xlsx` to review the Excel analysis.
3. Open `python_analysis/notebooks/01_Data_Understanding.ipynb` using Jupyter Notebook or JupyterLab to explore the Python workflow.
4. Open `ECommerce_Analytics_Dashboard.pbix` using Microsoft Power BI Desktop to explore the dashboard.
5. Review the CSV files under `python_analysis/outputs/dashboard_data/` to inspect the datasets prepared for dashboard reporting.

**Note:** The repository currently contains the analysis notebook and exported dashboard datasets, but not the original raw input datasets. Reproducing the full analysis from scratch requires access to those source datasets.

## Conclusion

This project demonstrates an end-to-end analytical workflow, from data understanding and cleaning to exploratory analysis, SQL-based business problem solving, KPI development, and interactive dashboard reporting.

The analysis highlights key business performance indicators, product contribution, customer retention patterns, marketing channel effectiveness, and device-wise conversion differences.

It also demonstrates the importance of data quality, correct metric calculations, and recognizing dataset limitations before making business recommendations.

## Author

**Vedant Nikam**

GitHub: [vedant-5723](https://github.com/vedant-5723)

Project Repository: [E-Commerce Business Performance & Customer Analytics](https://github.com/vedant-5723/ecommerce-business-analytics)

---

*This project was developed for practical application of data analytics concepts and business intelligence techniques.*