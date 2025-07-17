<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<jsp:include page="includes/adminNav.jsp" />

    <!-- Page Content  -->
    <div id="content" style="background-color: #121212; color: #e0e0e0;">

         <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #1e1e1e;">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-dark" style="background-color: #2d2d2d; border-color: #444;">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <div>
                    	<h3 class="text-white">VENDOR DETAILS</h3>
                    </div>
                   <div>
                    	<p style="color: #b0b0b0;">Welcome
                    	<% if(session.getAttribute("Admin_gender").equals("male")){ %>
                    		Mr.
                    	<%}else{%>
                    		Miss.
                    	<%}%>
                    	<span class="font-weight-bold text-white">${Admin_firstname} ${Admin_lastname}</span></p>
                    </div>
                </div>
            </nav>

    <div>

<nav class="d-flex justify-content-between">

    <form class="d-flex"  action="/adminvendorSearch"  method="post" autocomplete="off">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input class="form-control bg-dark text-white border-secondary" type="search" name="valueToSearch" placeholder="Value To Search" aria-label="Search" value="${vendor_keyword}">
            <button class="btn ml-2 btn-dark" style="background-color: #2d2d2d; border-color: #444;" type="submit" name="search">Search</button>
        </form>

   <form class="d-flex">
        <button type="button" class="btn btn-dark ml-2" style="background-color: #2d2d2d; border-color: #444;" name="add_vendor" data-toggle="modal" data-target="#AddvendorModal" data-whatever="@mdo">Add vendor</button>
    </form>


     <!-- Add User modal -->
     <div class="modal fade" id="AddvendorModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="background-color: #1e1e1e; color: #e0e0e0;">
            <div class="modal-header" style="border-color: #444;">
                <h5 class="modal-title text-white" id="exampleModalLabel">Add Vendor</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/addvendorForm" modelAttribute="vendorForm"  method="POST" enctype= "multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="superadmin" value="not"/>
						<input type="hidden" name="subadmin" value="not"/>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Vendor Name:</label>
                        <input type="text" class="form-control bg-dark text-white border-secondary" placeholder="Vendor Name" name="vendorname" id="vendorname" required>
                    </div>
                    <div class="form-group">
						 <label for="message-text" class="col-form-label">Vendor Description</label>
                        <select id="vendor_desc" name="vendor_desc"  class="form-control bg-dark text-white border-secondary" required>
							<option value="">Choose the Description</option>
							<option value="Photographer">Photographer</option>
							<option value="DJ">Disc Jockey</option>
							<option value="Makeupartisit">Makeup Artisit</option>
							<option value="Decorator">Decorator</option>
						</select>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Vendor Image:</label>
                        <input type="file" class="form-control bg-dark text-white border-secondary" name="vendor_img" id="vendor_img" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Vendor Price:</label>
						<input  class="form-control bg-dark text-white border-secondary"  type="text" name="vendor_price"  placeholder="Vendor Price" id="vendor_price" required>
                    </div>

                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Vendor Location:</label>
						<textarea class="form-control bg-dark text-white border-secondary" name="vendor_location" placeholder="Vendor Location" id="vendor_location"></textarea>
                    </div>
                </div>
                <div class="modal-footer" style="border-color: #444;">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-dark" style="background-color: #2d2d2d; border-color: #444;" name="addvendor" >Add Vendor</button>
                </div>
            </form>
            </div>
        </div>
        </div>

