<%if (session.getAttribute("User_email") == null) {response.sendRedirect("/signin"); } else {%>
<jsp:include page="includes/header.jsp" />

    <jsp:include page="includes/userNav.jsp" />

    <style>
        :root {
            --dark-bg: #121212;
            --card-bg: #1e1e1e;
            --accent-color: #2a2a2a;
            --text-light: #f5f5f5;
            --text-muted: #b0b0b0;
            --hover-effect: rgba(255, 255, 255, 0.03);
            --card-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --card-hover-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        body {
            background-color: var(--dark-bg);
            color: var(--text-light);
        }

        .card {
            background-color: var(--card-bg);
            border: none;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-shadow: var(--card-shadow);
            color: var(--text-light);
            position: relative;
            border-left: 4px solid transparent;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: var(--card-hover-shadow);
            border-left-color: #4a90e2;
        }

        .card-body {
            padding: 1.5rem;
        }

        .stat-icon-container {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            background: linear-gradient(135deg, rgba(74,144,226,0.15) 0%, rgba(74,144,226,0) 100%);
        }

        .stat-icon {
            font-size: 1.75rem;
            color: #4a90e2;
        }

        .navbar {
            background-color: var(--card-bg) !important;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
            padding: 0.8rem 1rem;
        }

        .btn-info {
            background-color: #4a90e2;
            border-color: #4a90e2;
        }

        .text-info {
            color: #4a90e2 !important;
        }

        h3, h4 {
            font-weight: 600;
        }

        .media-body span {
            color: var(--text-muted);
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .media-body h3 {
            font-weight: 700;
            margin-bottom: 0.3rem;
            font-size: 1.8rem;
        }

        #content {
            background-color: var(--dark-bg);
            padding: 2rem;
        }

        .success { color: #4CAF50 !important; }
        .danger { color: #F44336 !important; }
        .warning { color: #FFC107 !important; }
        .primary { color: #4a90e2 !important; }
        .info { color: #00BCD4 !important; }
        .secondary { color: #9E9E9E !important; }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .welcome-message {
            background-color: var(--card-bg);
            padding: 0.75rem 1.5rem;
            border-radius: 30px;
            box-shadow: var(--card-shadow);
        }

        .section-title {
            color: var(--text-light);
            font-weight: 600;
            letter-spacing: 1px;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 10px;
        }

        .section-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, #4a90e2 0%, rgba(74,144,226,0) 100%);
        }

        .section-description {
            color: var(--text-muted);
            margin-bottom: 2rem;
        }
    </style>

    <!-- Page Content -->
    <div id="content">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i>
                    <span>Toggle Menu</span>
                </button>
                <div class="dashboard-header">
                    <h3 class="text-light mb-0">USER DASHBOARD</h3>
                    <div class="welcome-message">
                        <p class="mb-0">Welcome
                        <% if(session.getAttribute("User_gender").equals("male")) { %>
                            Mr.
                        <% } else { %>
                            Miss.
                        <% } %>
                        <span class="font-weight-bold text-primary">${User_firstname} ${User_lastname}</span></p>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container-fluid mt-4">
            <section id="user-statistics">
                <div class="row">
                    <div class="col-12">
                        <h4 class="section-title">YOUR ACTIVITY SUMMARY</h4>
                        <p class="section-description">Overview of your recent interactions and bookings</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-3 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex align-items-center">
                                        <div class="stat-icon-container">
                                            <i class="fas fa-concierge-bell stat-icon warning"></i>
                                        </div>
                                        <div class="media-body text-right">
                                            <h3 class="text-light">${user_hotel_count}</h3>
                                            <span>Hotels Viewed</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex align-items-center">
                                        <div class="stat-icon-container">
                                            <i class="fas fa-birthday-cake stat-icon success"></i>
                                        </div>
                                        <div class="media-body text-right">
                                            <h3 class="text-light">${user_event_count}</h3>
                                            <span>Events Planned</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex align-items-center">
                                        <div class="stat-icon-container">
                                            <i class="fas fa-utensils stat-icon danger"></i>
                                        </div>
                                        <div class="media-body text-right">
                                            <h3 class="text-light">${user_catering_count}</h3>
                                            <span>Catering Services</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex align-items-center">
                                        <div class="media-body text-left">
                                            <h3 class="text-light">${user_vendor_count}</h3>
                                            <span>Vendors Contacted</span>
                                        </div>
                                        <div class="stat-icon-container">
                                            <i class="fas fa-user-tie stat-icon" style="color: orange;"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-12">
                        <h4 class="section-title">BOOKING DETAILS</h4>
                        <p class="section-description">Your current booking status and history</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-3 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex align-items-center">
                                        <div class="media-body text-left">
                                            <h3 class="text-light">${user_booking_count}</h3>
                                            <span>Total Bookings</span>
                                        </div>
                                        <div class="stat-icon-container">
                                            <i class="fas fa-calendar-check stat-icon info"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex align-items-center">
                                        <div class="media-body text-left">
                                            <h3 class="text-light">${user_bookingpaid_count}</h3>
                                            <span>Paid Bookings</span>
                                        </div>
                                        <div class="stat-icon-container">
                                            <i class="fas fa-check-circle stat-icon success"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex align-items-center">
                                        <div class="media-body text-left">
                                            <h3 class="text-light">${user_bookingpending_count}</h3>
                                            <span>Pending Bookings</span>
                                        </div>
                                        <div class="stat-icon-container">
                                            <i class="fas fa-hourglass-half stat-icon warning"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex align-items-center">
                                        <div class="media-body text-left">
                                            <h3 class="text-light">${user_bookingunpaid_count}</h3>
                                            <span>Unpaid Bookings</span>
                                        </div>
                                        <div class="stat-icon-container">
                                            <i class="fas fa-exclamation-circle stat-icon danger"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-xl-3 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex align-items-center">
                                        <div class="media-body text-left">
                                            <h3 class="text-light">${user_bookingcancelbyadmin_count}</h3>
                                            <span>Cancelled by Admin</span>
                                        </div>
                                        <div class="stat-icon-container">
                                            <i class="fas fa-user-shield stat-icon danger"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex align-items-center">
                                        <div class="media-body text-left">
                                            <h3 class="text-light">${user_bookingcancelbyuser_count}</h3>
                                            <span>Cancelled by You</span>
                                        </div>
                                        <div class="stat-icon-container">
                                            <i class="fas fa-user-times stat-icon secondary"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
<% } %>