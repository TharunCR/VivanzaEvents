# 🎉 Event Management System

An all-in-one Event Management Web Application built with a robust **user–admin** structure.

- ✅ **Users** can register, login, and book event halls.
- 🛠 **Admins** have full control over users, vendors, bookings, and events.

---

## 🚀 Features

### 👤 User Features:
- Register and login with secure authentication
- View available events and vendors
- Book event halls or services
- Manage personal bookings
- Edit account profile and settings

### 🛡️ Admin Features:
- Admin login dashboard
- View all registered users and vendor accounts
- Approve or reject bookings
- Create, update, or delete events
- Manage vendor listings and event hall details
- Track system-wide analytics and reports

---

## 🛠️ Tech Stack

| Layer       | Technology       |
|-------------|------------------|
| Frontend    | HTML, CSS, JS    |
| Backend     | Java (Spring Boot / Servlet) |
| Database    | MySQL            |
| IDE         | IntelliJ / Eclipse / VS Code |
| Build Tool  | Maven / Gradle   |
| Server      | Apache Tomcat (if used) |

---

## 🔐 Authentication

- Login credentials are validated using email and password
- Sessions are used to track logged-in users
- Admins and Users are separated by `role` in the database

---

### `api_endpoints`:
- path: /login
  method: POST
  description: Authenticates users/admins/subadmins

- path: /register
  method: POST
  description: Registers a new user

- path: /admin/events
  method: GET/POST/DELETE
  description: Admin management of event halls

- path: /user/bookings
  method: GET/POST
  description: Booking endpoints for users

authors:
- name: Tharun CR
  email: crtharun20@gmail.com
  role: Developer

license: MIT

🙋‍♂️ Developer
Tharun C R
📧 crtharun20@gmail.com
📱 +91 7200098886

📄 License
This project is open-source under the MIT License.

---