</nav>
<br/><br/>

    <label class="text-white font-weight-bold"> Select No.of.rows to display :</label>
      <select class="form-control bg-dark text-white border-secondary" name="state" id="maxRows">
            <option value="5000">Show ALL Rows</option>
            <option value="5">5</option>
            <option value="10">10</option>
            <option value="15">15</option>
            <option value="20">20</option>
            <option value="50">50</option>
            <option value="70">70</option>
            <option value="100">100</option>
        </select>


        <div class="table-responsive">
            <table class="content-table table table-dark" id="table-id">
                <thead>
                    <tr>
                    <th>VENDOR NAME</th>
                    <th>VENDOR DESCRIPTION</th>
                    <th>VENDOR IMG1</th>
                    <th>VENDOR PRICE</th>
                    <th>LOCATION</th>
                    <th>ACTION</th>
                </tr>
            </thead>
                <tbody>
                	 <c:forEach var="allvendor" items="${vendorlist}" >
			            <tr>
			            <td>${allvendor.vendorname}</td>
			            <td>${allvendor.vendor_desc}</td>
			           <td ><img src="data:image/jpeg;base64,${allvendor.vendor_img}" class="rounded-circle" width="100" height="100"/></td>
			            <td>${allvendor.vendor_price}</td>
			            <td>${allvendor.vendor_location}</td>
                        <td class="d-flex">
                            <a class="btn btn-dark edit" style="background-color: #2d2d2d; border-color: #444;" data-toggle="modal" name="edit_vendor" data-target="#EditvendorModal" data-whatever="@mdo">EDIT</a>
					         <input type="hidden" value="${allvendor.id}" id="edit_id">
                            <a href="/admindeletevendor/${allvendor.id}" class="btn btn-danger ml-2" onclick='return deleteVendor()'>DELETE</a>
                        </td>
                        </tr>
                    </c:forEach>
                </tbody>

                </table>
            </div>

              <div class='pagination-container mt-2'>
            <nav>
                <ul class="pagination">
                   <li class="page-item" style="cursor:pointer; background-color: #2d2d2d;"><span class="page-link text-white"> < <span class="sr-only">(current)</span></span></li>
                   <!--	Here the JS Function Will Add the Rows -->
                    <li class="page-item" style="cursor:pointer; background-color: #2d2d2d;"  data-page="next" id="prev"><span class="page-link text-white"> > <span class="sr-only">(current)</span></span></li>
                </ul>
            </nav>
        </div>

        </div>
        </div>
    </div>
     <!-- Edit User modal -->
			 <div class="modal fade" id="EditvendorModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="background-color: #1e1e1e; color: #e0e0e0;">
					<div class="modal-header" style="border-color: #444;">
						<h5 class="modal-title text-white" id="exampleModalLabel">Edit Vendor</h5>
						<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="/EditvendorForm" modelAttribute="vendorEditForm" method="POST" enctype= "multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="superadmin" value="not"/>
						<input type="hidden" name="subadmin" value="not"/>
						<input type="hidden" name="id" id="vendor_id">
						<div class="modal-body">

							<div class="modal-body">

								<div class="form-group">
									<label for="message-text" class="col-form-label">Vendor Name:</label>
									<input type="text" class="form-control bg-dark text-white border-secondary" placeholder="Vendor Name" name="vendorname" id="vendorName1" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Vendor Description:</label>
									<select id="vendorDesc1" name="vendor_desc"  class="form-control bg-dark text-white border-secondary" required>
										<option value="">Choose the Description</option>
										<option value="Photographer">Photographer</option>
										<option value="DJ">Disc Jockey</option>
										<option value="Makeupartisit">Makeup Artisit</option>
										<option value="Decorator">Decorator</option>
									</select>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Vendor Price:</label>
									<input type="text" class="form-control bg-dark text-white border-secondary"  placeholder="Vendor Price" name="vendor_price" id="price1" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Address:</label>
									<textarea class="form-control bg-dark text-white border-secondary" name="vendor_location" placeholder="Vendor Location" id="location1"></textarea>
								</div>
								<div class="form-group">
                       			 <label for="message-text" class="col-form-label">Vendor Image:</label>
                     		   <input type="file" class="form-control bg-dark text-white border-secondary" name="vendor_img" id="vendorImg11" >
                  			  </div>
							</div>
						</div>
						<div class="modal-footer" style="border-color: #444;">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-dark" style="background-color: #2d2d2d; border-color: #444;" name="Editvendor" >Edit Vendor</button>
						</div>
					</form>
					</div>
				</div>
				</div>


	<script type="text/javascript">
        $(document).ready(function() {
            $('table .edit').click(function ()
            {
				var id=$(this).parent().find('#edit_id').val();

				console.log(id)
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/vendorfind/"+id, //this is my servlet
                    data: "input=" +$('#ip').val()+"&output="+$('#op').val(),
                    success: function(allvendor){
                    		$('#EditvendorModal #vendor_id').val(allvendor.id);
                            $('#EditvendorModal #vendorName1').val(allvendor.vendorname);
							$('#EditvendorModal #vendorDesc1').val(allvendor.vendor_desc);
							$('#EditvendorModal #location1').val(allvendor.vendor_location);
							$('#EditvendorModal #price1').val(allvendor.vendor_price);
							$('#EditvendorModal #vendorImg11').val(allvendor.vendor_img);

                    }
                });
            });

        });
    </script>

<jsp:include page="includes/footer.jsp" />
<%}%>