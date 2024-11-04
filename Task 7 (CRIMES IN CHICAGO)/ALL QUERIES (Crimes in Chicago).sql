USE [Crimes in Chicago];


SELECT 
		TRY_CONVERT(DATE, Date) AS "Date", 
		DATEPART(HOUR, TRY_CONVERT(TIME, Date)) AS "Time(InHours)",
		Primary_Type AS Crime,
		COUNT(*) AS TotalCrimes, 
		SUM(CASE WHEN Arrest = 'True' THEN 1 ELSE 0 END) AS TotalArrests,
		SUM(CASE WHEN Arrest = 'False' THEN 1 ELSE 0 END) AS TotalNotArrests,
		SUM(CASE WHEN Domestic = 'True' THEN 1 ELSE 0 END) AS TotalDomestics,
		SUM(CASE WHEN Domestic = 'False' THEN 1 ELSE 0 END) AS TotalNotDomestics
		FROM [2001_to_2004]
GROUP BY TRY_CONVERT(DATE, Date), DATEPART(HOUR, TRY_CONVERT(TIME, Date)), Primary_Type
HAVING TRY_CONVERT(DATE, Date) IS NOT NULL

UNION

SELECT 
		TRY_CONVERT(DATE, Date) AS "Date", 
		DATEPART(HOUR, TRY_CONVERT(TIME, Date)) AS "Time(InHours)",
		Primary_Type AS Crime,
		COUNT(*) AS TotalCrimes, 
		SUM(CASE WHEN Arrest = 'True' THEN 1 ELSE 0 END) AS TotalArrests,
		SUM(CASE WHEN Arrest = 'False' THEN 1 ELSE 0 END) AS TotalNotArrests,
		SUM(CASE WHEN Domestic = 'True' THEN 1 ELSE 0 END) AS TotalDomestics,
		SUM(CASE WHEN Domestic = 'False' THEN 1 ELSE 0 END) AS TotalNotDomestics
		FROM [2005_to_2007]
GROUP BY TRY_CONVERT(DATE, Date), DATEPART(HOUR, TRY_CONVERT(TIME, Date)), Primary_Type
HAVING TRY_CONVERT(DATE, Date) IS NOT NULL

UNION

SELECT 
		TRY_CONVERT(DATE, Date) AS "Date", 
		DATEPART(HOUR, TRY_CONVERT(TIME, Date)) AS "Time(InHours)",
		"Primary Type" AS Crime,
		COUNT(*) AS TotalCrimes, 
		SUM(CASE WHEN Arrest = 'True' THEN 1 ELSE 0 END) AS TotalArrests,
		SUM(CASE WHEN Arrest = 'False' THEN 1 ELSE 0 END) AS TotalNotArrests,
		SUM(CASE WHEN Domestic = 'True' THEN 1 ELSE 0 END) AS TotalDomestics,
		SUM(CASE WHEN Domestic = 'False' THEN 1 ELSE 0 END) AS TotalNotDomestics
		FROM [2008_to_2011]
GROUP BY TRY_CONVERT(DATE, Date), DATEPART(HOUR, TRY_CONVERT(TIME, Date)), "Primary Type"
HAVING TRY_CONVERT(DATE, Date) IS NOT NULL

UNION

SELECT 
		TRY_CONVERT(DATE, Date) AS "Date", 
		DATEPART(HOUR, TRY_CONVERT(TIME, Date)) AS "Time(InHours)",
		Primary_Type AS Crime,
		COUNT(*) AS TotalCrimes, 
		SUM(CASE WHEN Arrest = 'True' THEN 1 ELSE 0 END) AS TotalArrests,
		SUM(CASE WHEN Arrest = 'False' THEN 1 ELSE 0 END) AS TotalNotArrests,
		SUM(CASE WHEN Domestic = 'True' THEN 1 ELSE 0 END) AS TotalDomestics,
		SUM(CASE WHEN Domestic = 'False' THEN 1 ELSE 0 END) AS TotalNotDomestics
		FROM [2012_to_2017]
WHERE TRY_CONVERT(DATE, Date) < '1/1/2017'
GROUP BY TRY_CONVERT(DATE, Date), DATEPART(HOUR, TRY_CONVERT(TIME, Date)), Primary_Type
HAVING TRY_CONVERT(DATE, Date) IS NOT NULL

