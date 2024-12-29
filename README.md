# Sales Insights Dashboard
## Category-Wise Analysis and Growth Trends

### Overview
The **Sales Insights Dashboard** is a comprehensive project aimed at analyzing and visualizing sales data for better decision-making. It focuses on category-wise performance and growth trends, leveraging tools like SQL, Python, and Power BI for efficient data handling and representation.

---

### Key Features
- **Data Processing and Analysis**: Clean and preprocess sales data using Python and SQL.
- **Category-Wise Insights**: Analyze sales trends by category to understand performance metrics.
- **Growth Trends Visualization**: Utilize Power BI to visualize year-over-year and month-over-month growth trends.
- **Interactive Dashboards**: Enable filters for categories and regions to create dynamic visualizations.
- **Custom Metrics**: Calculate and display profit growth, discount percentages, and more.

---

### Technology Stack
- **Programming Languages**: Python, SQL
- **Libraries**: Pandas, NumPy, Matplotlib
- **Database**: SQL Server
- **Visualization Tool**: Power BI
- **Other Tools**: Jupyter Notebook, Kaggle Datasets

---

### Project Workflow

1. **Data Preparation**
   - Download and preprocess sales data (`orders.csv`) from Kaggle.
   - Clean the data using Python for consistency and usability.

2. **SQL Integration**
   - Import data into SQL Server tables manually or programmatically using Python.
   - Use SQL Server Management Studio (SSMS) for advanced query analysis and result exports.

3. **Data Visualization**
   - Connect Power BI to SQL Server or import data directly from CSV files.
   - Create interactive visualizations (bar charts, tables) for category-wise and profit growth metrics.

---

### Installation and Setup

#### Prerequisites
- Python 3.x installed on your system.
- SQL Server and SQL Server Management Studio (SSMS).
- Power BI Desktop.

#### Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/Sales-Insights-Dashboard.git
   cd Sales-Insights-Dashboard
   ```

2. **Install Python Dependencies**
   ```bash
   pip install pandas matplotlib numpy
   ```

3. **Prepare the Dataset**
   - Place the Kaggle JSON file in `C:/Users/YourUsername/.kaggle`.
   - Download `orders.csv` using the Kaggle API.
   - Extract and clean the dataset in Python.

4. **SQL Server Setup**
   - Create the necessary tables in SQL Server.
   - Load data into SQL Server using Python or SSMS.

5. **Run Jupyter Notebook**
   Launch Jupyter Notebook to execute Python scripts:
   ```bash
   jupyter notebook
   ```

6. **Connect Power BI to SQL Server**
   - Use SQL Server credentials to load data into Power BI.
   - Build and customize visualizations.

---

### Usage

1. **Preprocessing**
   - Rename columns for consistency and clean the data using Python.

2. **SQL Queries**
   - Execute SQL queries to calculate metrics like profit growth and discount percentages.

3. **Visualization**
   - Use Power BI to display sales insights dynamically with slicers and filters.

---

### Project Structure
```
Sales Insights Dashboard - Category Wise Analysis and Growth Trends/
│
├── Data and Scripts/                # Contains datasets and Python scripts
├── PowerBI Report and Visualization/ # Power BI files and visualizations
├── SQL Query and Results/            # SQL queries and exported results
└── README.md                         # Project documentation

```

---

### Future Enhancements
- Automate data extraction and loading processes.
- Incorporate machine learning models for predictive sales insights.
- Add role-based access control for dashboard users.


