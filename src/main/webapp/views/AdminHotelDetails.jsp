<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="includes/header.jsp" />

<style>
    body {
        background-color: #121212;
        color: #e0e0e0;
    }
    .table {
        color: #e0e0e0;
    }
    .table thead th {
        background-color: #1e1e1e;
        border-color: #444;
    }
    .table tbody tr {
        background-color: #2d2d2d;
    }
    .table tbody tr:hover {
        background-color: #3a3a3a;
    }
    .modal-content {
        background-color: #1e1e1e;
        color: #e0e0e0;
    }
    .form-control, .form-control:focus {
        background-color: #2d2d2d;
        color: #e0e0e0;
        border-color: #444;
    }
    .page-link {
        background-color: #2d2d2d;
        color: #e0e0e0;
        border-color: #444;
    }
    .page-item.active .page-link {
        background-color: #3a3a3a;
        border-color: #555;
    }
    .btn-info {
        background-color: #0066cc;
        border-color: #0055aa;
    }
    .btn-danger {
        background-color: #cc0000;
        border-color: #aa0000;
    }
</style>

<jsp:include page="includes/adminNav.jsp" />

    <!-- Page Content  -->
    <div id="content" style="background-color: #121212; min-height: 100vh;">

          <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #1e1e1e;">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-dark" style="background-color: #2d2d2d; border-color: #444;">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <div>
                    	<h3 class="text-white">HOTEL DETAILS</h3>
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

   <div class="container-fluid p-4">

<div class="d-flex justify-content-between mb-4">

   <form class="d-flex" action="/adminhotelSearch" method="post" autocomplete="off">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input class="form-control" style="background-color: #2d2d2d; color: #e0e0e0; border-color: #444;" type="search" name="valueToSearch" placeholder="Value To Search" aria-label="Search" value="${hotel_keyword}">
            <button class="btn ml-2 btn-dark" style="background-color: #3a3a3a; border-color: #444;" type="submit" name="search">Search</button>
        </form>

    <form class="d-flex">
        <button type="button" class="btn btn-dark ml-2" style="background-color: #3a3a3a; border-color: #444;" name="add_hotel" data-toggle="modal" data-target="#AddhotelModal" data-whatever="@mdo">Add Hotel</button>
    </form>

     <!-- Add User modal -->
     <div class="modal fade" id="AddhotelModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header" style="border-color: #444;">
                <h5 class="modal-title text-white">Add Hotel</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/addhotelForm" modelAttribute="hotelForm" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="subadmin" value="not"/>
				<input type="hidden" name="superadmin" value="not"/>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Hotel Name:</label>
                        <input type="text" class="form-control" placeholder="Hotel Name" name="hotelName" id="hotelName" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Hotel Description</label>
						<textarea class="form-control" name="hotelDesc" placeholder="Hotel Description" id="hotelDesc"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Hotel Image:</label>
                        <input type="file" class="form-control" name="hotelImg1" id="hotelImg1" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Hotel Price:</label>
						<input class="form-control" type="text" name="price" placeholder="Hotel Price" id="price" required>
                    </div>

                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Hotel Location:</label>
						<textarea class="form-control" name="location" placeholder="Hotel Location" id="location"></textarea>
                    </div>
                </div>
                <div class="modal-footer" style="border-color: #444;">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-info" name="addhotel">Add Hotel</button>
                </div>
            </form>
            </div>
        </div>
        </div>

</div>