ORDER BY "Date", "Time(InHours)";


--LOCATIONS

SELECT 
	TRY_CONVERT(DATE, Date) AS "DATE",
	Location_Description AS "LOCATION",
	Primary_Type AS CRIME,
	COUNT(*) AS TotalCrimes
FROM 
	[2001_to_2004]
GROUP BY 
	TRY_CONVERT(DATE, Date),
	Location_Description,
	Primary_Type
HAVING 
	Location_Description IS NOT NULL
	AND TRY_CONVERT(DATE, Date) IS NOT NULL
UNION ALL
SELECT 
	TRY_CONVERT(DATE, Date) AS "DATE",
	Location_Description AS "LOCATION",
	Primary_Type AS CRIME,
	COUNT(*) AS TotalCrimes
FROM 
	[2005_to_2007]
GROUP BY 
	TRY_CONVERT(DATE, Date),
	Location_Description,
	Primary_Type
HAVING 
	Location_Description IS NOT NULL
	AND TRY_CONVERT(DATE, Date) IS NOT NULL
UNION ALL
SELECT 
	TRY_CONVERT(DATE, Date) AS "DATE",
	"Location Description" AS "LOCATION",
	"Primary Type" AS CRIME,
	COUNT(*) AS TotalCrimes
FROM 
	[2008_to_2011]
GROUP BY 
	TRY_CONVERT(DATE, Date),
	"Location Description",
	"Primary Type"
HAVING
	"Location Description" IS NOT NULL
	AND TRY_CONVERT(DATE, Date) IS NOT NULL
UNION ALL
SELECT 
	TRY_CONVERT(DATE, Date) AS "DATE",
	Location_Description AS "LOCATION",
	Primary_Type AS CRIME,
	COUNT(*) AS TotalCrimes
FROM 
	[2012_to_2017]
WHERE TRY_CONVERT(DATE, Date) < '1/1/2017'
GROUP BY 
	TRY_CONVERT(DATE, Date),
	Location_Description,
	Primary_Type
HAVING 
	Location_Description IS NOT NULL
	AND TRY_CONVERT(DATE, Date) IS NOT NULL
ORDER BY 
	DATE,
	TotalCrimes DESC;

--CRIMES VIEW

CREATE VIEW CRIMES AS

SELECT 
	TRY_CONVERT(DATE, Date) AS "DATE",
	Primary_Type AS CRIME,
	COUNT(*) AS TotalCrimes
FROM 
	[2001_to_2004]
GROUP BY 
	TRY_CONVERT(DATE, Date),
	Primary_Type
HAVING 
	TRY_CONVERT(DATE, Date) IS NOT NULL
	AND Primary_Type IS NOT NULL

UNION

SELECT 
	TRY_CONVERT(DATE, Date) AS "DATE",
	Primary_Type AS CRIME,
	COUNT(*) AS TotalCrimes
FROM 
	[2005_to_2007]
GROUP BY 
	TRY_CONVERT(DATE, Date),
	Primary_Type
HAVING 
	TRY_CONVERT(DATE, Date) IS NOT NULL
	AND Primary_Type IS NOT NULL

UNION

SELECT 
	TRY_CONVERT(DATE, Date) AS "DATE",
	"Primary Type" AS CRIME,
	COUNT(*) AS TotalCrimes
FROM 
	[2008_to_2011]
GROUP BY 
	TRY_CONVERT(DATE, Date),
	"Primary Type"
HAVING 
	TRY_CONVERT(DATE, Date) IS NOT NULL
	AND "Primary Type" IS NOT NULL

UNION

SELECT 
	TRY_CONVERT(DATE, Date) AS "DATE",
	Primary_Type AS CRIME,
	COUNT(*) AS TotalCrimes
FROM 
	[2012_to_2017]
WHERE TRY_CONVERT(DATE, Date) < '1/1/2017'
GROUP BY 
	TRY_CONVERT(DATE, Date),
	Primary_Type
HAVING 
	TRY_CONVERT(DATE, Date) IS NOT NULL
	AND Primary_Type IS NOT NULL;

-- DATE

