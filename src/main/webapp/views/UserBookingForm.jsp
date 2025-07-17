<%if (session.getAttribute("User_email") == null) {
    response.sendRedirect("/signin");
} else {%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<style>
    :root {
        --dark-bg: #121212;
        --card-bg: #1e1e1e;
        --accent-color: #2a2a2a;
        --text-primary: #ffffff;
        --text-secondary: #b0b0b0;
        --primary-accent: #3f51b5;
        --success-accent: #4CAF50;
        --warning-accent: #FFC107;
        --danger-accent: #F44336;
        --info-accent: #2196F3;
    }

    body {
        background-color: var(--dark-bg);
        color: var(--text-primary);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .booking-container {
        background-color: var(--card-bg);
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        padding: 30px;
        margin-bottom: 30px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .form-control {
        background-color: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.1);
        color: var(--text-primary);
        border-radius: 4px;
        padding: 12px 15px;
        transition: all 0.3s;
        width: 100%;
    }

    .form-control:focus {
        background-color: rgba(255, 255, 255, 0.08);
        border-color: var(--primary-accent);
        box-shadow: 0 0 0 0.2rem rgba(63, 81, 181, 0.25);
        color: var(--text-primary);
    }

    .form-label {
        color: var(--text-primary);
        font-weight: 500;
        margin-bottom: 8px;
        display: block;
    }

    .btn-primary {
        background-color: var(--primary-accent);
        border: none;
        padding: 12px 24px;
        font-weight: 600;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        transition: all 0.3s;
        width: 100%;
    }

    .btn-primary:hover {
        background-color: #303f9f;
        transform: translateY(-2px);
    }

    .invoice-section {
        background-color: rgba(255, 255, 255, 0.03);
        border-radius: 8px;
        padding: 20px;
        margin: 20px 0;
        border-left: 4px solid var(--primary-accent);
    }

    .invoice-title {
        color: var(--primary-accent);
        font-weight: 600;
        margin-bottom: 20px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .invoice-item {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px dashed rgba(255, 255, 255, 0.1);
    }

    .invoice-total {
        font-weight: 600;
        font-size: 1.25rem;
        color: var(--text-primary);
        margin-top: 1rem;
    }

    .navbar {
        background-color: var(--card-bg) !important;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .text-info {
        color: #4fc3f7 !important;
    }

    select.form-control {
        appearance: none;
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23b0b0b0' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
        background-repeat: no-repeat;
        background-position: right 0.75rem center;
        background-size: 16px 12px;
        height: calc(2.25rem + 2px);
    }

    .section-title {
        color: var(--text-primary);
        font-weight: 600;
        margin-bottom: 30px;
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
        background-color: var(--primary-accent);
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .row {
        margin-left: -15px;
        margin-right: -15px;
    }

    .col-lg-6, .col-md-6, .col-lg-12 {
        padding-left: 15px;
        padding-right: 15px;
    }

    .btn-block {
        display: block;
        width: 100%;
    }

    .text-right {
        text-align: right;
    }

    .mr-3 {
        margin-right: 1rem !important;
    }

    .mt-3 {
        margin-top: 1rem !important;
    }

    .mt-4 {
        margin-top: 1.5rem !important;
    }

    .mt-5 {
        margin-top: 3rem !important;
    }

    .py-3 {
        padding-top: 1rem !important;
        padding-bottom: 1rem !important;
    }
</style>

<jsp:include page="includes/userNav.jsp" />

<!-- Page Content -->
<div id="content">
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <button type="button" id="sidebarCollapse" class="btn btn-dark">
                <i class="fas fa-align-left"></i>
                <span>Toggle Sidebar</span>
            </button>
            <div>
                <h3 class="text-info">BOOK YOUR EVENTS</h3>
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

    <div class="container">
        <section class="booking-container mt-4">
            <h3 class="section-title">Event Details</h3>
            <form action="/makeBookingForm" modelAttribute="makeBookingForm" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="user_id" value="${User_id}"/>
                <input type="hidden" name="current_date" id="current_date" value=""/>

                <div class="row">
                    <!-- User Information -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" value="${User_email}" readonly/>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="contactno" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="contactno" name="contactno" value="${User_phone}" readonly>
                        </div>
                    </div>

                    <!-- Event Date/Time -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="event_date" class="form-label">Event Date</label>
                            <input type="date" id="event_date" name="event_date" class="form-control" onchange="validatedate();" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="start_at" class="form-label">Event Start Time</label>
                            <input type="time" id="start_at" name="start_at" class="form-control" required>
                        </div>
                    </div>

                    <!-- Event Selection -->
                    <div class="col-12">
                        <div class="form-group">
                            <label for="event_book" class="form-label">Event Type</label>
                            <select id="event_book" name="event_id" class="form-control" required>
                                <option value="">Select Event Type</option>
                                <c:forEach var="eventData" items="${event_for_booking}">
                                    <option id="${eventData.id}" value="${eventData.id}">${eventData.eventname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <!-- Venue Selection -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="hotel_book" class="form-label">Venue</label>
                            <select id="hotel_book" name="hotel_id" class="form-control" required>
                                <option value="">Select Venue</option>
                                <c:forEach var="hotelData" items="${hotel_for_booking}">
                                    <option id="${hotelData.id}" value="${hotelData.id}">${hotelData.hotelName} (₹${hotelData.price}/hr)</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <!-- Catering Selection -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="catering_book" class="form-label">Catering Service</label>
                            <select id="catering_book" name="catering_id" class="form-control" required>
                                <option value="">Select Catering Service</option>
                                <c:forEach var="caterData" items="${catering_for_booking}">
                                    <option id="${caterData.id}" value="${caterData.id}">${caterData.catername} (₹${caterData.cater_price}/person)</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <!-- Event Duration -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="event_maxhour" class="form-label">Event Duration</label>
                            <select id="event_maxhour" name="max_total_hour" class="form-control" required>
                                <option value="">Select Duration</option>
                                <option value="2">2 hours</option>
                                <option value="4">4 hours</option>
                                <option value="6">6 hours</option>
                                <option value="8">8 hours</option>
                                <option value="10">10 hours</option>
                                <option value="12">12 hours</option>
                                <option value="14">14 hours</option>
                                <option value="16">16 hours</option>
                                <option value="18">18 hours</option>
                                <option value="20">20 hours</option>
                                <option value="22">22 hours</option>
                                <option value="24">24 hours</option>
                            </select>
                        </div>
                    </div>

                    <!-- Guest Count -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="no_of_guest" class="form-label">Number of Guests</label>
                            <input type="number" id="no_of_guest" name="no_of_guest" class="form-control" min="1" required>
                        </div>
                    </div>

                    <!-- Vendor Services -->
                    <div class="col-12">
                        <h4 class="section-title mt-5">Additional Services</h4>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="photo_book" class="form-label">Photographer</label>
                            <select id="photo_book" name="photographer_name_desc" class="form-control" required>
                                <option value="">Select Photographer</option>
                                <c:forEach var="vendorData" items="${vendor_for_booking}">
                                    <c:if test = "${vendorData.vendor_desc == 'Photographer'}">
                                        <option id="${vendorData.id}" value="${vendorData.vendorname}(${vendorData.id})">${vendorData.vendorname} - ₹${vendorData.vendor_price}</option>
                                    </c:if>
                                </c:forEach>
                                <option id="photo_none" value="none">None</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="dj_book" class="form-label">Disc Jockey</label>
                            <select id="dj_book" name="dj_name_desc" class="form-control" required>
                                <option value="">Select DJ</option>
                                <c:forEach var="vendorData" items="${vendor_for_booking}">
                                    <c:if test = "${vendorData.vendor_desc == 'DJ'}">
                                        <option id="${vendorData.id}" value="${vendorData.vendorname}(${vendorData.id})">${vendorData.vendorname} - ₹${vendorData.vendor_price}</option>
                                    </c:if>
                                </c:forEach>
                                <option id="dj_none" value="none">None</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="makeup_book" class="form-label">Makeup Artist</label>
                            <select id="makeup_book" name="makeupartist_name_desc" class="form-control" required>
                                <option value="">Select Makeup Artist</option>
                                <c:forEach var="vendorData" items="${vendor_for_booking}">
                                    <c:if test = "${vendorData.vendor_desc == 'Makeupartisit'}">
                                        <option id="${vendorData.id}" value="${vendorData.vendorname}(${vendorData.id})">${vendorData.vendorname} - ₹${vendorData.vendor_price}</option>
                                    </c:if>
                                </c:forEach>
                                <option id="makeup_none" value="none">None</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="decorator_book" class="form-label">Decorator</label>
                            <select id="decorator_book" name="decorator_name_desc" class="form-control" required>
                                <option value="">Select Decorator</option>
                                <c:forEach var="vendorData" items="${vendor_for_booking}">
                                    <c:if test = "${vendorData.vendor_desc == 'Decorator'}">
                                        <option id="${vendorData.id}" value="${vendorData.vendorname}(${vendorData.id})">${vendorData.vendorname} - ₹${vendorData.vendor_price}</option>
                                    </c:if>
                                </c:forEach>
                                <option id="decorator_none" value="none">None</option>
                            </select>
                        </div>
                    </div>

                    <!-- Invoice Section -->
                    <div class="col-12">
                        <div class="invoice-section">
                            <h5 class="invoice-title">Booking Summary</h5>

                            <div class="invoice-item">
                                <span>Venue Cost:</span>
                                <span id="hotel_price">₹0</span>
                            </div>
                            <div class="invoice-item">
                                <span>Catering Cost:</span>
                                <span id="catering_price">₹0</span>
                            </div>
                            <div class="invoice-item">
                                <span>Additional Services:</span>
                                <span id="total_amt_vendor">₹0</span>
                            </div>
                            <div class="invoice-item">
                                <span>Duration:</span>
                                <span id="hours">0 hours</span>
                            </div>
                            <div class="invoice-item">
                                <span>Number of Guests:</span>
                                <span id="guest">0</span>
                            </div>

                            <div class="text-right mt-4">
                                <button type="button" class="btn btn-outline-primary mr-3" onclick="calc();">
                                    Calculate Total
                                </button>

                                <div class="invoice-total">
                                    Total Amount: <span id="amt">₹0</span>
                                    <input type="hidden" id="amount" name="amount" value="0">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="col-12 mt-4">
                        <button type="submit" class="btn btn-primary btn-block py-3" name="adduser" onclick="return calc();">
                            <span class="font-weight-bold">CONFIRM BOOKING</span>
                        </button>
                    </div>
                </div>
            </form>
        </section>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">
// Set current date
var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0');
var yyyy = today.getFullYear();
today = yyyy + '-' + mm + '-' + dd;
document.getElementById("current_date").value = today;
document.getElementById("event_date").min = today;

// Initialize variables
var hotel_amt = 0, catering_amt = 0, vendor_amt = 0, no_of_guest = 1, no_of_hours = 1, photo = 0, makeup = 0, dj = 0, deco = 0;

// Set up event listeners
$('#hotel_book').change(testMessage);
$('#catering_book').change(testMessage2);
$('#event_maxhour').change(textMessage3);
$('#photo_book').change(textMessage5);
$('#dj_book').change(textMessage6);
$('#makeup_book').change(textMessage7);
$('#decorator_book').change(textMessage8);
$("#no_of_guest").on('input', textMessage4);

// Hotel selection handler
function testMessage() {
    var id = $(this).children(":selected").attr("id");
    var hotel_name = "";

    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/hotelbookfind/" + id,
        success: function(hotel) {
            hotel_amt = hotel.price;
            hotel_name = hotel.hotelName;
            $('#hotel_price').text('₹' + hotel_amt + '/hr');
        }
    });

    var e_date = $("#event_date").val();
    if (e_date) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hotelbookingfind/" + id,
            success: function(book) {
                for (let i = 0; i < book.length; i++) {
                    if (e_date == book[i].event_date) {
                        Swal.fire({
                            title: "Venue Not Available",
                            text: `${hotel_name} is already booked on ${e_date}. Please choose another venue.`,
                            icon: "error",
                            confirmButtonColor: "#3f51b5"
                        });
                        $("#hotel_book").val("");
                    }
                }
            }
        });
    }
}

// Catering selection handler
function testMessage2() {
    var id = $(this).children(":selected").attr("id");
    var cater_name = "";

    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/cateringbookfind/" + id,
        success: function(cater) {
            catering_amt = cater.cater_price;
            cater_name = cater.catername;
            $('#catering_price').text('₹' + catering_amt + '/person');
        }
    });

    var e_date = $("#event_date").val();
    if (e_date) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/cateringbookingfind/" + id,
            success: function(book) {
                for (let i = 0; i < book.length; i++) {
                    if (e_date == book[i].event_date) {
                        Swal.fire({
                            title: "Catering Not Available",
                            text: `${cater_name} is already booked on ${e_date}. Please choose another caterer.`,
                            icon: "error",
                            confirmButtonColor: "#3f51b5"
                        });
                        $("#catering_book").val("");
                    }
                }
            }
        });
    }
}

