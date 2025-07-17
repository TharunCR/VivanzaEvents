<%if (session.getAttribute("User_email") == null) {
       response.sendRedirect("/signin");
        } else {%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />
    <style>
        :root {
            --primary-dark: #0f0f0f;
            --secondary-dark: #1a1a1a;
            --accent-color: #e8e8e8;
            --highlight: #ffffff;
            --text-muted: #aaaaaa;
            --gold-accent: #d4af37;
            --info-color: #4fc3f7;
        }

        body {
            background-color: var(--primary-dark);
            color: var(--accent-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card {
            background-color: var(--secondary-dark);
            border: none;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            height: 100%;
            position: relative;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0,0,0,0.25), 0 15px 15px rgba(0,0,0,0.15);
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--gold-accent), var(--info-color));
        }

        .card-img-top {
            height: 250px;
            width: 100%;
            object-fit: cover;
            border-bottom: 1px solid rgba(255,255,255,0.05);
        }

        .card-body {
            padding: 2rem;
            display: flex;
            flex-direction: column;
        }

        .card-text {
            font-size: 1.3rem;
            letter-spacing: 0.5px;
            color: var(--highlight);
            margin-bottom: 1.5rem;
            font-weight: 600;
        }

        .text-info {
            color: var(--info-color) !important;
        }

        .text-muted {
            color: var(--text-muted) !important;
            font-size: 0.95rem;
            line-height: 1.7;
            margin: 1rem 0;
        }

        .btn-info {
            background: linear-gradient(135deg, var(--gold-accent), var(--info-color));
            border: none;
            color: #111;
            padding: 0.7rem 2.5rem;
            border-radius: 30px;
            transition: all 0.3s ease;
            letter-spacing: 0.5px;
            font-weight: 600;
            margin-top: 1.5rem;
            text-transform: uppercase;
            font-size: 0.9rem;
            box-shadow: 0 4px 15px rgba(79, 195, 247, 0.3);
        }

        .btn-info:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(79, 195, 247, 0.4);
            color: #000;
        }

        .navbar {
            background-color: var(--secondary-dark) !important;
            box-shadow: 0 4px 20px rgba(0,0,0,0.25);
            border-bottom: 1px solid rgba(255,255,255,0.05);
        }

        .bg-light {
            background-color: var(--primary-dark) !important;
        }

        .album {
            background-color: var(--primary-dark) !important;
            padding: 4rem 0;
        }

        hr {
            border-color: rgba(255,255,255,0.1);
            margin: 1.5rem 0;
        }

        /* Pricing styling */
        .price {
            display: inline-block;
            margin: 1rem 0;
            position: relative;
        }

        .price sup {
            font-size: 1rem;
            top: -1.5em;
            color: var(--gold-accent);
            font-weight: 500;
        }

        .price .number {
            font-weight: 700;
            color: var(--gold-accent);
            text-shadow: 0 2px 10px rgba(212, 175, 55, 0.3);
        }

        .price sub {
            font-size: 0.85rem;
            bottom: 0;
            color: var(--text-muted);
        }

        /* Location styling */
        .pricing-text {
            color: var(--accent-color);
            font-size: 0.95rem;
        }

        .pricing-text i {
            color: var(--gold-accent);
            margin-right: 0.5rem;
        }

        /* Animation */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .col-md-12 {
            animation: slideIn 0.7s ease forwards;
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
        @media (max-width: 992px) {
            .card-img-top {
                height: 220px;
            }
            .card-body {
                padding: 1.5rem;
            }
        }

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
                    <button type="button" id="sidebarCollapse" class="btn btn-outline-gold">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <div>
                        <h3 class="text-info">HOTEL DETAILS</h3>
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
                        <c:forEach var="allhotel" items="${hotellist}">
                            <div class="col-md-12 col-lg-4 col-sm-12 mb-5">
                                <div class="card">
                                    <img class="card-img-top" src="data:image/jpeg;base64,${allhotel.hotelImg1}" alt="${allhotel.hotelName}">
                                    <div class="card-body">
                                        <h5 class="card-text text-center text-uppercase">${allhotel.hotelName}</h5>

                                        <div class="text-center my-3">
                                            <span class="price">
                                              <sup>Rs</sup>
                                              <span class="number display-4">${allhotel.price}</span>
                                              <sub>/per hour</sub>
                                            </span>
                                        </div>

                                        <p class="pricing-text text-center mb-4">
                                            <i class="fas fa-map-marker-alt"></i>
                                            <span>${allhotel.location}</span>
                                        </p>

                                        <p class="text-muted text-center">${allhotel.hotelDesc}</p>

                                        <div class="text-center">
                                            <a href="/usernewbooking" class="btn btn-info">
                                                <i class="fas fa-concierge-bell mr-2"></i>Book Now
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