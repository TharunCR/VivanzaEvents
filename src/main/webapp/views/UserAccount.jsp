<%if (session.getAttribute("User_email") == null) {
      response.sendRedirect("/signin");
       } else {%>

<jsp:include page="includes/header.jsp" />

	<jsp:include page="includes/userNav.jsp" />

	    <!-- Page Content  -->
        <div id="content" style="background-color: #2d3748; min-height: 100vh;">
 			<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #1a202c;">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn" style="background-color: #4a5568; color: white;">
                        <i class="fas fa-align-left"></i>
                        <span class="ml-2">Toggle Sidebar</span>
                    </button>
                    <div>
                    	<h3 class="text-white font-weight-bold">MY ACCOUNT</h3>
                    </div>
                   <div>
                    	<p class="text-white mb-0">Welcome
                    	<% if(session.getAttribute("User_gender").equals("male")){ %>
                    		Mr.
                    	<%}else{%>
                    		Miss.
                    	<%}%>
                    	<span class="font-weight-bold text-white">${User_firstname} ${User_lastname}</span></p>
                    </div>
                </div>
            </nav>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card shadow" style="border: none; background-color: #1a202c;">
                        <div class="card-header" style="background-color: #2d3748; border-bottom: 1px solid #4a5568;">
                            <h3 class="text-center font-weight-light text-white my-2">Edit Profile</h3>
                        </div>
                        <div class="card-body" style="background-color: #2d3748;">
                            <form action="EdituserProfile" modelAttribute="EdituserProfile" method="POST" autocomplete="off">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="hidden" name="id" value="${User_id}"/>
                                <input type="hidden" name="password" value="${User_password}"/>
                                <input type="hidden" name="confirmPassword" value="${User_cpassword}"/>
                                <input type="hidden" name="role" value="${User_role}"/>

                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="small mb-1 text-white" for="f_name">First Name</label>
                                            <input class="form-control rounded-0" style="background-color: #4a5568; border: 1px solid #4a5568; color: white; padding: 12px;" type="text" value="${User_firstname}" placeholder="First Name" name="FirstName" id="f_name" required />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="small mb-1 text-white" for="L_Name">Last Name</label>
                                            <input class="form-control rounded-0" style="background-color: #4a5568; border: 1px solid #4a5568; color: white; padding: 12px;" type="text" value="${User_lastname}" placeholder="Last Name" name="LastName" id="L_Name" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="small mb-1 text-white" for="email_id">Email</label>
                                    <input class="form-control rounded-0" style="background-color: #4a5568; border: 1px solid #4a5568; color: white; padding: 12px;" type="email" value="${User_email}" placeholder="Email" name="email" id="email_id" required />
                                </div>

                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="small mb-1 text-white" for="contact">Phone Number</label>
                                            <input class="form-control rounded-0" style="background-color: #4a5568; border: 1px solid #4a5568; color: white; padding: 12px;" type="tel" name="contactno" value="${User_phone}" pattern="[6789][0-9]{9}" placeholder="Phone Number" id="contact" required />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="small mb-1 text-white" for="gen">Gender</label>
                                            <input class="form-control rounded-0" style="background-color: #4a5568; border: 1px solid #4a5568; color: white; padding: 12px;" type="text" id="gen" name="gender" value="${User_gender}" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="small mb-1 text-white" for="add">Address</label>
                                    <input class="form-control rounded-0" style="background-color: #4a5568; border: 1px solid #4a5568; color: white; padding: 12px;" type="text" value="${User_address}" name="Address" placeholder="Address" id="add" />
                                </div>

                                <div class="form-group mt-4 mb-0">
                                    <button type="submit" class="btn btn-primary btn-block rounded-0 py-3 font-weight-500" style="background-color: #4299e1; border: none;" name="edituser">UPDATE PROFILE</button>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer text-center py-3" style="background-color: #2d3748; border-top: 1px solid #4a5568;">
                            <div class="small"><a class="text-white" href="#" style="text-decoration: underline;">Need help?</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />
<%}%>

<style>
    body {
        color: white;
    }

    .form-control:focus {
        background-color: #4a5568;
        color: white;
        border-color: #4299e1;
        box-shadow: 0 0 0 0.2rem rgba(66, 153, 225, 0.25);
    }

    .btn:hover {
        opacity: 0.9;
    }

    a:hover {
        color: #ebf8ff !important;
    }
</style>