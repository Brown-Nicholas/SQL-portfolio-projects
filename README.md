The Covid exploration focuses on exploring and analyzing COVID-19 data. The dataset includes information on COVID deaths and vaccinations worldwide. Various SQL queries are used to derive insights into infection rates, death rates, global numbers, and vaccination statistics.

Key Techniques Used
1.) Percentage Calculation: Calculating death and infection percentages based on total cases and total deaths.
2.) Grouping and Aggregation: Grouping data by location, continent, and date to derive meaningful insights.
3.) Window Functions: Utilizing window functions for cumulative calculations, such as total vaccinations over time.
4.) Common Table Expressions (CTEs): Using CTEs to simplify complex queries and improve code readability.
5.) Temporary Tables: Creating temporary tables to store intermediate results and facilitate further analysis.
6.) Views: Creating a view to store data for visualization purposes.

The Housing project focuses on cleaning housing data. The dataset includes information on property sales, addresses, and ownership details. The cleaning process involves standardizing dates, handling NULL addresses, splitting address components, and transforming categorical data.

Key Techniques Used
1.) Date Standardization: Converting sale dates to a standardized date format.
2.) Address Cleaning: Handling NULL addresses and splitting them into individual components (Address, City).
3.) Parsing Names: Using the PARSENAME function to extract components from owner addresses.
4.) Categorical Data Transformation: Changing 'Y' and 'N' symbols to 'Yes' and 'No' in the 'Sold as Vacant' column.
5.) Duplicate Removal: Identifying and removing duplicate records using ROW_NUMBER and window functions.
6.) Column Dropping: Removing unused columns to streamline the dataset.
