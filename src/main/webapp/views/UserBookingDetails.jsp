<%if (session.getAttribute("User_email") == null) {
        response.sendRedirect("/signin");
         } else {%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />
    <style>
        :root {
            --dark-bg: #121212;
            --card-bg: #1e1e1e;
            --accent-color: #3a3a3a;
            --text-primary: #e0e0e0;
            --text-secondary: #b0b0b0;
            --success-accent: #4CAF50;
            --warning-accent: #FFC107;
            --danger-accent: #F44336;
            --info-accent: #2196F3;
        }

        body {
            background-color: var(--dark-bg);
            color: var(--text-primary);
        }

        .booking-card {
            background-color: var(--card-bg);
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            margin-bottom: 25px;
            overflow: hidden;
        }

        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.4);
        }

        .card-header {
            background-color: var(--accent-color);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 15px 20px;
        }

        .card-title {
            font-weight: 600;
            letter-spacing: 0.5px;
            margin: 0;
        }

        .status-badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .pending {
            background-color: var(--warning-accent);
            color: #000;
        }

        .accepted {
            background-color: var(--info-accent);
            color: white;
        }

        .paid {
            background-color: var(--success-accent);
            color: white;
        }

        .cancelled {
            background-color: var(--danger-accent);
            color: white;
        }

        .widget-49-title-wrapper {
            display: flex;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .widget-49-date {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--text-primary);
            font-weight: 700;
        }

        .widget-49-meeting-info {
            flex: 1;
        }

        .widget-49-meeting-info span {
            display: block;
        }

        .widget-49-meeting-points {
            padding: 15px 0;
            list-style: none;
            margin: 0;
        }

        .widget-49-meeting-item {
            padding: 8px 0;
            border-bottom: 1px dashed rgba(255, 255, 255, 0.1);
            color: var(--text-secondary);
        }

        .widget-49-meeting-item:last-child {
            border-bottom: none;
        }

        .widget-49-meeting-item span {
            font-weight: 500;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
            padding: 15px 0 0;
        }

        .btn-pay {
            background-color: var(--success-accent);
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            font-weight: 500;
        }

        .btn-cancel {
            background-color: var(--danger-accent);
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            font-weight: 500;
        }

        .btn-bill {
            background-color: var(--info-accent);
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            font-weight: 500;
        }

        .text-highlight {
            color: var(--text-primary);
            font-weight: 600;
        }

        .navbar {
            background-color: var(--card-bg) !important;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .text-info {
            color: #4fc3f7 !important;
        }
    </style>
    <jsp:include page="includes/userNav.jsp" />

    <!-- Page Content  -->
    <div id="content">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <button type="button" id="sidebarCollapse" class="btn btn-dark">
                    <i class="fas fa-align-left"></i>
                    <span>Toggle Sidebar</span>
                </button>
                <div>
                    <h3 class="text-info">BOOKING HISTORY</h3>
                </div>
                <div>
                    <p>Welcome
                    <% if(session.getAttribute("User_gender").equals("male")){ %>
                        Mr.
                    <%}else{%>
                        Miss.
                    <%}%>
                    <span class="font-weight-bold text-info">${User_firstname} ${User_lastname}</span></p>
                </div>
            </div>
        </nav>

        <section class="booking-details">
            <div class="container" id="contentArea1"><br><br>
                <div class="row">
                    <c:forEach var="booking" items="${User_bookings}" varStatus="loop">
                        <div id="eventBooking" class="col-lg-4 col-md-6 mb-4">
                            <div class="booking-card h-100">
                                <div class="card-header">
                                    <c:if test = "${booking.accept_status==0  && booking.payment_status==0}">
                                        <h5 class="card-title"><span class="status-badge pending">Pending Approval</span></h5>
                                    </c:if>
                                    <c:if test = "${booking.accept_status==1 && booking.payment_status==0}">
                                        <h5 class="card-title"><span class="status-badge accepted">Approved - Payment Pending</span></h5>
                                    </c:if>
                                    <c:if test = "${booking.accept_status==1 && booking.payment_status==1}">
                                        <h5 class="card-title"><span class="status-badge paid">Paid & Confirmed</span></h5>
                                    </c:if>
                                    <c:if test = "${booking.accept_status==2 && booking.payment_status==0}">
                                        <h5 class="card-title"><span class="status-badge cancelled">Cancelled by Admin</span></h5>
                                    </c:if>
                                    <c:if test = "${booking.accept_status==3 && booking.payment_status==0}">
                                        <h5 class="card-title"><span class="status-badge cancelled">Cancelled by You</span></h5>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <div class="widget-49">
                                        <div class="widget-49-title-wrapper">
                                            <div class="widget-49-date">
                                                <span>${loop.index + 1}</span>
                                            </div>
                                            <div class="widget-49-meeting-info">
                                                <span class="text-highlight">${booking.hotel.hotelName}</span>
                                                <span class="text-muted">${booking.event.eventname}</span>
                                                <small class="text-muted">Booked on: ${booking.current_date}</small>
                                            </div>
                                        </div>
                                        <ul class="widget-49-meeting-points">
                                            <li class="widget-49-meeting-item"><span>Catering: </span>${booking.catering.catername}</li>
                                            <li class="widget-49-meeting-item"><span>Date: </span>${booking.event_date}</li>
                                            <li class="widget-49-meeting-item"><span>Time: </span>${booking.start_at} (${booking.max_total_hour} hrs)</li>
                                            <li class="widget-49-meeting-item"><span>Guests: </span>${booking.no_of_guest}</li>
                                            <c:if test = "${booking.photographer_name_desc != 'none'}">
                                                <li class="widget-49-meeting-item"><span>Photographer: </span>${booking.photographer_name_desc}</li>
                                            </c:if>
                                            <c:if test = "${booking.dj_name_desc != 'none'}">
                                                <li class="widget-49-meeting-item"><span>DJ: </span>${booking.dj_name_desc}</li>
                                            </c:if>
                                            <c:if test = "${booking.makeupartist_name_desc != 'none'}">
                                                <li class="widget-49-meeting-item"><span>Makeup Artist: </span>${booking.makeupartist_name_desc}</li>
                                            </c:if>
                                            <c:if test = "${booking.decorator_name_desc != 'none'}">
                                                <li class="widget-49-meeting-item"><span>Decorator: </span>${booking.decorator_name_desc}</li>
                                            </c:if>
                                            <li class="widget-49-meeting-item"><span class="text-highlight">Total: </span><i class="fa fa-inr" aria-hidden="true"></i>${booking.amount}</li>
                                        </ul>

                                        <div class="action-buttons">
                                            <c:if test = "${booking.accept_status==0  && booking.payment_status==0}">
                                                <form action="/bookcancelbyuser" method="POST">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <input type="hidden" value="${booking.id}" name="booking_id">
                                                    <button type="submit" class="btn btn-cancel" onclick='return cancelBooking()'>Cancel</button>
                                                </form>
                                            </c:if>
                                            <c:if test = "${booking.accept_status==1 && booking.payment_status==0}">
                                                <div class="d-flex">
                                                    <form action="/paytmuser" method="POST" class="mr-2">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                        <input type="hidden" value="${User_id}" name="booking_userid">
                                                        <input type="hidden" value="${booking.amount}" name="total_amt">
                                                        <input type="hidden" value="${booking.id}" name="booking_id">
                                                        <button type="submit" class="btn btn-pay">Pay Now</button>
                                                    </form>
                                                    <form action="/bookcancelbyuser" method="POST">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                        <input type="hidden" value="${booking.id}" name="booking_id">
                                                        <button type="submit" class="btn btn-cancel">Cancel</button>
                                                    </form>
                                                </div>
                                            </c:if>
                                            <c:if test = "${booking.accept_status==1 && booking.payment_status==1}">
                                                <form action="userbookingdetails/export" method="GET">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <input type="hidden" value="${booking.id}" name="booking_id">
                                                    <button type="submit" class="btn btn-bill">Download Invoice</button>
                                                </form>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </div>

<jsp:include page="includes/footer.jsp" />

<%}%>