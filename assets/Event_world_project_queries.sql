--the number of events recorded per country

SELECT   
		C.[CountryName]
		,count(E.[EventID]) AS [Number of Events]
 
  FROM [WorldEvents].[dbo].[tblEvent] E
  JOIN [WorldEvents].[dbo].[tblCountry] C
  ON E.[CountryID] = C.[CountryID]
  Group by C.[CountryName]
  ORDER BY [Number of Events] desc



  -- group events by both category and country, showing how many events there are for each combination? Include country name, category name, and event count."

  SELECT 
  CA.[CategoryName],
  C.[CountryName],
  count(E.[EventID]) AS [Number of Events]
  
  FROM [WorldEvents].[dbo].[tblEvent] E
  JOIN [WorldEvents].[dbo].[tblCountry] C
  ON E.[CountryID] = C.[CountryID]
  JOIN [WorldEvents].[dbo].[tblCategory] CA
  ON CA.[CategoryID] = E.[CategoryID]
  GROUP BY C.[CountryName] , CA.[CategoryName]



  --. Write a query to find all events that contain the word ‘War’ in the event name. The search should be case-insensitive."

  SELECT 
   [EventName]

  FROM [WorldEvents].[dbo].[tblEvent]

  WHERE [EventName] LIKE '%war%'


  
  --Events Timeline Per Era/periods

SELECT 
   [EventName],
   CASE 
   WHEN [EventDate] BETWEEN '1770' AND '1815' THEN 'Age of Revolutions (1776–1815)'
   WHEN [EventDate] BETWEEN '1816' AND '1914' THEN 'Industrial Expansion  (1815–1914)'
   WHEN [EventDate] BETWEEN '1915' AND '1945' THEN 'World Wars (1914–1945)'
   WHEN [EventDate] BETWEEN '1946' AND '1991' THEN 'Cold War (1945–1991)'
   ELSE 'Digital Age (1991–2007)'
   END AS [Period]

FROM [WorldEvents].[dbo].[tblEvent]



--Events count on Each Continent

SELECT 

       [ContinentName]
	  ,count([EventID])

  FROM [WorldEvents].[dbo].[tblContinent] CON
  JOIN [WorldEvents].[dbo].[tblCountry] COU
  ON CON.[ContinentID] = COU.[ContinentID]
  JOIN [WorldEvents].[dbo].[tblEvent] EV
  ON EV.[CountryID] = COU.[CountryID]
  GROUP BY [ContinentName]



  --: Longest Event Descriptions 
  --Can you find the top 10 events with the longest event descriptions?"


SELECT TOP (10)  
       [EventName]
      ,concat(LEN([EventDetails]) ,' Letters')  AS [Lenth of description]
 
  FROM [WorldEvents].[dbo].[tblEvent]
  GROUP BY [EventName] ,  LEN([EventDetails])
  order by [Lenth of description] desc


  -- events that occurred in World war between 1939 and 1945. Display their names, dates, and countries."

  SELECT 
	   [EventName]
      ,[EventDate]
	  ,[CountryName]

  FROM [WorldEvents].[dbo].[tblEvent] ev
  JOIN [WorldEvents].[dbo].[tblCountry] cou
  ON ev.[CountryID] = cou.[CountryID]
  WHERE YEAR([EventDate]) Between '1939' AND '1945'
  order by [EventDate] asc


  --Finding the categories which have No Events


SELECT 
       [EventID]
	  ,[CategoryName]
  FROM [WorldEvents].[dbo].[tblCategory] CA
  LEFT JOIN [WorldEvents].[dbo].[tblEvent] EV
  ON CA.[CategoryID] = EV.[CategoryID]
  WHERE [EventName] IS NULL



  --Event Count by Year in UK

SELECT  

       [CountryName]
	   ,count([EventID]) AS [Events count]
 
  FROM [WorldEvents].[dbo].[tblCountry] COU
  JOIN [WorldEvents].[dbo].[tblEvent] EV
  on ev.[CountryID] = cou.[CountryID]
  WHERE [CountryName] = 'United Kingdom'
  GROUP BY [CountryName]



-- Events that mention the word ‘nuclear’ in their event details."

SELECT 
       [EventName]
      ,[EventDetails]
      
  FROM [WorldEvents].[dbo].[tblEvent]
  WHERE [EventDetails] LIKE '%nuclear%'
