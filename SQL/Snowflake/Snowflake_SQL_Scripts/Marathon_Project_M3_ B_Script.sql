/* INSTRUCTIONS FOR ALL QUERIES 
--Provide aliases for column names to make them reader-friendly - you shouldn't have any columns labeled with an aggregator function (e.g., no AVG(), SUM(), etc. in your final column names). All column aliases should reflect the column's meaning based on the question - so for instance, if you are counting the number of runners in a race, alias that column something like 'num_runners' (NOT 'number' or 'count' - those are too vague).
--You can use natural (inner) JOINs for any queries that require joins.


Querys For Fast Table Names: */

SELECT 
    table_name 
FROM 
    information_schema.tables 
WHERE 
    table_schema = 'MARATHON_DB';
    
/*
Results:
TABLE_NAME
CITIES
EVENT_EXPENSES
MERCHANDISE_PRODUCTS
RACE_ROSTER
RUNNERS
WEATHER
RACE_EVENTS
VENUES
EVENT_SPONSORS
RUNNER_PURCHASES
VOLUNTEER_ROSTER
VOLUNTEERS
RACES
*/

// Query For Fast Column Information: 



SELECT 
    table_name,
    column_name,
    data_type,
    is_nullable
FROM 
    information_schema.columns
WHERE 
    table_schema = 'MARATHON_DB'
ORDER BY 
    table_name, ordinal_position;


/* PART B: RACE EXPENSES AND SPONSORSHIPS */

--B1: Produce a table of the five events with the highest total expenses (only worry about expenses from the 'expenses_table' here - not sponsorships, merchandise revenue, venue fees, or registration fees). Your query should ONLY show the event name, date, city, state, and expense total. 

// Main Query Part B1

SELECT 
    re.event_name AS event_name,
    re.event_date AS event_date,
    re.city AS city,
    re.state AS state,
    SUM(ee.expense_amount) AS total_expenses
FROM 
    RACE_EVENTS re
JOIN 
    EVENT_EXPENSES ee
ON 
    re.event_id = ee.event_id
GROUP BY 
    re.event_name, re.event_date, re.city, re.state
ORDER BY 
    total_expenses DESC
LIMIT 5;


// Querys For Column Names and Table Info

SELECT DISTINCT
    expense_type
FROM
    event_expenses;


SELECT 
    *
FROM
    race_events
LIMIT 1;





--B2: Produce a table of the events where the insurance expense was greater than average (that is, greater than the average insurance expense across all events). Your query should ONLY show the event name, date, and insurance expense amount. NOTE: You should type this as a single query, without hard-coding (i.e., typing) the specific value for the average insurance expense value. In a couple of our exercises, we have run queries that compared values in a table with a value calculated from another query!

// Main Query Part B2

SELECT 
    re.event_name AS event_name,
    re.event_date AS event_date,
    ee.expense_amount AS insurance_expense
FROM 
    RACE_EVENTS re
JOIN 
    EVENT_EXPENSES ee
ON 
    re.event_id = ee.event_id
WHERE 
    ee.expense_type = 'expense_insurance'
    AND ee.expense_amount > (
        SELECT AVG(expense_amount)
        FROM EVENT_EXPENSES
        WHERE expense_type = 'expense_insurance'
    )
ORDER BY 
    insurance_expense DESC
LIMIT 10;


// Querys For Column Names and Table Info

SELECT DISTINCT
    expense_type
FROM
    event_expenses;


SELECT 
    *
FROM
    race_events
LIMIT 1;


--B3: The race organizers want to calculate how many 'small sponsorships' they've received for each event. A 'small sponsorship' is defined as either a bronze sponsorship from a company with less than 10 employees, or a bronze or silver sponsorship from a company with between 10 and 99 employees. Your query should list the event_id (one row per event), the NUMBER of small sponsorships the event received, and the total value of those sponsorships.

// Main Query Part B3

SELECT 
    es.event_id AS event_id,
    COUNT(*) AS small_sponsorship_count,
    SUM(es.sponsor_amount) AS total_sponsorship_value
FROM 
    EVENT_SPONSORS es
WHERE 
    (es.sponsor_level = 'Bronze' AND es.employee_count = '1-9')
    OR
    (es.sponsor_level IN ('Bronze', 'Silver') AND es.employee_count = '10-99')
GROUP BY 
    es.event_id
ORDER BY 
    small_sponsorship_count DESC
LIMIT 10;

    
// Querys For Column Names and Table Info

SELECT DISTINCT
    expense_type
FROM
    event_expenses;


SELECT 
    *
FROM
    event_sponsors
LIMIT 10;


SELECT 
    *
FROM
    event_sponsors
WHERE
    employee_count = '10-99'
LIMIT 10;


SELECT 
    column_name,
    data_type,
    is_nullable
FROM 
    information_schema.columns
WHERE 
    table_name = 'EVENT_SPONSORS'
    AND table_schema = 'MARATHON_DB';


