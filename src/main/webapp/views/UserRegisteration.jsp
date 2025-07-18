<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="/"><i class="fas fa-backward"></i> Back</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
     </div>
  </nav>

  <section class="container" style="background-color: #f8f9fa;">
  		<div class="container">
    			<div class="row align-items-center my-5">
        				<!-- For Demo Purpose -->
        				<div class="col-md-12 col-lg-6 col-sm-12 mb-5">
            			<h1 style="color: #5e3a1f;">Create an Account</h1>
           					<p class="font-italic text-muted mb-0">Fill out the Information provided here to sign in</p>
           			    	<div c:if="${reg_error != null}">
								<p class="text-danger">${reg_error}</p>
							</div>
           			    </div>

				        <!-- Registeration Form -->
				        <div class="col-md-12 col-lg-6 col-sm-12 mt-3">
				           <form action="/registerForm" modelAttribute="registerForm" method="POST">
				           		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				           		<input type="hidden" name="role" value="User" />
				                <div class="row">
				                    <!-- First Name -->
				                    <div class="input-group col-lg-6 mb-4">
				                        <div class="input-group-prepend">
				                            <span class="input-group-text bg-white px-4 border-md border-right-0">
				                                <i class="fa fa-user text-muted"></i>
				                            </span>
				                        </div>
				                        <input id="firstName" type="text" name="FirstName" placeholder="First Name" class="form-control bg-white border-left-0 border-md" required>
				                    </div>

				                    <!-- Last Name -->
				                    <div class="input-group col-lg-6 mb-4">
				                        <div class="input-group-prepend">
				                            <span class="input-group-text bg-white px-4 border-md border-right-0">
				                                <i class="fa fa-user text-muted"></i>
				                            </span>
				                        </div>
				                        <input id="lastName" type="text" name="LastName" placeholder="Last Name" class="form-control bg-white border-left-0 border-md" required>
				                    </div>

				                    <!-- Email Address -->
				                    <div class="input-group col-lg-12 mb-4">
				                        <div class="input-group-prepend">
				                            <span class="input-group-text bg-white px-4 border-md border-right-0" >
				                                <i class="fa fa-envelope text-muted"></i>
				                            </span>
				                        </div>
				                        <input id="email" type="email" name="email" placeholder="Email Address" class="form-control bg-white border-left-0 border-md" required>
				                    </div>

				                    <!-- Phone Number -->
				                    <div class="input-group col-lg-12 mb-4">
				                        <div class="input-group-prepend">
				                            <span class="input-group-text bg-white px-4 border-md border-right-0">
				                                <i class="fa fa-phone-square text-muted"></i>
				                            </span>
				                        </div>

				                        <input id="phoneNumber" type="tel" name="contactno" pattern="[6789][0-9]{9}" placeholder="Phone Number" class="form-control bg-white border-md border-left-0 pl-3" required>
				                    </div>

									<!-- Address -->
				                    <div class="input-group col-lg-12 mb-4">
				                        <div class="input-group-prepend">
				                            <span class="input-group-text bg-white px-4 border-md border-right-0">
				                                <i class="fas fa-map-marker-alt text-muted"></i>
				                            </span>
				                        </div>
										<textarea class="form-control" name="Address" placeholder="Address" id="floatingTextarea"></textarea>
				                    </div>

				                    <!-- Gender -->
				                    <div class="input-group col-lg-12 mb-4">
				                        <div class="input-group-prepend">
				                            <span class="input-group-text bg-white px-4 border-md border-right-0">
				                                <i class="fas fa-venus-mars text-muted"></i>
				                            </span>
				                        </div>
				                        <select id="job" name="gender" class="form-control custom-select bg-white border-left-0 border-md" required>
				                            <option value="">Choose your Gender</option>
				                            <option value="male">Male</option>
				                            <option value="female">Female</option>
				                        </select>
				                    </div>

				                    <!-- Password -->
				                    <div class="input-group col-lg-6 mb-4">
				                        <div class="input-group-prepend">
				                            <span class="input-group-text bg-white px-4 border-md border-right-0">
				                                <i class="fa fa-lock text-muted" id="pass_icon"></i>
				                            </span>
				                        </div>
				                        <input id="password" type="password" name="password" oninput="checkInputs();" placeholder="Password" class="form-control bg-white border-left-0 border-md" required>
				                    </div>

				                    <!-- Password Confirmation -->
				                    <div class="input-group col-lg-6 mb-4">
				                        <div class="input-group-prepend">
				                            <span class="input-group-text bg-white px-4 border-md border-right-0">
				                                <i class="fa fa-lock text-muted" id="c_pass_icon" ></i>
				                            </span>
				                        </div>
				                        <input id="confirm_password" type="password" oninput="checkInputs();"name="ConfirmPassword" placeholder="Confirm Password" class="form-control bg-white border-left-0 border-md" required>
				                    </div>

				                    <!-- Submit Button -->
				                    <div class="form-group col-lg-12 mx-auto mb-0">
				                        <button type="submit" class="btn btn-dark btn-block py-2" name="adduser" style="background-color: #5e3a1f;">
				                            <span class="font-weight-bold">Create your account</span>
				                        </button>
				                    </div>

				                    <!-- Divider Text -->
				                    <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
				                        <div class="border-bottom w-100 ml-5" style="border-color: #6c757d;"></div>
				                        <span class="px-2 small font-weight-bold" style="color: #6c757d;">OR</span>
				                        <div class="border-bottom w-100 mr-5" style="border-color: #6c757d;"></div>
				                    </div>

				                    <!-- Social Login -->
				                    <div class="form-group col-lg-12 mx-auto">
				                        <a href="#" class="btn btn-block py-2" style="background-color: #6c757d; color: white;">
				                            <i class="fa fa-facebook-f mr-2"></i>
				                            <span class="font-weight-bold">Continue with Google</span>
				                        </a>
				                        <a href="#" class="btn btn-block py-2 mt-2" style="background-color: #495057; color: white;">
				                            <i class="fa fa-twitter mr-2"></i>
				                            <span class="font-weight-bold">Continue with Facebook</span>
				                        </a>
				                    </div>

				                    <!-- Already Registered -->
				                    <div class="text-center w-100">
				                        <p class="font-weight-bold" style="color: #6c757d;">Already Registered? <a href="signin" class="text-dark ml-2">Login</a></p>
				                    </div>
			                </div>
            	     </form>
			        </div>
			    </div>
			</div>
  </section>

<script>
var password = document.getElementById("password"),confirm_password = document.getElementById("confirm_password");

function checkInputs(){
  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Passwords Don't Match");
  } else {
    confirm_password.setCustomValidity('');
  }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
</script>

<jsp:include page="includes/footer.jsp" />