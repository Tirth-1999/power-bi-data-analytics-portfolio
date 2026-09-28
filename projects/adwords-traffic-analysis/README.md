# Digital Advertising Traffic Analytics

[![Python](https://img.shields.io/badge/Python-3.9%2B-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8%2B-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Power BI](https://img.shields.io/badge/Power_BI-Desktop-F2C811?logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/desktop/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](../../LICENSE)

An end-to-end business intelligence project that turns digital advertising traffic data into an interactive Power BI report. The project demonstrates data preparation with Python, relational modeling in MySQL, DAX-based KPI calculation, and dashboard design.

![Google AdWords Analytics dashboard](assets/dashboard-preview.png)

## Project scope

The report helps a marketing team answer four practical questions:

- Which keywords generate the most traffic and search demand?
- How do traffic and estimated cost change over time?
- Which keyword groups combine strong volume with manageable difficulty?
- Where should campaign managers focus optimization effort?

## What I built

- Prepared and classified 199 traffic records with Python and pandas.
- Organized the data into a traffic fact table and three keyword lookup tables.
- Defined a MySQL schema that supports repeatable loading and relational analysis.
- Built the Power BI semantic model, calculated measures, filters, and report visuals.
- Added date, quarter, keyword, cost, traffic, and difficulty views for interactive analysis.

The source dataset was reused from the project acknowledged in [Data provenance](#data-provenance). The analysis workflow, model implementation, and portfolio presentation in this repository document my own rebuild and learning work.

## Architecture

```mermaid
flowchart LR
    A[Raw Excel data] --> B[Python and pandas]
    B --> C[Analysis-ready CSV files]
    C --> D[MySQL relational model]
    D --> E[Power BI semantic model]
    E --> F[Interactive report]
```

## Data model

`website_traffic_data` is the central fact table. It joins to lookup tables through `keyword_id`.

| Table | Role | Grain |
|---|---|---|
| `website_traffic_data` | Fact | One observed result for a keyword and date |
| `keyword` | Dimension | One row per keyword group |
| `search_volume` | Lookup | Aggregated search volume per keyword group |
| `keyword_difficulty` | Lookup | Average difficulty and difficulty band per keyword group |

## Dashboard capabilities

- KPI cards for traffic, search volume, traffic cost, and search results
- Time-series analysis of traffic performance
- Keyword comparisons using bar and treemap visuals
- Difficulty and monthly distribution views
- Year, quarter, and keyword slicers
- Drill-down paths for more detailed exploration

Representative measures include:

```DAX
Average CPC = AVERAGE(website_traffic_data[CPC])
Total Results = SUM(website_traffic_data[Number_of_Results])
Total Search Volume = SUM(website_traffic_data[Search_Volume])
Total Traffic = SUM(website_traffic_data[Traffic])
Total Traffic Cost = SUM(website_traffic_data[Traffic_Cost])
```

## Repository contents

| Path | Description |
|---|---|
| `dashboard/adwords-traffic-dashboard.pbix` | Interactive Power BI report |
| `dashboard/dashboard-preview.pdf` | Shareable one-page report export |
| `data/raw/raw-adwords-data.xlsx` | Source workbook used by the notebook |
| `data/processed/website_traffic_data.csv` | Analysis-ready fact table |
| `data/processed/keyword.csv` | Keyword dimension |
| `data/processed/search_volume.csv` | Search-volume lookup |
| `data/processed/keyword_difficulty.csv` | Difficulty lookup |
| `notebooks/keyword-preparation.ipynb` | Python preparation and classification workflow |
| `sql/schema.sql` | MySQL schema and relationship definitions |
| `assets/` | Report, model, and workflow screenshots |

## Run the project

### Prerequisites

- Python 3.9 or newer
- Python packages listed in the repository's root `requirements.txt`
- MySQL 8 or newer, if reproducing the database layer
- Power BI Desktop, if opening or editing the report

### 1. Prepare the data

Install the Python dependencies:

```bash
python -m pip install -r ../../requirements.txt
```

Open `notebooks/keyword-preparation.ipynb` and run its cells. The notebook reads the workbook from `data/raw/` and writes generated tables to `data/processed/`.

### 2. Create the database model

Run `sql/schema.sql` in MySQL, then import the processed CSV files into their corresponding tables. Parse `Last Seen` values using the `DD-MM-YYYY` date format during import.

### 3. Explore the report

Open `dashboard/adwords-traffic-dashboard.pbix` in Power BI Desktop. If the local database connection differs from the one stored in the report, update it through **Transform data → Data source settings**.

## Data provenance

The advertising dataset was obtained from [AdityakumarDA/Adword-Data-Analysis](https://github.com/AdityakumarDA/Adword-Data-Analysis), which is distributed under the MIT License. The original copyright and license notice are retained in [LICENSE](../../LICENSE), and further details are recorded in [NOTICE.md](../../NOTICE.md).

This repository does not claim authorship of the source dataset. It presents Tirth Shah's independent rebuild of the analytical workflow and Power BI report using that data.

## Author

**Tirth Shah**

## License

The project is distributed under the [MIT License](../../LICENSE). Third-party attribution is documented in [NOTICE.md](../../NOTICE.md).

## Acknowledgment

Thanks to [Alex The Analyst](https://github.com/AlexTheAnalyst) for the Power BI learning resources that helped shape my approach to dashboard development.
