<%if (session.getAttribute("Admin_email") == null) {
    response.sendRedirect("/signin");
     } else {%>

<jsp:include page="includes/header.jsp" />

  <jsp:include page="includes/adminNav.jsp" />


      <!-- Page Content  -->
      <div id="content" class="bg-gray-900 text-gray-100 min-h-screen">
           <nav class="navbar navbar-expand-lg navbar-dark bg-gray-800 border-b border-gray-700 shadow-lg">
              <div class="container-fluid">

                  <button type="button" id="sidebarCollapse" class="btn bg-gray-700 hover:bg-gray-600 border-0 transform hover:-translate-y-0.5 transition-all duration-200 hover:shadow-lg">
                      <i class="fas fa-align-left"></i>
                      <span>Toggle Sidebar</span>
                  </button>
                  <div>
                      <h3 class="text-white font-bold tracking-wide text-xl">MY ACCOUNT</h3>
                  </div>
                 <div>
                      <p class="text-gray-300">Welcome
                      <% if(session.getAttribute("Admin_gender").equals("male")){ %>
                          Mr.
                      <%}else{%>
                          Miss.
                      <%}%>
                      <span class="font-bold text-white">${Admin_firstname} ${Admin_lastname}</span></p>
                  </div>
              </div>
          </nav>

      <div class="container-fluid p-4">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="card bg-gray-800 border-gray-700 shadow-xl transform transition-all duration-300 hover:shadow-2xl hover:-translate-y-1">
              <div class="card-header bg-gray-700 border-b border-gray-600 text-white py-3">
                <h4 class="mb-0 font-semibold text-lg"><i class="fas fa-user-edit mr-2"></i>Edit Profile</h4>
              </div>
              <div class="card-body">
                <form action="editadminprofile" modelAttribute="adminEditProfile" method="POST" autocomplete="off" class="needs-validation" novalidate>
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden"  name="id" value="${Admin_id}"/>
                  <input type="hidden" name="password" value="${Admin_password}"/>
                  <input type="hidden" name="confirmPassword" value="${Admin_cpassword}"/>
                  <input type="hidden"  name="role" value="${Admin_role}"/>

                  <div class="row">
                    <div class="col-md-6 mb-4">
                      <div class="form-group relative">
                        <label for="f_name" class="text-gray-300 block mb-2 transition-all duration-200 transform origin-top-left">First Name:</label>
                        <input type="text" class="form-control bg-gray-700 border-gray-600 text-white focus:ring-2 focus:ring-gray-500 focus:border-gray-500 rounded-lg px-4 py-2.5 w-full transition-all duration-200"
                               value="${Admin_firstname}" placeholder="FirstName" name="FirstName" id="f_name" required>
                        <div class="invalid-feedback text-red-400 text-sm mt-1">
                          Please provide your first name.
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 mb-4">
                      <div class="form-group relative">
                        <label for="L_Name" class="text-gray-300 block mb-2 transition-all duration-200 transform origin-top-left">Last Name:</label>
                        <input type="text" class="form-control bg-gray-700 border-gray-600 text-white focus:ring-2 focus:ring-gray-500 focus:border-gray-500 rounded-lg px-4 py-2.5 w-full transition-all duration-200"
                               value="${Admin_lastname}" placeholder="LastName" name="LastName" id="L_Name" required>
                        <div class="invalid-feedback text-red-400 text-sm mt-1">
                          Please provide your last name.
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="form-group mb-4 relative">
                    <label for="email_id" class="text-gray-300 block mb-2 transition-all duration-200 transform origin-top-left">Email Id:</label>
                    <input type="email" class="form-control bg-gray-700 border-gray-600 text-white focus:ring-2 focus:ring-gray-500 focus:border-gray-500 rounded-lg px-4 py-2.5 w-full transition-all duration-200"
                           value="${Admin_email}" placeholder="Email Id" name="email" id="email_id" required>
                    <div class="invalid-feedback text-red-400 text-sm mt-1">
                      Please provide a valid email address.
                    </div>
                  </div>

                  <div class="form-group mb-4 relative">
                    <label for="contact" class="text-gray-300 block mb-2 transition-all duration-200 transform origin-top-left">Phone Number:</label>
                    <input type="tel" class="form-control bg-gray-700 border-gray-600 text-white focus:ring-2 focus:ring-gray-500 focus:border-gray-500 rounded-lg px-4 py-2.5 w-full transition-all duration-200"
                           value="${Admin_phone}" pattern="[6789][0-9]{9}" placeholder="Phone Number" name="contactno" id="contact" required>
                    <div class="invalid-feedback text-red-400 text-sm mt-1">
                      Please provide a valid 10-digit phone number starting with 6,7,8 or 9.
                    </div>
                  </div>

                  <div class="form-group mb-4 relative">
                    <label for="add" class="text-gray-300 block mb-2 transition-all duration-200 transform origin-top-left">Address:</label>
                    <textarea class="form-control bg-gray-700 border-gray-600 text-white focus:ring-2 focus:ring-gray-500 focus:border-gray-500 rounded-lg px-4 py-2.5 w-full transition-all duration-200"
                              name="Address" placeholder="Address" id="add" rows="2">${Admin_address}</textarea>
                  </div>

                  <div class="form-group mb-4 relative">
                    <label for="gen" class="text-gray-300 block mb-2 transition-all duration-200 transform origin-top-left">Gender:</label>
                    <select id="gen" name="gender" class="form-control bg-gray-700 border-gray-600 text-white focus:ring-2 focus:ring-gray-500 focus:border-gray-500 rounded-lg px-4 py-2.5 w-full transition-all duration-200" required>
                      <option value="male" ${Admin_gender == 'male' ? 'selected' : ''}>Male</option>
                      <option value="female" ${Admin_gender == 'female' ? 'selected' : ''}>Female</option>
                      <option value="other" ${Admin_gender == 'other' ? 'selected' : ''}>Other</option>
                    </select>
                  </div>

                  <div class="form-group text-right mt-6">
                    <button type="submit" class="btn bg-gray-700 hover:bg-gray-600 text-white px-6 py-3 rounded-lg shadow-md hover:shadow-lg transform hover:-translate-y-0.5 transition-all duration-300 border border-gray-600 hover:border-gray-500" name="editAdmin">
                      <i class="fas fa-edit mr-2"></i>Update Profile
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      </div>
  </div>

<style>
  body {
    background-color: #111827;
    color: #f3f4f6;
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
  }

  .form-control {
    background-color: #1f2937;
    border: 1px solid #374151;
    color: white;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  }

  .form-control:focus {
    background-color: #1f2937;
    color: white;
    border-color: #6b7280;
    box-shadow: 0 0 0 3px rgba(156, 163, 175, 0.2);
    outline: none;
  }

  .card {
    border: 1px solid #374151;
    border-radius: 0.5rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    background: linear-gradient(145deg, #1f2937, #111827);
  }

  .navbar {
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  }

  .btn {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    font-weight: 500;
  }

  .invalid-feedback {
    display: none;
    opacity: 0;
    transition: opacity 0.3s ease;
  }

  .was-validated .form-control:invalid ~ .invalid-feedback,
  .form-control.is-invalid ~ .invalid-feedback {
    display: block;
    opacity: 1;
  }

  .was-validated .form-control:invalid,
  .form-control.is-invalid {
    border-color: #f87171;
    animation: shake 0.5s;
  }

  .was-validated .form-control:invalid:focus,
  .form-control.is-invalid:focus {
    border-color: #f87171;
    box-shadow: 0 0 0 3px rgba(248, 113, 113, 0.2);
  }

  @keyframes shake {
    0%, 100% { transform: translateX(0); }
    20%, 60% { transform: translateX(-5px); }
    40%, 80% { transform: translateX(5px); }
  }

  .form-group label {
    transition: all 0.2s ease-out;
  }

  .form-control:focus + label,
  .form-control:not(:placeholder-shown) + label {
    transform: translateY(-1rem) scale(0.85);
    color: #ffffff;
  }

  .card-header {
    background: linear-gradient(90deg, #1f2937, #111827);
  }

  .btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 7px 14px rgba(0, 0, 0, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
  }

  input:-webkit-autofill,
  input:-webkit-autofill:hover,
  input:-webkit-autofill:focus,
  input:-webkit-autofill:active {
    -webkit-box-shadow: 0 0 0 30px #1f2937 inset !important;
    -webkit-text-fill-color: white !important;
  }
</style>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Form validation
    const forms = document.querySelectorAll('.needs-validation');

    Array.prototype.slice.call(forms).forEach(function(form) {
      form.addEventListener('submit', function(event) {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        } else {
          const submitButton = form.querySelector('button[type="submit"]');
          if (submitButton) {
            submitButton.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i> Updating...';
            submitButton.disabled = true;
          }
        }

        form.classList.add('was-validated');
      }, false);
    });

    // Input field animations
    const inputs = document.querySelectorAll('.form-control');
    inputs.forEach(input => {
      // Add focus/blur effects
      input.addEventListener('focus', () => {
        input.parentElement.classList.add('input-focused');
        const label = input.previousElementSibling;
        if (label && label.tagName === 'LABEL') {
          label.classList.add('text-white', 'scale-90', '-translate-y-2');
        }
      });

      input.addEventListener('blur', () => {
        input.parentElement.classList.remove('input-focused');
        const label = input.previousElementSibling;
        if (label && label.tagName === 'LABEL' && !input.value) {
          label.classList.remove('text-white', 'scale-90', '-translate-y-2');
        }
      });

      // Check for pre-filled values on load
      if (input.value) {
        const label = input.previousElementSibling;
        if (label && label.tagName === 'LABEL') {
          label.classList.add('text-white', 'scale-90', '-translate-y-2');
        }
      }
    });

    // Ripple effect for buttons
    const buttons = document.querySelectorAll('.btn');
    buttons.forEach(button => {
      button.addEventListener('click', function(e) {
        const rect = button.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;

        const ripple = document.createElement('span');
        ripple.className = 'ripple-effect';
        ripple.style.left = `${x}px`;
        ripple.style.top = `${y}px`;

        this.appendChild(ripple);

        setTimeout(() => {
          ripple.remove();
        }, 1000);
      });
    });
  });
</script>

<jsp:include page="includes/footer.jsp" />
<%}%>