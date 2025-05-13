# SQL Folder 🐬

This folder holds all the SQL work I've done that I was able to recover. My final business report from my database class is in the root Snowflake folder as a PDF, and includes conclusions drawn from Snowflake queries. The rest of my work follows the folder structure and uses the programs below.
<br/><br/>

## 📁 Folder Structure:
<br/>

**SQL/ProgramName/Filetype**
<br/><br/>

## 🖥️ Programs:

- **Draw.io** - Used for high-level ER diagrams
- **MySQL Workbench** - Used for EER diagrams and SQL script exports
- **Snowflake** - Used for actual databases and queries
<br/><br/>

## 🧾 Business Report

- **[Marathon Project Report (PDF)](./Snowflake/Marathon_Project_Final_Analysis_B.pdf)**  
This is my final business report. It includes analysis of marathon event expenses and sponsorship counts by sponsorship tier. All of the conclusions drawn here are based on Snowflake queries.
<br/><br/>

## 🔍 Highlights

- **[Mechanic Shop ER Diagram](./Drawio/Drawio_Diagrams/Mechanic_Shop_ER_Diagram.png)** - Draw.io ER diagram for a mechanic's shop, including vehicle owner types,vehicles, services, orders, and parts

- **[Advanced Course Registration EER Diagram](./MySQL_Workbench/MySQL_Workbench_Diagrams/Course_Registration_Advanced_EER_Diagram.png)** - MySQL Workbench EER database diagram for course registration including courses, instructors, students, and departments

- **[Country Capitals Table Normalization](./Snowflake/Snowflake_Misc._Code_and_Other/Country_Capitals_Table_Split.png)** - Snowflake queries in three browser windows. Shows 3NF normalization, splitting a table that included country and capital city information into two separate tables. In the new structure, the capital city's ID is used as a foreign key in the country table to reference capital city data