Event Management System – Project Overview
Technologies Used:
Java 17 (Java SE)

Java Swing (GUI Framework)

JDBC (Java Database Connectivity)

MySQL (Relational Database)

Git & GitHub (Version Control)

RESPI – Responsive Event Scheduling and Planning Interface

Project Description:
The Event Management System is a desktop-based application developed using Java 17, designed to simplify the coordination and management of event halls, schedules, and user bookings.

This system uses Java Swing for building an interactive graphical user interface, MySQL for data storage, and JDBC for database connectivity. A key feature of this application is the integration of RESPI (Responsive Event Scheduling and Planning Interface), a custom interface developed to enhance scheduling, planning, and user interaction with event slots and bookings.

Key Modules and Features:
1. Authentication Module:
Login and Sign-up functionality for Admins and Users.

Role-based access control and dashboard navigation.

2. Admin Panel:
Add, update, and delete event halls and event listings.

View and manage all bookings submitted by users.

Approve or reject event booking requests.

Access dashboard analytics for event statistics.

Export data to PDF or Excel files.

Use of RESPI interface for real-time event slot visualization and schedule control.

3. User Panel:
Search and filter available event halls by date, location, or capacity.

Book an event slot using a visual scheduler (RESPI).

View and manage current and past bookings.

Receive email confirmation after booking approval.

4. RESPI – Responsive Event Scheduling and Planning Interface:
Displays event schedules on a visual calendar or grid layout.

Allows users to select available time slots efficiently.

Highlights conflicts or overlapping bookings.

Helps admins plan and allocate event slots more intuitively.

5. Reporting and Data Visualization:
Generate reports showing booking statistics, usage trends, and user activity.

Export reports as PDF or Excel.

Color-coded scheduling visualization through RESPI for easier tracking.

6. Notifications:
Automated email alerts for:

Booking confirmations

Admin responses

Event reminders or cancellations

Database Design:
MySQL is used to store and manage data with tables such as:

users

admins

events

bookings

event_halls

notifications

The database is normalized and connected through foreign key constraints to maintain data integrity.

Conclusion:
The Event Management System is a feature-rich desktop application that demonstrates proficiency in software development using Java 17. With the addition of the RESPI interface, it not only manages backend logic and database operations effectively but also focuses on improving user experience through intuitive scheduling and planning features.
