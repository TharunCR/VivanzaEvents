<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="includes/header.jsp" />

<jsp:include page="includes/adminNav.jsp" />

<style>
    :root {
        --dark-bg: #121212;
        --darker-bg: #0a0a0a;
        --light-text: #e0e0e0;
        --lighter-text: #ffffff;
        --accent-color: #4fc3f7;
        --hover-effect: brightness(1.2);
        --transition: all 0.3s ease;
        --card-bg: #1e1e1e;
        --border-color: #333;
    }

    body {
        background-color: var(--dark-bg);
        color: var(--light-text);
        transition: var(--transition);
    }

    .navbar {
        background-color: var(--darker-bg) !important;
        border-bottom: 1px solid var(--border-color);
    }

    .btn-info {
        background-color: var(--accent-color);
        border-color: var(--accent-color);
        color: #121212;
        transition: var(--transition);
    }

    .btn-info:hover {
        filter: var(--hover-effect);
        color: #121212;
    }

    .text-info {
        color: var(--accent-color) !important;
    }

    .table {
        color: var(--light-text);
        background-color: var(--card-bg);
    }

    .table thead th {
        border-bottom: 1px solid var(--border-color);
    }

    .table td, .table th {
        border-top: 1px solid var(--border-color);
    }

    .modal-content {
        background-color: var(--darker-bg);
        color: var(--light-text);
    }

    .close {
        color: var(--light-text);
        text-shadow: 0 1px 0 #000;
    }

    .form-control {
        background-color: #2d2d2d;
        border: 1px solid var(--border-color);
        color: var(--light-text);
    }

    .form-control:focus {
        background-color: #3d3d3d;
        color: var(--lighter-text);
        border-color: var(--accent-color);
        box-shadow: 0 0 0 0.2rem rgba(79, 195, 247, 0.25);
    }

    .page-link {
        background-color: var(--card-bg);
        border: 1px solid var(--border-color);
        color: var(--accent-color);
    }

    .page-item.active .page-link {
        background-color: var(--accent-color);
        border-color: var(--accent-color);
        color: #121212;
    }

    .btn-danger {
        transition: var(--transition);
    }

    .btn-danger:hover {
        filter: var(--hover-effect);
    }

    .pagination-container {
        background-color: var(--card-bg);
        padding: 10px;
        border-radius: 5px;
    }

    /* Glow effect on hover for table rows */
    tr:hover {
        box-shadow: 0 0 15px rgba(79, 195, 247, 0.3);
        transform: translateY(-1px);
        transition: var(--transition);
    }

    /* Smooth fade-in animation for modal */
    .modal.fade .modal-dialog {
        transform: translate(0, -50px);
        opacity: 0;
        transition: all 0.3s ease-out;
    }

    .modal.show .modal-dialog {
        transform: translate(0, 0);
        opacity: 1;
    }

    /* Custom scrollbar */
    ::-webkit-scrollbar {
        width: 8px;
    }

    ::-webkit-scrollbar-track {
        background: var(--darker-bg);
    }

    ::-webkit-scrollbar-thumb {
        background: var(--accent-color);
        border-radius: 4px;
    }

    /* Input placeholder color */
    ::placeholder {
        color: #aaa !important;
        opacity: 1;
    }
</style>

    <!-- Page Content  -->
    <div id="content" style="background-color: var(--dark-bg);">

         <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <div>
                    	<h3 class="text-info">EVENT DETAILS</h3>
                    </div>
                   <div>
                    	<p class="text-white">Welcome
                    	<% if(session.getAttribute("Admin_gender").equals("male")){ %>
                    		Mr.
                    	<%}else{%>
                    		Miss.
                    	<%}%>
                    	<span class="font-weight-bold text-info">${Admin_firstname} ${Admin_lastname}</span></p>
                    </div>
                </div>
            </nav>

    <div>