SELECT 
	"DATE",
	SUM(CONVERT(INT, TotalCrimes)) AS TotalCrimes
FROM 
	CRIMES
WHERE "DATE" < '1/1/2017'
GROUP BY
	"DATE"
ORDER BY
	"DATE"

--CRIMES

SELECT 
    CASE 
        WHEN CRIME IN ('NON - CRIMINAL','NON-CRIMINAL (SUBJECT SPECIFIED)') THEN 'NON-CRIMINAL'
        ELSE CRIME 
    END AS CRIME,
    CASE 
        WHEN CRIME IN ('BATTERY', 'ASSAULT', 'HOMICIDE', 'KIDNAPPING', 'DOMESTIC VIOLENCE', 'STALKING', 'INTIMIDATION') THEN 'Crimes Against Persons'
        WHEN CRIME IN ('BURGLARY', 'MOTOR VEHICLE THEFT', 'CRIMINAL DAMAGE', 'ARSON', 'DECEPTIVE PRACTICE', 'CRIMINAL TRESPASS') THEN 'Crimes Against Property'
        WHEN CRIME IN ('PUBLIC PEACE VIOLATION', 'INTERFERENCE WITH PUBLIC OFFICER', 'WEAPONS VIOLATION') THEN 'Public Order Crimes'
        WHEN CRIME IN ('NARCOTICS', 'OTHER NARCOTIC VIOLATION', 'LIQUOR LAW VIOLATION') THEN 'Substance-Related Crimes'
        WHEN CRIME IN ('PROSTITUTION', 'PUBLIC INDECENCY', 'OBSCENITY', 'GAMBLING') THEN 'Morality and Decency Crimes'
        WHEN CRIME IN ('OFFENSE INVOLVING CHILDREN', 'CRIM SEXUAL ASSAULT') THEN 'Family and Child-Related Crimes'
        WHEN CRIME IN ('NON-CRIMINAL','NON - CRIMINAL','NON-CRIMINAL (SUBJECT SPECIFIED)', 'CONCEALED CARRY LICENSE VIOLATION', 'RITUALISM') THEN 'Non-Criminal or Other'
        ELSE 'Uncategorized'
    END AS CrimeCategory,
    SUM(CONVERT(INT, TotalCrimes)) AS TOTAL
FROM 
    CRIMES
WHERE "DATE" <'1/1/2017'
GROUP BY 
    CASE 
        WHEN CRIME IN ('NON - CRIMINAL','NON-CRIMINAL (SUBJECT SPECIFIED)') THEN 'NON-CRIMINAL'
        ELSE CRIME 
    END,
    CASE 
         WHEN CRIME IN ('BATTERY', 'ASSAULT', 'HOMICIDE', 'KIDNAPPING', 'DOMESTIC VIOLENCE', 'STALKING', 'INTIMIDATION') THEN 'Crimes Against Persons'
        WHEN CRIME IN ('BURGLARY', 'MOTOR VEHICLE THEFT', 'CRIMINAL DAMAGE', 'ARSON', 'DECEPTIVE PRACTICE', 'CRIMINAL TRESPASS') THEN 'Crimes Against Property'
        WHEN CRIME IN ('PUBLIC PEACE VIOLATION', 'INTERFERENCE WITH PUBLIC OFFICER', 'WEAPONS VIOLATION') THEN 'Public Order Crimes'
        WHEN CRIME IN ('NARCOTICS', 'OTHER NARCOTIC VIOLATION', 'LIQUOR LAW VIOLATION') THEN 'Substance-Related Crimes'
        WHEN CRIME IN ('PROSTITUTION', 'PUBLIC INDECENCY', 'OBSCENITY', 'GAMBLING') THEN 'Morality and Decency Crimes'
        WHEN CRIME IN ('OFFENSE INVOLVING CHILDREN', 'CRIM SEXUAL ASSAULT') THEN 'Family and Child-Related Crimes'
        WHEN CRIME IN ('NON-CRIMINAL','NON - CRIMINAL','NON-CRIMINAL (SUBJECT SPECIFIED)', 'CONCEALED CARRY LICENSE VIOLATION', 'RITUALISM') THEN 'Non-Criminal or Other'
        ELSE 'Uncategorized'
    END
ORDER BY 
    TOTAL DESC;