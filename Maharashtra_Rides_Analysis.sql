-- Viewed datasets to ensure proper importing
SELECT *
FROM Maharashtra_Rides

-- Zonewise Requested VS Completed trips
SELECT pickup_zone
    , count(ID) AS request
    , COUNT(DISTINCT CASE 
            WHEN STATUS = 'Completed'
                THEN ID
            ELSE NULL
            END) AS Completed_Rides
FROM maharashtra_rides
GROUP BY pickup_zone
ORDER BY request DESC

-- Average Duration by Pickup_Zone
SELECT pickup_zone
    , CAST(AVG(Ride_Duration / 100) AS DECIMAL(10, 2)) Avg_Ride_Duration
FROM Maharashtra_Rides
GROUP BY pickup_zone
ORDER BY Avg_Ride_Duration DESC

-- Number of rides by Vehicle_Types
SELECT pickup_zone
    , sum(CASE 
            WHEN ride_type = 1
                AND STATUS = 'Completed'
                THEN 1
            ELSE 0
            END) AS Bike_Rides_Completed
    , sum(CASE 
            WHEN ride_type = 2
                AND STATUS = 'Completed'
                THEN 1
            ELSE 0
            END) AS Car_Rides_Completed
    , sum(CASE 
            WHEN ride_type = 1
                AND STATUS = 'Canceled'
                THEN 1
            ELSE 0
            END) AS Bike_Rides_Canceled
    , sum(CASE 
            WHEN ride_type = 2
                AND STATUS = 'Canceled'
                THEN 1
            ELSE 0
            END) AS Car_Rides_Canceled
FROM Maharashtra_Rides
GROUP BY pickup_zone
ORDER BY pickup_zone

-- Zonewise Unique Users and Unique Drivers
SELECT pickup_zone
    , COUNT(DISTINCT rider_id) AS Num_Unique_Customers
    , COUNT(DISTINCT driver_id) AS Num_Unique_Drivers
FROM Maharashtra_Rides
GROUP BY pickup_zone
ORDER BY Num_Unique_Customers
    , Num_Unique_Drivers DESC

-- Average rides per user
SELECT cast(COUNT(*) / COUNT(DISTINCT rider_id) AS numeric(10,2)) Rides_Per_Customer
FROM Maharashtra_Rides

-- Weekday VS Weekends rides
SELECT CASE 
        WHEN DATEPART(WEEKDAY, created_at) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS Ride_Day_Type,
    COUNT(*) AS Num_Rides
FROM Maharashtra_Rides
GROUP BY CASE 
        WHEN DATEPART(WEEKDAY, created_at) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END

-- Driver cancellation
SELECT driver_ID
    , COUNT(*) AS Num_Cancelled_Rides
FROM Maharashtra_Rides
WHERE STATUS = 'Canceled'
    AND ride_type = 1
    AND driver_id <> 0
GROUP BY driver_id
ORDER BY Num_Cancelled_Rides DESC

-- Rides per Driver
SELECT 
    pickup_zone,
    COUNT(DISTINCT CASE 
            WHEN status = 'Completed'
                THEN id
            ELSE NULL
            END) / NULLIF(COUNT(CASE 
                WHEN status = 'Completed'
                    THEN max(driver_ID)
                ELSE NULL
                END) OVER (), 0) AS RPD
FROM Maharashtra_Rides 
GROUP BY pickup_zone, status
ORDER BY RPD DESC

-- Number of Served Users
SELECT pickup_zone
    , COUNT(DISTINCT CASE 
            WHEN STATUS = 'Completed'
                THEN rider_id
            ELSE NULL
            END) AS Served_Users
FROM Maharashtra_Rides
GROUP BY pickup_zone
ORDER BY Served_Users DESC

-- Number of Unserved users
WITH Users
AS (
    SELECT pickup_zone
        , COUNT(DISTINCT CASE 
                WHEN STATUS = 'Completed'
                    THEN rider_id
                ELSE NULL
                END) AS Active_Users
        , COUNT(DISTINCT rider_id) AS Unique_Users
    FROM maharashtra_rides
    GROUP BY pickup_zone
    )
SELECT pickup_zone
    , Unique_Users - Active_Users AS Unserved_Users
FROM Users
GROUP BY pickup_zone
    , Active_Users
    , Unique_Users
ORDER BY Unserved_Users DESC