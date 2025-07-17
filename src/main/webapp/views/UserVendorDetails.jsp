<%if (session.getAttribute("User_email") == null) {
       response.sendRedirect("/signin");
        } else {%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />
    <style>
        :root {
            --primary-dark: #121212;
            --secondary-dark: #1e1e1e;
            --accent-color: #e0e0e0;
            --highlight: #ffffff;
            --text-muted: #b0b0b0;
            --info-color: #4fc3f7;
        }

        body {
            background-color: var(--primary-dark);
            color: var(--accent-color);
        }

        .card {
            background-color: var(--secondary-dark);
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            height: 100%;
        }

        .card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 14px 28px rgba(0,0,0,0.2), 0 10px 10px rgba(0,0,0,0.15);
            cursor: pointer;
        }

        .card-img-top {
            height: 250px;
            width: 100%;
            object-fit: cover;
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .card-body {
            padding: 1.75rem;
            display: flex;
            flex-direction: column;
        }

        .card-text {
            font-size: 1.25rem;
            letter-spacing: 0.5px;
            color: var(--highlight);
            margin-bottom: 1.5rem;
        }

        .text-info {
            color: var(--info-color) !important;
        }

        .text-muted {
            color: var(--text-muted) !important;
            font-size: 0.95rem;
            line-height: 1.7;
        }

        .btn-info {
            background-color: transparent;
            border: 2px solid var(--info-color);
            color: var(--info-color);
            padding: 0.6rem 2rem;
            border-radius: 30px;
            transition: all 0.3s ease;
            letter-spacing: 0.5px;
            font-weight: 500;
            margin-top: auto;
        }

        .btn-info:hover {
            background-color: var(--info-color);
            color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(79, 195, 247, 0.2);
        }

        .navbar {
            background-color: var(--secondary-dark) !important;
            box-shadow: 0 2px 15px rgba(0,0,0,0.2);
        }

        .bg-light {
            background-color: var(--primary-dark) !important;
        }

        .album {
            background-color: var(--primary-dark) !important;
            padding: 3rem 0;
        }

        hr {
            border-color: rgba(255,255,255,0.1);
            margin: 1.5rem 0;
        }

        /* Pricing styling */
        .price {
            display: inline-block;
            margin: 1rem 0;
        }

        .price sup {
            font-size: 1rem;
            top: -1.2em;
            color: var(--info-color);
        }

        .price .number {
            font-weight: 600;
            color: var(--info-color);
        }

        .price sub {
            font-size: 0.8rem;
            bottom: 0;
            color: var(--text-muted);
        }

        /* Animation */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .col-md-12 {
            animation: fadeInUp 0.6s ease forwards;
            opacity: 0;
        }

        /* Staggered animation delays */
        .col-md-12:nth-child(1) { animation-delay: 0.1s; }
        .col-md-12:nth-child(2) { animation-delay: 0.2s; }
        .col-md-12:nth-child(3) { animation-delay: 0.3s; }
        .col-md-12:nth-child(4) { animation-delay: 0.4s; }
        .col-md-12:nth-child(5) { animation-delay: 0.5s; }
        .col-md-12:nth-child(6) { animation-delay: 0.6s; }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card-img-top {
                height: 200px;
            }
            .card-body {
                padding: 1.25rem;
            }
        }
    </style>
    <jsp:include page="includes/userNav.jsp" />

        <!-- Page Content  -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="btn btn-outline-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <div>
                        <h3 class="text-info">VENDOR DETAILS</h3>
                    </div>
                    <div>
                        <p class="mb-0 text-light">Welcome
                        <% if(session.getAttribute("User_gender").equals("male")){ %>
                            Mr.
                        <%}else{%>
                            Miss.
                        <%}%>
                        <span class="font-weight-bold text-info">${User_firstname} ${User_lastname}</span></p>
                    </div>
                </div>
            </nav>

            <div class="container-fluid mt-4">
                <div class="album py-5">
                    <div class="container">
                        <div class="row">
                        <c:forEach var="allvendor" items="${vendorlist}">
                            <div class="col-md-12 col-lg-4 col-sm-12 mb-5">
                                <div class="card">
                                    <img class="card-img-top" src="data:image/jpeg;base64,${allvendor.vendor_img}" alt="${allvendor.vendorname}">
                                    <div class="card-body">
                                        <h5 class="card-text text-center text-uppercase">${allvendor.vendorname}</h5>

                                        <div class="text-center my-3">
                                            <span class="price">
                                              <sup>Rs</sup>
                                              <span class="number display-4 text-info">${allvendor.vendor_price}</span>
                                              <sub>/per event</sub>
                                            </span>
                                        </div>

                                        <p class="text-center mb-4">
                                            <i class="fas fa-map-marker-alt text-info mr-2"></i>
                                            <span>${allvendor.vendor_location}</span>
                                        </p>

                                        <p class="text-muted text-center mb-4">${allvendor.vendor_desc}</p>

                                        <div class="text-center mt-3">
                                            <a href="/usernewbooking" class="btn btn-info">
                                                <i class="fas fa-calendar-check mr-2"></i>Book Vendor
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<jsp:include page="includes/footer.jsp" />
<%}%>