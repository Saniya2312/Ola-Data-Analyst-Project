Create database Ola;
Use Ola;

# 1. Retrieve all successful bookings:
Create View successful_bookings as
Select * from Ola.bookings where Booking_Status = 'Success';
    # Answer
Select * from successful_bookings;

# 2. Find the average ride distance for each vehicle type:
Create view average_ride_distance_for_each_vehicle as
Select Vehicle_Type, avg(Ride_Distance) as Avg_Distance from Ola.bookings
group by(Vehicle_Type);
    # Answers:
select * from average_ride_distance_for_each_vehicle;

# 3. Get the total number of cancelled rides by customers:
Create view cancelled_rides_by_customers as
Select count(*) from Ola.bookings where Booking_Status = 'Canceled by Customer';
   # Answers
SELECT * FROM classicmodels.cancelled_rides_by_customers;

# 4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers As
select Customer_ID, count(Booking_ID) as Total_Rides from Ola.bookings
group by(Customer_ID)
order by(Total_Rides) desc limit 5;
   # Answers:
select * from Top_5_Customers;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 Create View Rides_cancelled_by_Drivers_P_C_Issues As
Select Count(*) from Ola.bookings where Canceled_Rides_by_Driver = 'Personal & Car related issue';
     # Answers:
Select * from Rides_cancelled_by_Drivers_P_C_Issues;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
Select max(Driver_Ratings),min(Driver_Ratings) from Ola.bookings where Vehicle_Type = 'Prime Sedan'; 
    #Answer:
Select * from  Max_Min_Driver_Rating;

# 7. Retrieve all rides where payment was made using UPI:
 Create View UPI_Payment AS
select * from Ola.bookings where Payment_Method = 'UPI';
    # Answer
Select * from UPI_Payment;

# 8. Find the average customer rating per vehicle type:
 Create View AVG_Cust_Rating As
Select Vehicle_Type, avg(Customer_Rating) as Customer_avg_Rating from Ola.bookings
group by(Vehicle_Type);
    # Answer
Select * from AVG_Cust_Rating;

# 9. Calculate the total booking value of rides completed successfully:
 Create View total_successful_ride_value As
Select sum(Booking_Value) as Total_Booking_Value from Ola.bookings where Booking_Status = 'Success';
   # Answers:
Select * from total_successful_ride_value;

# 10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
Select Booking_ID, Incomplete_Rides_Reason from Ola.bookings where Incomplete_Rides = 'Yes';
   #Answer
Select * from Incomplete_Rides_Reason;
