<%if (session.getAttribute("Admin_email") == null) {
    response.sendRedirect("/signin");
     } else {%>

<jsp:include page="includes/header.jsp" />

  <jsp:include page="includes/adminNav.jsp" />


      <!-- Page Content  -->
      <div id="content" style="background-color: #121212; color: #e0e0e0;">
           <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #1e1e1e; border-bottom: 1px solid #333;">
              <div class="container-fluid">

                  <button type="button" id="sidebarCollapse" class="btn btn-dark" style="background-color: #333; border-color: #444;">
                      <i class="fas fa-align-left"></i>
                      <span>Toggle Sidebar</span>
                  </button>
                  <div>
                      <h3 class="text-light">MY ACCOUNT </h3>
                  </div>
                 <div>
                      <p style="color: #b0b0b0;">Welcome
                      <% if(session.getAttribute("Admin_gender").equals("male")){ %>
                          Mr.
                      <%}else{%>
                          Miss.
                      <%}%>
                      <span class="font-weight-bold text-info">${Admin_firstname} ${Admin_lastname}</span></p>
                  </div>
              </div>
          </nav>

      <div style="background-color: #1e1e1e; padding: 20px; border-radius: 5px; margin: 15px;">
    <form action="editadminprofile" modelAttribute="adminEditProfile" method="POST" autocomplete="off">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          <input type="hidden"  name="id" value="${Admin_id}"/>
          <input  type="hidden" name="password" value="${Admin_password}"/>
          <input  type="hidden" name="confirmPassword" value="${Admin_cpassword}"/>
          <input  type="hidden"  name="role" value="${Admin_role}"/>
              <div class="form-group ">
                      <label for="message-text" class="col-form-label" style="color: #b0b0b0;">First Name:</label>
                      <input type="text" class="form-control" value="${Admin_firstname}" placeholder="FirstName" name="FirstName" id="f_name" required style="background-color: #333; color: #e0e0e0; border-color: #444;">
                  </div>
                  <div class="form-group">
                      <label for="message-text" class="col-form-label" style="color: #b0b0b0;">Last Name:</label>
                      <input type="text" class="form-control" value="${Admin_lastname}" placeholder="LastName" name="LastName" id="L_Name" required style="background-color: #333; color: #e0e0e0; border-color: #444;">
                  </div>
                  <div class="form-group">
                      <label for="message-text" class="col-form-label" style="color: #b0b0b0;">Email Id:</label>
                      <input type="text" class="form-control" value="${Admin_email}" placeholder="Email Id" name="email" id="email_id" required style="background-color: #333; color: #e0e0e0; border-color: #444;">
                  </div>
                  <div class="form-group">
                      <label for="message-text" class="col-form-label" style="color: #b0b0b0;">Phone Number:</label>
                      <input  class="form-control"  type="tel" name="contactno" value="${Admin_phone}" pattern="[6789][0-9]{9}" placeholder="Phone Number" id="contact" required style="background-color: #333; color: #e0e0e0; border-color: #444;">
                  </div>
                  <div class="form-group">
                      <label for="message-text" class="col-form-label" style="color: #b0b0b0;">Address:</label>
                      <input type="text" class="form-control" value="${Admin_address}" name="Address" placeholder="Address" id="add" style="background-color: #333; color: #e0e0e0; border-color: #444;"/>
                  </div>
                  <div class="form-group">
                      <label for="message-text" class="col-form-label" style="color: #b0b0b0;">Gender:</label>
                      <input type="text" id="gen" name="gender" value="${Admin_gender}" class="form-control" required style="background-color: #333; color: #e0e0e0; border-color: #444;">
                  </div>
                 <div class="form-group">
                  <button type="submit" class="btn btn-info" name="editAdmin" style="background-color: #0066cc; border-color: #005bb7;">EDIT</button>
                  </div>
                   </form>
                  </div>

      </div>
  </div>

<jsp:include page="includes/footer.jsp" />
<%}%>