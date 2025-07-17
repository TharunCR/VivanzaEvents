<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="includes/header.jsp" />

<style>
    :root {
        --primary-bg: #121212;
        --secondary-bg: #1e1e1e;
        --card-bg: #252525;
        --text-primary: #e0e0e0;
        --text-secondary: #b0b0b0;
        --accent-color: #bb86fc;
        --accent-secondary: #03dac6;
        --danger-color: #cf6679;
        --border-color: #333333;
    }

    body {
        background-color: var(--primary-bg);
        color: var(--text-primary);
    }

    .card, .modal-content {
        background-color: var(--card-bg);
        border-color: var(--border-color);
    }

    .table {
        color: var(--text-primary);
    }

    .table thead th {
        background-color: var(--secondary-bg);
        border-color: var(--border-color);
    }

    .table tbody tr {
        background-color: var(--secondary-bg);
    }

    .table tbody tr:hover {
        background-color: rgba(187, 134, 252, 0.1);
    }

    .form-control, .custom-select, .custom-file-label {
        background-color: #2d2d2d;
        border-color: var(--border-color);
        color: var(--text-primary);
    }

    .form-control:focus {
        background-color: #3d3d3d;
        color: var(--text-primary);
        border-color: var(--accent-color);
        box-shadow: 0 0 0 0.2rem rgba(187, 134, 252, 0.25);
    }

    .page-link {
        background-color: var(--secondary-bg);
        border-color: var(--border-color);
        color: var(--text-primary);
    }

    .page-item.disabled .page-link {
        background-color: var(--secondary-bg);
        border-color: var(--border-color);
    }

    .page-item.active .page-link {
        background-color: var(--accent-color);
        border-color: var(--accent-color);
    }

    .navbar {
        background-color: var(--secondary-bg) !important;
        box-shadow: 0 2px 10px rgba(0,0,0,0.3);
    }

    .btn-dark {
        background-color: #333;
        border-color: #444;
    }

    .btn-outline-light {
        color: var(--text-primary);
        border-color: var(--text-secondary);
    }

    .btn-outline-light:hover {
        background-color: rgba(255,255,255,0.1);
    }

    .btn-outline-danger {
        color: var(--danger-color);
        border-color: var(--danger-color);
    }

    .btn-outline-danger:hover {
        background-color: rgba(207, 102, 121, 0.1);
    }

    .modal-header {
        background-color: var(--secondary-bg);
        border-bottom-color: var(--border-color);
    }

    .close {
        color: var(--text-primary);
    }

    .input-group-text {
        background-color: #333;
        border-color: var(--border-color);
        color: var(--text-primary);
    }

    .custom-file-label::after {
        background-color: #333;
        border-color: var(--border-color);
        color: var(--text-primary);
    }

    .img-thumbnail {
        background-color: var(--secondary-bg);
        border-color: var(--border-color);
    }

    /* Animation effects */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .fade-in {
        animation: fadeIn 0.4s ease-out forwards;
    }

    .hover-grow {
        transition: transform 0.2s ease;
    }

    .hover-grow:hover {
        transform: scale(1.02);
    }

    .glow-on-hover {
        transition: box-shadow 0.3s ease;
    }

    .glow-on-hover:hover {
        box-shadow: 0 0 15px rgba(187, 134, 252, 0.4);
    }

    .text-muted {
        color: #8a8a8a !important;
    }

    .border-top {
        border-top-color: var(--border-color) !important;
    }
</style>

<jsp:include page="includes/adminNav.jsp" />

