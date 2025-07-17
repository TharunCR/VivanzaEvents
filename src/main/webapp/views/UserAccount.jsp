<%if (session.getAttribute("User_email") == null) {
      response.sendRedirect("/signin");
       } else {%>

<jsp:include page="includes/header.jsp" />

	<jsp:include page="includes/userNav.jsp" />

	    <!-- Page Content  -->
        <div id="content" class="bg-gray-100">
 			<nav class="navbar navbar-expand-lg navbar-dark bg-gray-900 shadow-lg">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-dark">
                        <i class="fas fa-align-left"></i>
                        <span class="ml-2">Toggle Sidebar</span>
                    </button>
                    <div>
                    	<h3 class="text-white font-serif tracking-wider">MY ACCOUNT</h3>
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

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card shadow-lg border-0 rounded-lg">
                        <div class="card-header bg-gray-800">
                            <h3 class="text-center font-weight-light text-white my-2">Edit Profile</h3>
                        </div>
                        <div class="card-body bg-white">
                            <form action="EdituserProfile" modelAttribute="EdituserProfile" method="POST" autocomplete="off">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="hidden" name="id" value="${User_id}"/>
                                <input type="hidden" name="password" value="${User_password}"/>
                                <input type="hidden" name="confirmPassword" value="${User_cpassword}"/>
                                <input type="hidden" name="role" value="${User_role}"/>

                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="small mb-1 text-gray-700" for="f_name">First Name</label>
                                            <input class="form-control rounded-0 border-gray-300 py-4" type="text" value="${User_firstname}" placeholder="First Name" name="FirstName" id="f_name" required />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="small mb-1 text-gray-700" for="L_Name">Last Name</label>
                                            <input class="form-control rounded-0 border-gray-300 py-4" type="text" value="${User_lastname}" placeholder="Last Name" name="LastName" id="L_Name" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="small mb-1 text-gray-700" for="email_id">Email</label>
                                    <input class="form-control rounded-0 border-gray-300 py-4" type="email" value="${User_email}" placeholder="Email" name="email" id="email_id" required />
                                </div>

                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="small mb-1 text-gray-700" for="contact">Phone Number</label>
                                            <input class="form-control rounded-0 border-gray-300 py-4" type="tel" name="contactno" value="${User_phone}" pattern="[6789][0-9]{9}" placeholder="Phone Number" id="contact" required />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="small mb-1 text-gray-700" for="gen">Gender</label>
                                            <input class="form-control rounded-0 border-gray-300 py-4" type="text" id="gen" name="gender" value="${User_gender}" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="small mb-1 text-gray-700" for="add">Address</label>
                                    <input class="form-control rounded-0 border-gray-300 py-4" type="text" value="${User_address}" name="Address" placeholder="Address" id="add" />
                                </div>

                                <div class="form-group mt-4 mb-0">
                                    <button type="submit" class="btn btn-dark btn-block rounded-0 py-3 font-weight-500 letter-spacing-1" name="edituser">UPDATE PROFILE</button>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer bg-gray-100 text-center py-3">
                            <div class="small"><a class="text-gray-700" href="#">Need help?</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />
<%}%>