<nav class="d-flex justify-content-between">

  		<form class="d-flex"  action="/admineventSearch"  method="post" autocomplete="off">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			<input class="form-control bg-dark text-white" type="search" name="valueToSearch" placeholder="Value To Search" aria-label="Search" value="${event_keyword}">
            <button class="btn ml-2 btn-info" type="submit" name="search">Search</button>
        </form>

     <form class="d-flex">
        <button type="button" class="btn btn-info ml-2" name="add_event" data-toggle="modal" data-target="#AddeventModal" data-whatever="@mdo">Add event</button>
    </form>

     <!-- Add User modal -->
     <div class="modal fade" id="AddeventModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-white" id="exampleModalLabel">Add event</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/addeventForm" modelAttribute="eventForm"  method="POST" enctype= "multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="superadmin" value="not"/>
				<input type="hidden" name="subadmin" value="not"/>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="message-text" class="col-form-label text-white">Event Name:</label>
                        <input type="text" class="form-control bg-dark text-white" placeholder="Event Name" name="eventname" id="eventname" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label text-white">Event Description</label>
						<textarea class="form-control bg-dark text-white" name="event_desc" placeholder="Event Description" id="event_desc"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label text-white">Event Image:</label>
                        <input type="file" class="form-control bg-dark text-white" name="event_img" id="event_img" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-info" name="addevent">Add event</button>
                </div>
            </form>
            </div>
        </div>
        </div>

</nav>

<br /><br/>

    <label class="text-info font-weight-bold"> Select No.of.rows to display :</label>
      <select class="form-control bg-dark text-white" name="state" id="maxRows">
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
                    <th>EVENT_NAME</th>
                    <th>EVENT_DESCRIPTION</th>
                    <th>EVENT_IMG</th>
                    <th>ACTION</th>
                </tr>
            </thead>
                <tbody>
                	 <c:forEach var="allevent" items="${eventlist}" >
			            <tr>
			            <td>${allevent.eventname}</td>
			            <td>${fn:substring(allevent.event_desc, 0, 100)}...</td>
			           <td><img src="data:image/jpeg;base64,${allevent.event_img}" class="rounded-circle" width="100" height="100"/></td>
                        <td class="d-flex">
                            <a class="btn btn-info edit" data-toggle="modal" name="edit_event" data-target="#EditeventModal" data-whatever="@mdo">EDIT</a>
					         <input type="hidden" value="${allevent.id}" id="edit_id">
                            <a href="/admindeleteevent/${allevent.id}" class="btn btn-danger ml-2" onclick='return deleteEvent()'>DELETE</a>
                        </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class='pagination-container mt-2'>
            <nav>
                <ul class="pagination">
                   <li class="page-item" style="cursor:pointer;" data-page="prev"><span class="page-link"> < <span class="sr-only">(current)</span></span></li>
                   <!--	Here the JS Function Will Add the Rows -->
                    <li class="page-item" style="cursor:pointer;"  data-page="next" id="prev"><span class="page-link"> > <span class="sr-only">(current)</span></span></li>
                </ul>
            </nav>
        </div>

    </div>
</div>

<!-- Edit User modal -->
<div class="modal fade" id="EditeventModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title text-white" id="exampleModalLabel">Edit Event</h5>
            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="/EditeventForm" modelAttribute="eventEditForm" method="POST" enctype= "multipart/form-data">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="superadmin" value="not"/>
            <input type="hidden" name="subadmin" value="not"/>
            <input type="hidden" name="id" id="event_id">
            <div class="modal-body">
                <div class="form-group">
                    <label for="message-text" class="col-form-label text-white">Event Name:</label>
                    <input type="text" class="form-control bg-dark text-white" placeholder="Event Name" name="eventname" id="eventName1" required>
                </div>
                <div class="form-group">
                    <label for="message-text" class="col-form-label text-white">Event Description:</label>
                    <input type="text" class="form-control bg-dark text-white" placeholder="Event Description" name="event_desc" id="eventDesc1" required>
                </div>
                <div class="form-group">
                    <label for="message-text" class="col-form-label text-white">Event Image:</label>
                    <input type="file" class="form-control bg-dark text-white" name="event_img" id="eventImg11">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-info" name="Editevent">Edit Event</button>
            </div>
        </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('table .edit').click(function () {
            var id=$(this).parent().find('#edit_id').val();
            console.log(id)
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/eventfind/"+id,
                data: "input=" +$('#ip').val()+"&output="+$('#op').val(),
                success: function(allevent){
                    $('#EditeventModal #event_id').val(allevent.id);
                    $('#EditeventModal #eventName1').val(allevent.eventname);
                    $('#EditeventModal #eventDesc1').val(allevent.event_desc);
                    $('#EditeventModal #eventImg11').val(allevent.event_img);
                }
            });
        });
    });
</script>

<jsp:include page="includes/footer.jsp" />

<%}%>