# Dashboard project checklist

Add each Power BI dashboard under `projects/<project-name>/` using this structure:

```text
project-name/
├── README.md
├── assets/
│   └── dashboard-preview.png
├── dashboard/
│   ├── report.pbix
│   └── dashboard-preview.pdf
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
└── sql/
```

Only include folders that the project actually uses.

Every project README should document:

- The business problem and intended audience
- Key questions and dashboard insights
- Power BI, DAX, Power Query, SQL, Excel, or Python skills demonstrated
- Data model and important measures
- Clear instructions for opening or reproducing the report
- Dataset source, license, and learning acknowledgments
- A current dashboard preview without personal or sensitive data

Before publishing, verify that the PBIX opens, links work, exported previews match the latest report, and no local credentials or confidential data are included.
