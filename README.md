The Covid exploration focuses on exploring and analyzing COVID-19 data. The dataset includes information on COVID deaths and vaccinations worldwide. Various SQL queries are used to derive insights into infection rates, death rates, global numbers, and vaccination statistics.

Key techniques used
1.) Percentage Calculation: Calculating death and infection percentages based on total cases and total deaths.
2.) Grouping and Aggregation: Grouping data by location, continent, and date to derive meaningful insights.
3.) Window Functions: Utilizing window functions for cumulative calculations, such as total vaccinations over time.
4.) Common Table Expressions (CTEs): Using CTEs to simplify complex queries and improve code readability.
5.) Temporary Tables: Creating temporary tables to store intermediate results and facilitate further analysis.
6.) Views: Creating a view to store data for visualization purposes.

The Housing project focuses on cleaning housing data. The dataset includes information on property sales, addresses, and ownership details. The cleaning process involves standardizing dates, handling NULL addresses, splitting address components, and transforming categorical data.

Key techniques used:
1.) Date Standardization: Converting sale dates to a standardized date format.
2.) Address Cleaning: Handling NULL addresses and splitting them into individual components (Address, City).
3.) Parsing Names: Using the PARSENAME function to extract components from owner addresses.
4.) Categorical Data Transformation: Changing 'Y' and 'N' symbols to 'Yes' and 'No' in the 'Sold as Vacant' column.
5.) Duplicate Removal: Identifying and removing duplicate records using ROW_NUMBER and window functions.
6.) Column Dropping: Removing unused columns to streamline the dataset.

This Python project focuses on analyzing correlations among various features of movie data. The dataset is explored, cleaned, and then used to identify relationships between different variables. The primary goal is to understand how certain factors, such as budget, are correlated with the gross earnings of movies.

Key techniques used:
1.) Data Exploration and Cleaning: Iterating through columns to identify missing data. Calculating the percentage of missing data for each column. Filling missing values, in this case, using 0 for the 'budget' column. Converting data types for better analysis, such as converting 'budget' to int64. 
2.) Scatter Plots: Creating scatter plots to visualize relationships between different variables. Using scatter_matrix to display multiple scatter plots in a grid for a holistic view.
3.) Regression Plots: Utilizing regression plots (in this case, using Seaborn's regplot) to analyze the linear relationship between two variables, such as 'budget' and 'gross earnings'.
4.) Correlation Analysis: Calculating Pearson correlation coefficients between numerical variables using Pandas. Creating a correlation matrix to represent the correlation between all pairs of variables. Visualizing the correlation matrix using Seaborn's heatmap.
5.)Categorical Variable Handling: Numerically encoding categorical variables using category codes. Allowing for the inclusion of categorical variables in correlation analysis.
6.) Heatmap Visualization: Visualizing correlation matrices using heatmaps for better interpretability.
