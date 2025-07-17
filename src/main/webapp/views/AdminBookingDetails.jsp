<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="includes/header.jsp" />

<jsp:include page="includes/adminNav.jsp" />

<!-- Page Content  -->
<div id="content" class="dark-theme">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
                <i class="fas fa-align-left"></i>
                <span>Toggle Sidebar</span>
            </button>
            <div>
                <h3 class="text-light">ADMIN BOOKINGDETAILS</h3>
            </div>
            <div>
                <p class="text-muted mb-0">Welcome
                <% if(session.getAttribute("Admin_gender").equals("male")){ %>
                    Mr.
                <%}else{%>
                    Miss.
                <%}%>
                <span class="font-weight-bold text-white">${Admin_firstname} ${Admin_lastname}</span></p>
            </div>
        </div>
    </nav>

    <div class="container-fluid px-4 py-3">
        <div class="d-flex justify-content-between mb-4">
            <div></div> <!-- Empty div for spacing -->

            <form>
                <a href="/downloadExcel" class="btn btn-success">
                    <i class="fas fa-file-excel"></i> Download Report
                </a>
            </form>
        </div>

        <div class="mb-3">
            <label class="text-light">Select No.of.rows to display:</label>
            <select class="form-control bg-dark text-light border-dark" name="state" id="maxRows">
                <option value="5000">Show ALL Rows</option>
                <option value="5">5</option>
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="20">20</option>
                <option value="50">50</option>
                <option value="70">70</option>
                <option value="100">100</option>
            </select>
        </div>

        <div class="table-responsive">
            <table class="table table-dark table-hover" id="table-id">
                <thead>
                    <tr>
                        <th>USER_NAME</th>
                        <th>USER_EMAIL</th>
                        <th>HOTEL_NAME</th>
                        <th>EVENT_NAME</th>
                        <th>CATERING_NAME</th>
                        <th>PHOTOGRAPHER_NAME</th>
                        <th>DJ_NAME</th>
                        <th>MAKEUPARTIST_NAME</th>
                        <th>DECORATOR_NAME</th>
                        <th>EVENT_DATE</th>
                        <th>EVENT_BOOKED_ON</th>
                        <th>EVENT_START_TIME</th>
                        <th>MAX_TIME_EVENT</th>
                        <th>NO_OF_GUEST</th>
                        <th>STATUS</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="allbooking" items="${admin_booking}">
                        <tr>
                            <td>${allbooking.user.firstName} ${allbooking.user.lastName}</td>
                            <td>${allbooking.user.email}</td>
                            <td>${allbooking.hotel.hotelName}</td>
                            <td>${allbooking.event.eventname}</td>
                            <td>${allbooking.catering.catername}</td>
                            <td>${allbooking.photographer_name_desc}</td>
                            <td>${allbooking.dj_name_desc}</td>
                            <td>${allbooking.makeupartist_name_desc}</td>
                            <td>${allbooking.decorator_name_desc}</td>
                            <td>${allbooking.event_date}</td>
                            <td>${allbooking.current_date}</td>
                            <td>${allbooking.start_at}</td>
                            <td>${allbooking.max_total_hour} hours</td>
                            <td>${allbooking.no_of_guest}</td>
                            <td class="d-flex">
                                <c:if test="${allbooking.accept_status==0 && allbooking.payment_status==0}">
                                    <span class="badge badge-warning">Pending</span>
                                </c:if>
                                <c:if test="${allbooking.accept_status==1 && allbooking.payment_status==0}">
                                    <span class="badge badge-primary">Booking Accepted</span>
                                </c:if>
                                <c:if test="${allbooking.accept_status==1 && allbooking.payment_status==1}">
                                    <span class="badge badge-success">Paid</span>
                                </c:if>
                                <c:if test="${allbooking.accept_status==2 && allbooking.payment_status==0}">
                                    <span class="badge badge-danger">Cancelled by you</span>
                                </c:if>
                                <c:if test="${allbooking.accept_status==3 && allbooking.payment_status==0}">
                                    <span class="badge badge-danger">Cancelled by user</span>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${allbooking.accept_status==0 && allbooking.payment_status==0}">
                                    <div class="d-flex">
                                        <form action="/bookacceptbyadmin" method="POST">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <input type="hidden" value="${allbooking.id}" name="booking_id">
                                            <button type="submit" class="btn btn-sm btn-success mr-2">
                                                <i class="fas fa-check"></i> Accept
                                            </button>
                                        </form>
                                        <form action="/bookcancelbyadmin" method="POST">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <input type="hidden" value="${allbooking.id}" name="booking_id">
                                            <button type="submit" class="btn btn-sm btn-danger" onclick='return cancelBooking()'>
                                                <i class="fas fa-times"></i> Cancel
                                            </button>
                                        </form>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class='pagination-container mt-4'>
            <nav>
                <ul class="pagination pagination-dark">
                    <li class="page-item" style="cursor:pointer;" data-page="prev">
                        <span class="page-link"> < <span class="sr-only">(current)</span></span>
                    </li>
                    <li class="page-item" style="cursor:pointer;" data-page="next" id="prev">
                        <span class="page-link"> > <span class="sr-only">(current)</span></span>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<style>
    .dark-theme {
        background-color: #1a1a1a;
        color: #e0e0e0;
        min-height: 100vh;
    }

    .dark-theme .table {
        color: #e0e0e0;
        background-color: #2d2d2d;
    }

    .dark-theme .table-dark {
        background-color: #2d2d2d;
    }

    .dark-theme .table-dark thead th {
        background-color: #212121;
        border-color: #454d55;
    }

    .dark-theme .table-hover tbody tr:hover {
        background-color: #3d3d3d;
    }

    .dark-theme .form-control {
        background-color: #2d2d2d;
        border-color: #444;
        color: #e0e0e0;
    }

    .dark-theme .form-control:focus {
        background-color: #2d2d2d;
        color: #e0e0e0;
        border-color: #555;
        box-shadow: 0 0 0 0.2rem rgba(100, 100, 100, 0.25);
    }

    .dark-theme .badge {
        color: white;
    }

    .dark-theme .badge-warning {
        background-color: #d39e00;
    }

    .dark-theme .badge-primary {
        background-color: #007bff;
    }

    .dark-theme .badge-success {
        background-color: #28a745;
    }

    .dark-theme .badge-danger {
        background-color: #dc3545;
    }

    .dark-theme .pagination-dark .page-link {
        background-color: #2d2d2d;
        border-color: #444;
        color: #e0e0e0;
    }

    .dark-theme .pagination-dark .page-item.disabled .page-link {
        background-color: #2d2d2d;
        border-color: #444;
        color: #6c757d;
    }

    .dark-theme .pagination-dark .page-item.active .page-link {
        background-color: #007bff;
        border-color: #007bff;
    }

    .dark-theme .text-muted {
        color: #9e9e9e !important;
    }
</style>

<script>
    // Enhanced cancel booking confirmation
    function cancelBooking() {
        return confirm('Are you sure you want to cancel this booking? This action cannot be undone.');
    }

    // Apply dark theme to the entire page
    document.addEventListener('DOMContentLoaded', function() {
        document.body.classList.add('dark-theme');
    });
</script>

<jsp:include page="includes/footer.jsp" />
<%}%>