<br/>
    <label class="text-white font-weight-bold"> Select No.of.rows to display :</label>
      <select class="form-control" style="background-color: #2d2d2d; color: #e0e0e0; border-color: #444;" name="state" id="maxRows">
            <option value="5000">Show ALL Rows</option>
            <option value="5">5</option>
            <option value="10">10</option>
            <option value="15">15</option>
            <option value="20">20</option>
            <option value="50">50</option>
            <option value="70">70</option>
            <option value="100">100</option>
        </select>


        <div class="table-responsive mt-4">
            <table class="content-table table" id="table-id">
                <thead>
                    <tr>
                    <th>HOTEL_NAME</th>
                    <th>HOTEL_DESCRIPTION</th>
                    <th>HOTEL_IMG</th>
                    <th>HOTEL_PRICE</th>
                    <th>LOCATION</th>
                    <th>ACTION</th>
                </tr>
            </thead>
                <tbody>
                	 <c:forEach var="allhotel" items="${Hotellist}" >
			            <tr>
			            <td>${allhotel.hotelName}</td>
			            <td>${fn:substring(allhotel.hotelDesc, 0, 100)}...  </td>
			           <td><img src="data:image/jpeg;base64,${allhotel.hotelImg1}" class="rounded-circle" width="100" height="100"/></td>
			            <td>${allhotel.price}</td>
			            <td>${allhotel.location}</td>
                        <td class="d-flex">
                            <a class="btn btn-info edit" data-toggle="modal" name="edit_user" data-target="#EdithotelModal" data-whatever="@mdo">EDIT</a>
					         <input type="hidden" value="${allhotel.id}" id="edit_id">
                            <a href="/admindeletehotel/${allhotel.id}" class="btn btn-danger ml-2" onclick='return deleteHotel()'>DELETE</a>
                        </td>
                        </tr>
                    </c:forEach>
                </tbody>
                </table>
            </div>

              <div class='pagination-container mt-4'>
            <nav>
                <ul class="pagination">
                   <li class="page-item" style="cursor:pointer;" data-page="prev" ><span class="page-link"> < <span class="sr-only">(current)</span></span></li>
                   <!--	Here the JS Function Will Add the Rows -->
                    <li class="page-item" style="cursor:pointer;"  data-page="next" id="prev"><span class="page-link"> > <span class="sr-only">(current)</span></span></li>
                </ul>
            </nav>
        </div>

        </div>
        </div>
    </div>

     <!-- Edit User modal -->
			 <div class="modal fade" id="EdithotelModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
					<div class="modal-header" style="border-color: #444;">
						<h5 class="modal-title text-white">Edit Hotel</h5>
						<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="/EdithotelForm" modelAttribute="hotelEditForm" method="POST" enctype="multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" name="subadmin" value="not"/>
							<input type="hidden" name="superadmin" value="not"/>
						<input type="hidden" name="id" id="hotel_id">
						<div class="modal-body">

							<div class="modal-body">

								<div class="form-group">
									<label for="message-text" class="col-form-label">Hotel Name:</label>
									<input type="text" class="form-control" placeholder="Hotel name" name="hotelName" id="hotelName1" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Hotel Description:</label>
									<input type="text" class="form-control" placeholder="Hotel Desc" name="hotelDesc" id="hotelDesc1" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Hotel price:</label>
									<input type="text" class="form-control" placeholder="hotel price Id" name="price" id="price1" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Address:</label>
									<textarea class="form-control" name="location" placeholder="Hotel location" id="location1"></textarea>
								</div>
								<div class="form-group">
                       			 <label for="message-text" class="col-form-label">Hotel Image:</label>
                     		   <input type="file" class="form-control" name="hotelImg1" id="hotelImg11">
                  			  </div>
							</div>
						</div>
						<div class="modal-footer" style="border-color: #444;">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-info" name="EditHotel">Edit Hotel</button>
						</div>
					</form>
					</div>
				</div>
				</div>

<script>
    function deleteHotel() {
        return confirm("Are you sure you want to delete this hotel?");
    }
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $('table .edit').click(function ()
        {
			var id=$(this).parent().find('#edit_id').val();

			console.log(id)
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hotelfind/"+id, //this is my servlet
                data: "input=" +$('#ip').val()+"&output="+$('#op').val(),
                success: function(allhotel){
                		$('#EdithotelModal #hotel_id').val(allhotel.id);
                        $('#EdithotelModal #hotelName1').val(allhotel.hotelName);
						$('#EdithotelModal #hotelDesc1').val(allhotel.hotelDesc);
						$('#EdithotelModal #location1').val(allhotel.location);
						$('#EdithotelModal #price1').val(allhotel.price);
						$('#EdithotelModal #hotelImg11').val(allhotel.hotelImg1);
                }
            });
        });
    });
</script>

<jsp:include page="includes/footer.jsp" />
<%}%>