<!-- Page Content -->
<div id="content" class="fade-in">

    <nav class="navbar navbar-expand-lg navbar-dark shadow-lg">
        <div class="container-fluid">
            <button type="button" id="sidebarCollapse" class="btn btn-outline-light rounded-pill glow-on-hover">
                <i class="fas fa-align-left mr-2"></i>
                <span>Toggle Sidebar</span>
            </button>
            <div>
                <h3 class="text-white font-weight-light">CATERING MANAGEMENT</h3>
            </div>
            <div class="text-light">
                <p class="mb-0">Welcome
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

        <div class="d-flex justify-content-between mt-3 mb-4">

            <form class="d-flex" action="/admincateringSearch" method="post" autocomplete="off">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <div class="input-group shadow-sm hover-grow">
                    <input class="form-control rounded-left-pill"
                           type="search" name="valueToSearch" placeholder="Search catering..." aria-label="Search" value="${catering_keyword}">
                    <div class="input-group-append">
                        <button class="btn btn-dark text-white rounded-right-pill" type="submit" name="search">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>

            <button type="button" class="btn btn-dark text-white rounded-pill shadow glow-on-hover"
                    name="add_cater" data-toggle="modal" data-target="#AddcaterModal" data-whatever="@mdo">
                <i class="fas fa-plus mr-2"></i>Add Catering
            </button>
        </div>

        <!-- Add Catering Modal -->
        <div class="modal fade" id="AddcaterModal" tabindex="-1" role="dialog" aria-labelledby="AddcaterModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-white">Add New Catering Service</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/addcaterForm" modelAttribute="caterForm" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" name="superadmin" value="not" />
                        <input type="hidden" name="subadmin" value="not" />
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Catering Name:</label>
                                        <input type="text" class="form-control" placeholder="Enter catering name" name="catername" id="catername" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-bold">Price:</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">$</span>
                                            </div>
                                            <input class="form-control" type="text" name="cater_price" placeholder="0.00" id="cater_price" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-bold">Image:</label>
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" name="cater_img" id="cater_img" required>
                                            <label class="custom-file-label">Choose file</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Description:</label>
                                        <textarea class="form-control" name="cater_desc" placeholder="Enter description" id="cater_desc" rows="3"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-bold">Location:</label>
                                        <textarea class="form-control" name="cater_location" placeholder="Enter location" id="cater_location" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" name="addcater" style="background-color: var(--accent-color); border-color: var(--accent-color);">Add Service</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="card shadow border-0 hover-grow">
            <div class="card-header py-3">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 font-weight-light text-white">Catering Services</h5>
                    <div class="form-group mb-0">
                        <label class="mr-2 mb-0">Rows:</label>
                        <select class="form-control form-control-sm" id="maxRows">
                            <option value="5000">All</option>
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                            <option value="50">50</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0" id="table-id">
                        <thead>
                            <tr>
                                <th class="font-weight-bold">SERVICE NAME</th>
                                <th class="font-weight-bold">DESCRIPTION</th>
                                <th class="font-weight-bold">IMAGE</th>
                                <th class="font-weight-bold">PRICE</th>
                                <th class="font-weight-bold">LOCATION</th>
                                <th class="font-weight-bold text-center">ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="allcater" items="${caterlist}">
                                <tr>
                                    <td class="align-middle font-weight-medium">${allcater.catername}</td>
                                    <td class="align-middle" style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${allcater.cater_desc}</td>
                                    <td class="align-middle">
                                        <img src="data:image/jpeg;base64,${allcater.cater_img}"
                                             class="rounded img-thumbnail"
                                             width="80" height="80" style="object-fit: cover;"/>
                                    </td>
                                    <td class="align-middle font-weight-medium">$${allcater.cater_price}</td>
                                    <td class="align-middle">${allcater.cater_location}</td>
                                    <td class="align-middle text-center">
                                        <button class="btn btn-sm btn-outline-light edit glow-on-hover" data-toggle="modal" name="edit_cater" data-target="#EditcaterModal"
                                                data-whatever="@mdo">
                                            <i class="fas fa-edit mr-1"></i>Edit
                                        </button>
                                        <input type="hidden" value="${allcater.id}" id="edit_id">
                                        <a href="/admindeletecater/${allcater.id}" class="btn btn-sm btn-outline-danger ml-2 glow-on-hover" onclick='return deleteCatering()'>
                                            <i class="fas fa-trash-alt mr-1"></i>Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination-container p-3 border-top">
                    <nav>
                        <ul class="pagination justify-content-center mb-0">
                            <li class="page-item" style="cursor:pointer;" data-page="prev">
                                <span class="page-link">
                                    <i class="fas fa-chevron-left"></i>
                                </span>
                            </li>
                            <!-- Here the JS Function Will Add the Rows -->
                            <li class="page-item" style="cursor:pointer;" data-page="next" id="prev">
                                <span class="page-link">
                                    <i class="fas fa-chevron-right"></i>
                                </span>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Edit Catering Modal -->
<div class="modal fade" id="EditcaterModal" tabindex="-1" role="dialog" aria-labelledby="EditcaterModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-white">Edit Catering Service</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/EditcaterForm" modelAttribute="caterEditForm" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="superadmin" value="not" />
                <input type="hidden" name="subadmin" value="not" />
                <input type="hidden" name="id" id="cater_id">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Catering Name:</label>
                                <input type="text" class="form-control" name="catername" id="caterName1" required>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Price:</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">$</span>
                                    </div>
                                    <input type="text" class="form-control" name="cater_price" id="price1" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Description:</label>
                                <textarea class="form-control" name="cater_desc" id="caterDesc1" rows="3" required></textarea>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Location:</label>
                                <textarea class="form-control" name="cater_location" id="location1" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">Update Image (optional):</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" name="cater_img" id="caterImg11">
                            <label class="custom-file-label">Choose new image</label>
                        </div>
                        <small class="text-muted">Leave blank to keep current image</small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary" name="Editcater" style="background-color: var(--accent-color); border-color: var(--accent-color);">
                        <i class="fas fa-save mr-2"></i>Save Changes
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('table .edit').click(function () {
            var id=$(this).parent().find('#edit_id').val();

            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/caterfind/"+id,
                success: function(allcater){
                        $('#EditcaterModal #cater_id').val(allcater.id);
                        $('#EditcaterModal #caterName1').val(allcater.catername);
                        $('#EditcaterModal #caterDesc1').val(allcater.cater_desc);
                        $('#EditcaterModal #location1').val(allcater.cater_location);
                        $('#EditcaterModal #price1').val(allcater.cater_price);
                }
            });
        });

        bsCustomFileInput.init();

        // Initialize tooltips
        $('[data-toggle="tooltip"]').tooltip();

        // Add animation to table rows
        $('#table-id tbody tr').each(function(i) {
            $(this).delay(i * 50).css({
                opacity: 0,
                transform: 'translateY(20px)'
            }).animate({
                opacity: 1,
                transform: 'translateY(0)'
            }, 300);
        });
    });

    function deleteCatering() {
        return confirm('Are you sure you want to delete this catering service?');
    }
</script>

<jsp:include page="includes/footer.jsp" />

<%}%>