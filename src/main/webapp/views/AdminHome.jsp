<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%>
<jsp:include page="includes/header.jsp" />

	<jsp:include page="includes/adminNav.jsp" />

	<style>
    body {
      background-color: #121212;
      color: #e0e0e0;
    }

    .card {
      background-color: #1e1e1e;
      border: 1px solid #333;
      color: #e0e0e0;
      transition: all 0.3s cubic-bezier(.25,.8,.25,1);
    }

    .card:hover {
      transform: scale(1.05);
      box-shadow: 0 10px 20px rgba(255, 255, 255, 0.1), 0 4px 8px rgba(255, 255, 255, 0.08);
      transition: 0.3s ease-in-out;
      cursor: pointer;
      border: 1px solid #555;
    }

    .navbar {
      background-color: #1e1e1e !important;
      border-bottom: 1px solid #333;
    }

    .btn-info {
      background-color: #333;
      border-color: #444;
      color: #fff;
    }

    .btn-info:hover {
      background-color: #444;
      border-color: #555;
    }

    .text-info {
      color: #4fc3f7 !important;
    }

    .grey-bg {
      background-color: #121212 !important;
    }

    h4, p {
      color: #e0e0e0;
    }

    .success {
      color: #81c784 !important;
    }

    .danger {
      color: #e57373 !important;
    }

    .warning {
      color: #ffb74d !important;
    }

    .primary {
      color: #64b5f6 !important;
    }

    .secondary {
      color: #ba68c8 !important;
    }

    .info {
      color: #4dd0e1 !important;
    }

    .fa-users, .fa-concierge-bell, .fa-birthday-cake,
    .fa-french-fries, .fa-user-hard-hat, .fa-calendar-check,
    .fab, .fal, .fad {
      filter: drop-shadow(0 0 4px rgba(255, 255, 255, 0.2));
    }

    .media-body span {
      color: #b0b0b0;
    }

    /* Glow effect on hover for icons */
    .card:hover .fa-users,
    .card:hover .fa-concierge-bell,
    .card:hover .fa-birthday-cake,
    .card:hover .fa-french-fries,
    .card:hover .fa-user-hard-hat,
    .card:hover .fa-calendar-check,
    .card:hover .fab,
    .card:hover .fal,
    .card:hover .fad {
      filter: drop-shadow(0 0 8px currentColor);
      transition: filter 0.3s ease;
    }

    /* Smooth fade-in for the whole page */
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

    body {
      animation: fadeIn 0.5s ease-in;
    }
    </style>
	    <!-- Page Content  -->
        <div id="content">

             <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                   <div>
                    	<h3 class="text-info">ADMIN DASHBOARD</h3>
                    </div>
                   <div>
                    	<p>Welcome
                    	<% if(session.getAttribute("Admin_gender").equals("male")){ %>
                    		Mr.
                    	<%}else{%>
                    		Miss.
                    	<%}%>
                    	<span class="font-weight-bold text-info">${Admin_firstname} ${Admin_lastname}</span></p>
                    </div>
                </div>
            </nav>

<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">


<div class="grey-bg container-fluid">
  <section id="minimal-statistics">
    <div class="row">
      <div class="col-12 mt-3 mb-1">
        <h4 class="text-uppercase">Minimal Statistics Cards</h4>
        <p>Statistics on minimal cards.</p>
      </div>
    </div>
    <div class="row">
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="align-self-center">
                  <i class="fas fa-users primary fa-3x"></i>
                </div>
                <div class="media-body text-right">
                  <h3 class="success">${admin_user_count}</h3>
                  <span>Total Users</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="align-self-center">
                  <i class="fas fa-concierge-bell warning fa-3x"></i>
                </div>
                <div class="media-body text-right">
                  <h3 class="danger">${admin_hotel_count}</h3>
                  <span>Total Hotels</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="align-self-center">
                  <i class="fas fa-birthday-cake success fa-3x"></i>
                </div>
                <div class="media-body text-right">
                  <h3 class="primary">${admin_event_count}</h3>
                  <span>Total Events</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="align-self-center">
                  <i class="fas fa-french-fries danger fa-3x"></i>
                </div>
                <div class="media-body text-right">
                  <h3 class="warning">${admin_catering_count}</h3>
                  <span>Total Caterings</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="danger">${admin_vendor_count}</h3>
                  <span>Total Vendors</span>
                </div>
                <div class="align-self-center">
                  <i class="far fa-user-hard-hat fa-3x" style="color: #ffb74d;"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="success">${admin_booking_count}</h3>
                  <span>Total Booking</span>
                </div>
                <div class="align-self-center">
                  <i class="fas fa-calendar-check info fa-3x"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

       <div class="col-xl-3 col-sm-6 col-12">
      <div class="card">
        <div class="card-content">
          <div class="card-body">
            <div class="media d-flex">
              <div class="media-body text-left">
                <h3 class="warning">${admin_bookingpending_count}</h3>
                <span>Pending Bookings</span>
              </div>
              <div class="align-self-center">
                <i class="fal fa-calendar-check info fa-3x"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="warning">${admin_bookingpaid_count}</h3>
                  <span>Paid Bookings</span>
                </div>
                <div class="align-self-center">
                  <i class="fab fa-paypal secondary fa-3x"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="primary">${admin_bookingunpaid_count}</h3>
                  <span>UnPaid Bookings</span>
                </div>
                <div class="align-self-center">
                  <i class="fab fa-amazon-pay primary fa-3x"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="row">
      <div class="col-xl-3 col-sm-6 col-12">
      <div class="card">
        <div class="card-content">
          <div class="card-body">
            <div class="media d-flex">
              <div class="media-body text-left">
                <h3 class="warning">${admin_bookingcancelbyadmin_count}</h3>
                <span>Bookings Cancelled by Admin</span>
              </div>
              <div class="align-self-center">
                <i class="fal fa-calendar-check warning fa-3x"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-xl-3 col-sm-6 col-12">
      <div class="card">
        <div class="card-content">
          <div class="card-body">
            <div class="media d-flex">
              <div class="media-body text-left">
                <h3 class="danger">${admin_bookingcancelbyuser_count}</h3>
                <span>Bookings Cancelled by User</span>
              </div>
              <div class="align-self-center">
                <i class="fad fa-calendar-check danger fa-3x"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</div>

<jsp:include page="includes/footer.jsp" />
<%}%>