<%if (session.getAttribute("User_email") == null) {
       response.sendRedirect("/signin");
        } else {%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="includes/header.jsp" />
    <style>
        :root {
            --primary-dark: #121212;
            --secondary-dark: #1e1e1e;
            --accent-color: #e0e0e0;
            --highlight: #ffffff;
            --text-muted: #b0b0b0;
        }

        body {
            background-color: var(--primary-dark);
            color: var(--accent-color);
        }

        .card {
            background-color: var(--secondary-dark);
            border: none;
            border-radius: 8px;
            overflow: hidden;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
            cursor: pointer;
        }

        .card-img-top {
            height: 225px;
            width: 100%;
            object-fit: cover;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .card-body {
            padding: 1.5rem;
        }

        .card-text {
            font-size: 1.1rem;
            letter-spacing: 0.5px;
            color: var(--highlight);
        }

        .text-info {
            color: var(--highlight) !important;
        }

        .text-muted {
            color: var(--text-muted) !important;
            font-size: 0.9rem;
            line-height: 1.6;
        }

        .btn-info {
            background-color: transparent;
            border: 1px solid var(--highlight);
            color: var(--highlight);
            padding: 0.5rem 1.5rem;
            border-radius: 20px;
            transition: all 0.3s ease;
            letter-spacing: 0.5px;
        }

        .btn-info:hover {
            background-color: var(--highlight);
            color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .navbar {
            background-color: var(--secondary-dark) !important;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .bg-light {
            background-color: var(--secondary-dark) !important;
        }

        .album {
            background-color: var(--primary-dark) !important;
            padding: 3rem 0;
        }

        hr {
            border-color: rgba(255,255,255,0.1);
        }

        /* Elegant fade-in animation for cards */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .col-md-12 {
            animation: fadeIn 0.6s ease forwards;
        }

        /* Delay animations for staggered effect */
        .col-md-12:nth-child(1) { animation-delay: 0.1s; }
        .col-md-12:nth-child(2) { animation-delay: 0.2s; }
        .col-md-12:nth-child(3) { animation-delay: 0.3s; }
        .col-md-12:nth-child(4) { animation-delay: 0.4s; }
        .col-md-12:nth-child(5) { animation-delay: 0.5s; }
    </style>
    <jsp:include page="includes/userNav.jsp" />

        <!-- Page Content  -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="btn btn-outline-light">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <div>
                        <h3 class="text-white">EVENT DETAILS</h3>
                    </div>
                    <div>
                        <p class="mb-0">Welcome
                        <% if(session.getAttribute("User_gender").equals("male")){ %>
                            Mr.
                        <%}else{%>
                            Miss.
                        <%}%>
                        <span class="font-weight-bold text-white">${User_firstname} ${User_lastname}</span></p>
                    </div>
                </div>
            </nav>

            <div class="container-fluid mt-4">
                <div class="album py-5">
                    <div class="container">
                        <div class="row">
                        <c:forEach var="allevent" items="${eventlist}">
                            <div class="col-md-12 col-lg-4 col-sm-12 mb-4">
                                <div class="card h-100">
                                    <img class="card-img-top" src="data:image/jpeg;base64,${allevent.event_img}" alt="${allevent.eventname}">
                                    <div class="card-body d-flex flex-column">
                                        <h5 class="card-title text-center text-uppercase mb-3" style="letter-spacing: 1px;">${allevent.eventname}</h5>
                                        <p class="text-muted flex-grow-1">${allevent.event_desc}</p>
                                        <hr class="my-3">
                                        <div class="text-center mt-auto">
                                            <a href="/usernewbooking" class="btn btn-info px-4">
                                                <i class="fas fa-ticket-alt mr-2"></i>Book Now
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