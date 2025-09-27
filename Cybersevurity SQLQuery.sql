USE Cybersecurity;

SELECT * FROM Global_Threats;

-- 1. The total number of attacks in the dataset.
SELECT COUNT(*) AS Total_Incidents
FROM Global_Threats;

-- 2.The total financial losses and the number of affected users globally.
SELECT SUM([Financial_Loss_in_Million]) AS Total_Financial_Loss,
       SUM([Number_of_Affected_Users]) AS Total_Affected_Users
FROM Global_Threats;

-- 3. Number of attacks per country.
SELECT Country, COUNT(*) AS Incident_Count
FROM Global_Threats
GROUP BY Country
ORDER BY Incident_Count DESC;

-- 4. The most common types of attacks.
SELECT [Attack_Type], COUNT(*) AS Attack_Count
FROM Global_Threats
GROUP BY [Attack_Type]
ORDER BY Attack_Count DESC;

-- 5. Most targeted sectors.
SELECT [Target_Industry], COUNT(*) AS Target_Count
FROM Global_Threats
GROUP BY [Target_Industry]
ORDER BY Target_Count DESC;

-- 6. Top 3 attacks in terms of financial loss.
SELECT TOP 3 Country, Year, [Attack_Type], [Target_Industry], [Financial_Loss_in_Million]
FROM Global_Threats
ORDER BY [Financial_Loss_in_Million] DESC;

-- 7. Average resolution time for each type of attack.
SELECT [Attack_Type], AVG([Incident_Resolution_Time_in_Hours]) AS Avg_Resolution_Time
FROM Global_Threats
GROUP BY [Attack_Type]
ORDER BY Avg_Resolution_Time DESC;

-- 8. The total financial losses caused by each attack source.
SELECT [Attack_Source], SUM([Financial_Loss_in_Million]) AS Total_Loss
FROM Global_Threats
GROUP BY [Attack_Source]
ORDER BY Total_Loss DESC;

-- 9. Analysis of the effectiveness of defense mechanisms: Average resolution time for each mechanism.
SELECT [Defense_Mechanism_Used], AVG([Incident_Resolution_Time_in_Hours]) AS Avg_Resolution_Time
FROM Global_Threats
GROUP BY [Defense_Mechanism_Used]
ORDER BY Avg_Resolution_Time;

-- 10. The most exploited security vulnerabilities.
SELECT [Security_Vulnerability_Type], COUNT(*) AS Exploit_Count
FROM Global_Threats
GROUP BY [Security_Vulnerability_Type]
ORDER BY Exploit_Count DESC;

-- 11. The attacks carried out by 'Insider' and their details.
SELECT Country, Year, [Attack_Type], [Target_Industry]
FROM Global_Threats
WHERE [Attack_Source] = 'Insider';

-- 12. Comparison of the average financial loss between 'ransomware' attacks and 'denial of service' attacks.
SELECT [Attack_Type], AVG([Financial_Loss_in_Million]) AS Avg_Financial_Loss
FROM Global_Threats
WHERE [Attack_Type] IN ('Ransomware', 'DDoS')
GROUP BY [Attack_Type];

-- 13. Distribution of attacks over the years.
SELECT Year, COUNT(*) AS Incidents_Per_Year
FROM Global_Threats
GROUP BY Year
ORDER BY Year;

-- 14. Attacks that exploited the 'Zero-day' vulnerability (the most dangerous).
SELECT Country, Year, [Attack_Type], [Target_Industry], [Attack_Source]
FROM Global_Threats
WHERE [Security_Vulnerability_Type] = 'Zero-day';

-- 15. The country with the highest average financial loss per attack.
SELECT Country, AVG([Financial_Loss_in_Million]) AS Avg_Loss_Per_Incident
FROM Global_Threats
GROUP BY Country
ORDER BY Avg_Loss_Per_Incident DESC;