// Event duration handler
function textMessage3() {
    no_of_hours = $(this).children(":selected").val();
    $("#hours").text(no_of_hours + ' hours');
}

// Guest count handler
function textMessage4() {
    no_of_guest = $("#no_of_guest").val();
    $("#guest").text(no_of_guest);
}

// Photographer selection handler
function textMessage5() {
    var id = $(this).children(":selected").attr("id");

    if (id == "photo_none") {
        photo = 0;
    } else {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/vendorbookfind/" + id,
            success: function(Photographer) {
                photo = Photographer.vendor_price;
                var photo_name_id = $("#" + id + "").val();

                var e_date = $("#event_date").val();
                if (e_date) {
                    $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/photobookingfind/" + photo_name_id,
                        success: function(photobook) {
                            for (let i = 0; i < photobook.length; i++) {
                                if (e_date == photobook[i].event_date) {
                                    Swal.fire({
                                        title: "Photographer Not Available",
                                        text: `This photographer is already booked on ${e_date}. Please choose another.`,
                                        icon: "error",
                                        confirmButtonColor: "#3f51b5"
                                    });
                                    $("#photo_book").val("");
                                }
                            }
                        }
                    });
                }
            }
        });
    }
}

// DJ selection handler
function textMessage6() {
    var id = $(this).children(":selected").attr("id");

    if (id == "dj_none") {
        dj = 0;
    } else {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/vendorbookfind/" + id,
            success: function(d_j) {
                dj = d_j.vendor_price;
                var dj_name_id = $("#" + id + "").val();

                var e_date = $("#event_date").val();
                if (e_date) {
                    $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/djbookingfind/" + dj_name_id,
                        success: function(djbook) {
                            for (let i = 0; i < djbook.length; i++) {
                                if (e_date == djbook[i].event_date) {
                                    Swal.fire({
                                        title: "DJ Not Available",
                                        text: `This DJ is already booked on ${e_date}. Please choose another.`,
                                        icon: "error",
                                        confirmButtonColor: "#3f51b5"
                                    });
                                    $("#dj_book").val("");
                                }
                            }
                        }
                    });
                }
            }
        });
    }
}

