# Global-COVID-19-Dashboard
**Project Goal**
This project presents an end-to-end data analysis solution built entirely on the Databricks Lakehouse Platform. The objective was to ingest, process, and analyze the comprehensive Our World in Data COVID-19 dataset to uncover meaningful trends and insights. The final output is a professional-grade, interactive business intelligence (BI) dashboard that allows users to dynamically explore the data.

**Key Features & Insights**

Global KPI Tracking: The dashboard features high-level Key Performance Indicators (KPIs) such as total global cases, deaths, and vaccinations, calculated accurately to handle the cumulative nature of the source data.

Dynamic Continent & Country Filtering: Users can interactively filter the entire dashboard by continent or drill down into a specific country, causing all relevant charts and metrics to update in real-time.

Economic Correlation Analysis: A scatter plot visualizes the strong positive correlation between a country's GDP per capita and its population's full vaccination rate, providing key economic context to health outcomes.

Advanced Time-Series Analysis: A line chart visualizes not just daily new cases, but also a 7-day moving average to smooth out reporting noise and reveal the true underlying trend of infection waves.

Filters for Interactivity: Added a Filter to choose location and see the cases and view the dashboard change dynamically according to the location.

**How to Replicate**

Data Source: The owid-covid-data.csv dataset can be downloaded directly from https://github.com/owid/covid-19-data.

Platform Setup: Create a free Databricks Community Edition account and upload the CSV to create a Delta table.

Create Queries: The SQL scripts located in the /sql_queries folder can be used to create saved queries within the Databricks SQL Editor.

Build Dashboard: Use the saved queries as datasets to build the visualizations and assemble them into the final dashboard, connecting them to filters as described above.

Dashboard Link: https://dbc-a8b25b76-d391.cloud.databricks.com/dashboardsv3/01f0672424471a6dbd078caa2ed966aa/published?o=4124082510562367

<img width="1918" height="948" alt="image" src="https://github.com/user-attachments/assets/e84a64fc-53d2-4ee4-96ab-1d300c2ce21b" />



