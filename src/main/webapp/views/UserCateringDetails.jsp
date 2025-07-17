<%if (session.getAttribute("User_email") == null) {
       response.sendRedirect("/signin");
        } else {%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />
    <style>
        :root {
            --black: #121212;
            --dark-grey: #1e1e1e;
            --medium-grey: #2d2d2d;
            --light-grey: #3d3d3d;
            --lighter-grey: #4d4d4d;
            --lightest-grey: #5e5e5e;
            --white: #e0e0e0;
            --accent: #bb86fc;
        }

        body {
            background-color: var(--black);
            color: var(--white);
            font-family: 'Helvetica Neue', Arial, sans-serif;
        }

        .card {
            border: none;
            border-radius: 8px;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 4px 6px rgba(0,0,0,0.3);
            background: var(--dark-grey);
            overflow: hidden;
            height: 100%;
            border: 1px solid var(--light-grey);
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.5);
            border-color: var(--accent);
        }

        .card-img-top {
            height: 250px;
            width: 100%;
            object-fit: cover;
            border-bottom: 1px solid var(--light-grey);
        }

        .card-body {
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
        }

        .card-title {
            font-weight: 600;
            letter-spacing: 0.5px;
            color: var(--white);
            margin-bottom: 1rem;
        }

        .card-text {
            color: var(--lighter-grey);
            line-height: 1.6;
            margin-bottom: 1.5rem;
        }

        .price {
            margin: 1rem 0;
        }

        .price sup {
            color: var(--lightest-grey);
            font-size: 0.9rem;
        }

        .price .number {
            color: var(--white);
            font-weight: 700;
        }

        .price sub {
            color: var(--lightest-grey);
            font-size: 0.8rem;
        }

        .btn-dark {
            background-color: var(--accent);
            border-color: var(--accent);
            color: var(--black);
            border-radius: 4px;
            padding: 0.75rem 2rem;
            letter-spacing: 1px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.8rem;
            transition: all 0.3s;
        }

        .btn-dark:hover {
            background-color: var(--white);
            transform: translateY(-2px);
            color: var(--black);
        }

        .bg-gray-900 {
            background-color: var(--black) !important;
            border-bottom: 1px solid var(--light-grey);
        }

        .text-gray-300 {
            color: var(--lighter-grey) !important;
        }

        .text-gray-800 {
            color: var(--white) !important;
        }

        .text-gray-600 {
            color: var(--light-grey) !important;
        }

        .text-gray-900 {
            color: var(--white) !important;
        }

        .text-gray-500 {
            color: var(--lightest-grey) !important;
        }

        .album {
            background-color: var(--black) !important;
            padding: 3rem 0;
        }

        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
            border-bottom: 1px solid var(--light-grey);
        }

        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .col-md-6 {
            animation: fadeIn 0.5s ease forwards;
            opacity: 0;
        }

        /* Staggered animation */
        .col-md-6:nth-child(1) { animation-delay: 0.1s; }
        .col-md-6:nth-child(2) { animation-delay: 0.2s; }
        .col-md-6:nth-child(3) { animation-delay: 0.3s; }
        .col-md-6:nth-child(4) { animation-delay: 0.4s; }
        .col-md-6:nth-child(5) { animation-delay: 0.5s; }
        .col-md-6:nth-child(6) { animation-delay: 0.6s; }

        @media (max-width: 768px) {
            .card-img-top {
                height: 200px;
            }
            .card-body {
                padding: 1.25rem;
            }
        }

        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: var(--black);
        }
        ::-webkit-scrollbar-thumb {
            background: var(--light-grey);
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: var(--lighter-grey);
        }
    </style>
    <jsp:include page="includes/userNav.jsp" />

        <!-- Page Content -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-dark bg-gray-900">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="btn btn-outline-light">
                        <i class="fas fa-align-left"></i>
                        <span class="ml-2">Toggle Sidebar</span>
                    </button>
                    <div>
                        <h3 class="text-white font-weight-normal letter-spacing-2">CATERING SERVICES</h3>
                    </div>
                    <div>
                        <p class="text-gray-300 mb-0">Welcome
                        <% if(session.getAttribute("User_gender").equals("male")){ %>
                            Mr.
                        <%}else{%>
                            Miss.
                        <%}%>
                        <span class="font-weight-bold text-white">${User_firstname} ${User_lastname}</span></p>
                    </div>
                </div>
            </nav>

            <div class="album py-5">
                <div class="container">
                    <div class="row">
                    <c:forEach var="allcater" items="${caterlist}">
                        <div class="col-md-6 col-lg-4 col-sm-12 mb-5">
                            <div class="card">
                                <img class="card-img-top" src="data:image/jpeg;base64,${allcater.cater_img}" alt="${allcater.catername}">
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title text-center text-uppercase">${allcater.catername}</h5>
                                    <p class="card-text text-center">${allcater.cater_desc}</p>

                                    <div class="text-center my-3">
                                        <span class="price">
                                            <sup>Rs</sup>
                                            <span class="number h4">${allcater.cater_price}</span>
                                            <sub>/per person</sub>
                                        </span>
                                    </div>

                                    <div class="text-center mt-auto">
                                        <a href="/usernewbooking" class="btn btn-dark">
                                            Book Service <i class="fas fa-arrow-right ml-2"></i>
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

<jsp:include page="includes/footer.jsp" />
<%}%>