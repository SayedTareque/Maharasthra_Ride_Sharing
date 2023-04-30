![Logo](https://cdn-cjmik.nitrocdn.com/UjszoEMIGzQLBmRYICliaPmdTnvQlovN/assets/images/optimized/rev-63e9e7b/wp-content/uploads/2019/10/ride-sharing-app-development-india.jpg)

# Maharashtra Rides

This repository contains SQL queries for analyzing the Maharashtra Rides dataset, which contains information about ride requests, riders, drivers, and rides completed in different zones of Maharashtra.
## Data

The Maharashtra Rides dataset is a CSV file containing data on ride requests, riders, drivers, and rides completed in different zones of Maharashtra. The dataset has the following columns:

- ID: ride ID
- ride_type: type of ride (1 for bike ride, 2 for car ride)
- created_at: date and time when the ride was requested
- pickup_lat: latitude of the pickup location
- pickup_lng: longitude of the pickup location
- pickup_zone: pickup zone
- drop_lat: latitude of the drop location
- drop_lng: longitude of the drop location
- drop_zone: drop zone
- driver_id: driver ID
- rider_id: rider ID
- Ride_Duration: duration of the ride in seconds
- Status: status of the ride (Completed, Canceled)
## SQL Queries

The following SQL queries were used to analyze the dataset:

- Zonewise Requested VS Completed trips
- Average Duration by Pickup_Zone
- Number of rides by Vehicle_Types
- Zonewise Unique Users and Unique Drivers
- Average rides per user
- Weekday VS Weekends rides
- Driver cancellation
- Rides per Driver
- Number of Served Users
- Number of Unserved users
## Findings

After analyzing the Maharashtra Rides dataset with SQL queries, we found the following insights:

- Zone 7 has the highest number of ride requests (30,542) and completed rides (26,027), while Zone 2 has the lowest number of ride requests (7,138) and completed rides (6,104).
- Zone 5 has the longest average ride duration (74.56 minutes), while Zone 2 has the shortest average ride duration (57.01 minutes).
- Zone 7 has the highest number of unique customers (17,052) and unique drivers (524), while Zone 2 has the lowest number of unique customers (4,267) and unique drivers (119).
- On average, each customer takes 6.78 rides.
- There are more rides on weekdays (57,831) than weekends (10,940).
- Driver 521 has the highest number of cancelled rides (12) among bike rides, while Driver 149 has the highest number of cancelled rides (11) among car rides.
- Zone 7 has the highest Rides per Driver (9.41), while Zone 2 has the lowest Rides per Driver (1.75).
- Zone 7 has the highest number of served users (17,052), while Zone 2 has the lowest number of served users (4,267).
- Zone 7 has the highest number of unserved users (2,476), while Zone 2 has the lowest number of unserved users (671).