// Makeup artist selection handler
function textMessage7() {
    var id = $(this).children(":selected").attr("id");

    if (id == "makeup_none") {
        makeup = 0;
    } else {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/vendorbookfind/" + id,
            success: function(makeup_art) {
                makeup = makeup_art.vendor_price;
                var makeup_name_id = $("#" + id + "").val();

                var e_date = $("#event_date").val();
                if (e_date) {
                    $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/makeupbookingfind/" + makeup_name_id,
                        success: function(makeupbook) {
                            for (let i = 0; i < makeupbook.length; i++) {
                                if (e_date == makeupbook[i].event_date) {
                                    Swal.fire({
                                        title: "Makeup Artist Not Available",
                                        text: `This artist is already booked on ${e_date}. Please choose another.`,
                                        icon: "error",
                                        confirmButtonColor: "#3f51b5"
                                    });
                                    $("#makeup_book").val("");
                                }
                            }
                        }
                    });
                }
            }
        });
    }
}

// Decorator selection handler
function textMessage8() {
    var id = $(this).children(":selected").attr("id");

    if (id == "decorator_none") {
        deco = 0;
    } else {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/vendorbookfind/" + id,
            success: function(decorator) {
                deco = decorator.vendor_price;
                var deco_name_id = $("#" + id + "").val();

                var e_date = $("#event_date").val();
                if (e_date) {
                    $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/decoratorbookingfind/" + deco_name_id,
                        success: function(decobook) {
                            for (let i = 0; i < decobook.length; i++) {
                                if (e_date == decobook[i].event_date) {
                                    Swal.fire({
                                        title: "Decorator Not Available",
                                        text: `This decorator is already booked on ${e_date}. Please choose another.`,
                                        icon: "error",
                                        confirmButtonColor: "#3f51b5"
                                    });
                                    $("#decorator_book").val("");
                                }
                            }
                        }
                    });
                }
            }
        });
    }
}

// Calculate total amount
function calc() {
    var hotel = no_of_hours * hotel_amt;
    var cater = no_of_guest * catering_amt;
    var vendor = photo + dj + makeup + deco;
    var result = hotel + cater + vendor;

    $('#total_amt_vendor').text('₹' + vendor);
    $('#amt').text('₹' + result);
    $('#amount').val(result);

    return true;
}

// Validate date selection
function validatedate() {
    var selectedDate = new Date($('#event_date').val());
    var today = new Date();
    today.setHours(0, 0, 0, 0);

    if (selectedDate < today) {
        Swal.fire({
            title: "Invalid Date",
            text: "Please select a valid date from today onwards",
            icon: "error",
            confirmButtonColor: "#3f51b5"
        });
        $('#event_date').val('');
        return false;
    }
    return true;
}
</script>

<jsp:include page="includes/footer.jsp" />

<%}%>