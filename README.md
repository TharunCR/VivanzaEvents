# Event Management System

## Overview

The **Event Management System** is a desktop-based application developed using **Java 17**, designed to simplify and streamline the process of managing event halls, schedules, and bookings. The application features a user-friendly GUI built with Java Swing and integrates with a MySQL database via JDBC.

A key component of the system is the inclusion of **RESPI (Responsive Event Scheduling and Planning Interface)**, which offers a dynamic and visual approach to managing event schedules.

---

## Technologies Used

- Java 17 (Java SE)
- Java Swing (GUI Framework)
- JDBC (Java Database Connectivity)
- MySQL (Relational Database)
- Git & GitHub (Version Control)
- RESPI – Responsive Event Scheduling and Planning Interface

---

## Features

### 1. Authentication
- User and Admin login/signup
- Role-based access control

### 2. Admin Functionality
- Add, update, delete event halls and event listings
- View all registered users and bookings
- Approve or reject booking requests
- Interactive dashboard with analytics
- Export data to PDF or Excel
- Manage bookings using the RESPI interface

### 3. User Functionality
- View available event halls with filters (location, date, capacity)
- Book event halls using visual slot selection (via RESPI)
- View and manage booking history
- Receive booking confirmation via email

### 4. RESPI (Responsive Event Scheduling and Planning Interface)
- Visual calendar/grid interface for scheduling
- Highlights available and unavailable time slots
- Prevents overlapping or double-booked slots
- Enhances user experience with intuitive design

### 5. Reporting & Data Visualization
- Generate reports for total bookings, popular halls, user activity
- Export data in PDF and Excel formats
- Visual insights through color-coded schedule tracking

### 6. Notification System
- Email alerts for:
  - Booking confirmation
  - Booking approval or rejection
  - Event reminders

---

## Database Design

The MySQL database includes the following normalized tables:

- `users`
- `admins`
- `events`
- `event_halls`
- `bookings`
- `notifications`

JDBC is used for connectivity and performing CRUD operations.

---

## Why Java 17?

Java 17 was chosen for its Long-Term Support (LTS) and modern features:

- Switch expressions for cleaner control flow
- Text blocks for easy multi-line SQL query writing
- Enhanced exception messages
- Improved performance and compatibility with modern JVMs

---

## Learning Outcomes

- Developed a full-featured desktop application using Java 17
- Gained experience with Java Swing for GUI development
- Implemented database operations using JDBC and MySQL
- Designed and integrated RESPI for visual event scheduling
- Practiced software versioning and collaboration using Git & GitHub

---



