<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="includes/header.jsp" />

<jsp:include page="includes/adminNav.jsp" />

        <!-- Page Content  -->
        <div id="content" class="bg-gray-50">

            <nav class="navbar navbar-expand-lg navbar-dark bg-gray-800 shadow-lg">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="btn btn-outline-light rounded-pill">
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

                    <div class="input-group shadow-sm">
                        <input class="form-control border-gray-300 rounded-left-pill"
                               type="search" name="valueToSearch" placeholder="Search catering..." aria-label="Search" value="${catering_keyword}">
                        <div class="input-group-append">
                            <button class="btn btn-dark text-white rounded-right-pill" type="submit" name="search">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <button type="button" class="btn btn-dark text-white rounded-pill shadow"
                        name="add_cater" data-toggle="modal" data-target="#AddcaterModal" data-whatever="@mdo">
                    <i class="fas fa-plus mr-2"></i>Add Catering
                </button>
            </div>

            <!-- Add Catering Modal -->
            <div class="modal fade" id="AddcaterModal" tabindex="-1" role="dialog" aria-labelledby="AddcaterModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-gray-800 text-white">
                            <h5 class="modal-title">Add New Catering Service</h5>
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
                                            <label class="font-weight-bold text-gray-700">Catering Name:</label>
                                            <input type="text" class="form-control" placeholder="Enter catering name" name="catername" id="catername" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="font-weight-bold text-gray-700">Price:</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text bg-gray-200">$</span>
                                                </div>
                                                <input class="form-control" type="text" name="cater_price" placeholder="0.00" id="cater_price" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="font-weight-bold text-gray-700">Image:</label>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" name="cater_img" id="cater_img" required>
                                                <label class="custom-file-label">Choose file</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="font-weight-bold text-gray-700">Description:</label>
                                            <textarea class="form-control" name="cater_desc" placeholder="Enter description" id="cater_desc" rows="3"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label class="font-weight-bold text-gray-700">Location:</label>
                                            <textarea class="form-control" name="cater_location" placeholder="Enter location" id="cater_location" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-dark text-white" name="addcater">Add Service</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="card shadow border-0">
                <div class="card-header bg-gray-800 text-white py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="mb-0 font-weight-light">Catering Services</h5>
                        <div class="form-group mb-0">
                            <label class="mr-2 mb-0 text-light">Rows:</label>
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
                            <thead class="bg-gray-200">
                                <tr>
                                    <th class="font-weight-bold text-gray-700">SERVICE NAME</th>
                                    <th class="font-weight-bold text-gray-700">DESCRIPTION</th>
                                    <th class="font-weight-bold text-gray-700">IMAGE</th>
                                    <th class="font-weight-bold text-gray-700">PRICE</th>
                                    <th class="font-weight-bold text-gray-700">LOCATION</th>
                                    <th class="font-weight-bold text-gray-700 text-center">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="allcater" items="${caterlist}">
                                    <tr>
                                        <td class="align-middle font-weight-medium">${allcater.catername}</td>
                                        <td class="align-middle" style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${allcater.cater_desc}</td>
                                        <td class="align-middle">
                                            <img src="data:image/jpeg;base64,${allcater.cater_img}"
                                                 class="rounded"
                                                 width="80" height="80" style="object-fit: cover;"/>
                                        </td>
                                        <td class="align-middle font-weight-medium">$${allcater.cater_price}</td>
                                        <td class="align-middle">${allcater.cater_location}</td>
                                        <td class="align-middle text-center">
                                            <button class="btn btn-sm btn-outline-dark edit" data-toggle="modal" name="edit_cater" data-target="#EditcaterModal"
                                                    data-whatever="@mdo">
                                                <i class="fas fa-edit mr-1"></i>Edit
                                            </button>
                                            <input type="hidden" value="${allcater.id}" id="edit_id">
                                            <a href="/admindeletecater/${allcater.id}" class="btn btn-sm btn-outline-danger ml-2" onclick='return deleteCatering()'>
                                                <i class="fas fa-trash-alt mr-1"></i>Delete
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="pagination-container p-3 bg-gray-100 border-top">
                        <nav>
                            <ul class="pagination justify-content-center mb-0">
                                <li class="page-item" style="cursor:pointer;" data-page="prev">
                                    <span class="page-link bg-gray-800 text-white">
                                        <i class="fas fa-chevron-left"></i>
                                    </span>
                                </li>
                                <!-- Here the JS Function Will Add the Rows -->
                                <li class="page-item" style="cursor:pointer;" data-page="next" id="prev">
                                    <span class="page-link bg-gray-800 text-white">
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
                <div class="modal-header bg-gray-800 text-white">
                    <h5 class="modal-title">Edit Catering Service</h5>
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
                                    <label class="font-weight-bold text-gray-700">Catering Name:</label>
                                    <input type="text" class="form-control" name="catername" id="caterName1" required>
                                </div>
                                <div class="form-group">
                                    <label class="font-weight-bold text-gray-700">Price:</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-gray-200">$</span>
                                        </div>
                                        <input type="text" class="form-control" name="cater_price" id="price1" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="font-weight-bold text-gray-700">Description:</label>
                                    <textarea class="form-control" name="cater_desc" id="caterDesc1" rows="3" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label class="font-weight-bold text-gray-700">Location:</label>
                                    <textarea class="form-control" name="cater_location" id="location1" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold text-gray-700">Update Image (optional):</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" name="cater_img" id="caterImg11">
                                <label class="custom-file-label">Choose new image</label>
                            </div>
                            <small class="text-muted">Leave blank to keep current image</small>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-dark text-white" name="Editcater">
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
        });

        function deleteCatering() {
            return confirm('Are you sure you want to delete this catering service?');
        }
    </script>

<jsp:include page="includes/footer.jsp" />

<%}%>