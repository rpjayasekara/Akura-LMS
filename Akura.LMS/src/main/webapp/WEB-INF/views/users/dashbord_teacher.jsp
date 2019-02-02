
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Need to implement security-->
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Patron Dashboard</title>
    <meta name="generator" content="Bootply"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--[if lt IE 9]> -->
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Bitter' rel='stylesheet' type='text/css'>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.3/angular.min.js"></script>

</head>
<style>
    /*<!-- Making the form awesome --> */
    .form-style-9 {
        max-width: 450px;
        background: #FAFAFA;
        padding: 30px;
        margin: 50px auto;
        box-shadow: 1px 1px 25px rgba(0, 0, 0, 0.35);
        border-radius: 10px;
        border: 6px solid #305A72;
    }

    .form-style-9 ul {
        padding: 0;
        margin: 0;
        list-style: none;
    }

    .form-style-9 ul li {
        display: block;
        margin-bottom: 10px;
        min-height: 35px;
    }

    .form-style-9 ul li .field-style {
        box-sizing: border-box;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        padding: 8px;
        outline: none;
        border: 1px solid #B0CFE0;
        -webkit-transition: all 0.30s ease-in-out;
        -moz-transition: all 0.30s ease-in-out;
        -ms-transition: all 0.30s ease-in-out;
        -o-transition: all 0.30s ease-in-out;
    }

    .form-style-9 ul li .field-style:focus {
        box-shadow: 0 0 5px #B0CFE0;
        border: 1px solid #B0CFE0;
    }

    .form-style-9 ul li .field-split {
        width: 49%;
    }

    .form-style-9 ul li .field-full {
        width: 100%;
    }

    .form-style-9 ul li input.align-left {
        float: left;
    }

    .form-style-9 ul li input.align-right {
        float: right;
    }

    .form-style-9 ul li textarea {
        width: 100%;
        height: 100px;
    }

    .form-style-9 ul li input[type="button"],
    .form-style-9 ul li input[type="submit"] {
        -moz-box-shadow: inset 0px 1px 0px 0px #3985B1;
        -webkit-box-shadow: inset 0px 1px 0px 0px #3985B1;
        box-shadow: inset 0px 1px 0px 0px #3985B1;
        background-color: #216288;
        border: 1px solid #17445E;
        display: inline-block;
        cursor: pointer;
        color: #FFFFFF;
        padding: 8px 18px;
        text-decoration: none;
        font: 12px Arial, Helvetica, sans-serif;
    }

    .form-style-9 ul li input[type="button"]:hover,
    .form-style-9 ul li input[type="submit"]:hover {
        background: linear-gradient(to bottom, #2D77A2 5%, #337DA8 100%);
        background-color: #28739E;
    }

    /*End form styling*/
    /*Making the modal box awesome*/
    .modal {
        /*//height: 45%;*/
        text-align: center;
        padding: 0 !important;
    }

    .modal-body {
        height: 100%;
    }

    .modal-dialog {
        width: 95%;
        display: inline-block;
        text-align: left;
        vertical-align: middle;
    }

    #viewBooksModal {
        width: 60%;
        left: 40%;
    }

    #viewBooksContent {
        width: 101%;
    }

    /*End modal styling*/
</style>
<script type="text/javascript" th:inline="javascript">
    displayForms = function (link, formId) {
        // disable subsequent clicks
        link.onclick = function (event) {
            event.preventDefault();
        }
        document.getElementById(formId).style.display = "block";
    }
    $(document).ready(function () {

        $("#homeLink").click(function () {
            window.open('${pageContext.request.contextPath}/user/${userId}/dashboard', '_self', false);
            <%--window.open('${pageContext.request.contextPath}/dashboard', '_self', false);--%>
        });
        var uemail = '${users.useremail}';
        console.log(uemail);
        var userid = '${users.id}';
        console.log(userid);
        $("#loggedinusername").text(uemail);

//        $("#addBtn").click(function () {
//            $('#addBookModal').modal('show');
//        });
//        $("#addBtn1").click(function () {
//            $('#addBookModal').modal('show');
//        });

        $("#mybooks").click(function () {
            getBooksData();
            <%--var url = "${pageContext.request.contextPath}/user/${userId}/books";--%>
            <%--$.get(url, null, function (data) {--%>
            <%--console.log("here");--%>
            <%--console.log("" + data);--%>
            <%--});--%>
            window.open('${pageContext.request.contextPath}/user/${userId}/books', '_self', false)
        });
        
        $("#mystudents").click(function () {
            getBooksData();
            <%--var url = "${pageContext.request.contextPath}/user/${userId}/books";--%>
            <%--$.get(url, null, function (data) {--%>
            <%--console.log("here");--%>
            <%--console.log("" + data);--%>
            <%--});--%>
            window.open('${pageContext.request.contextPath}/user/${userId}/students', '_self', false)
        });

        $("#viewBooksBtn").click(function () {
            getBooksData();
            $('#viewBooksModal').modal('show');

        });
        $("#viewBooksBtn1").click(function () {
            getBooksData();
            $('#viewBooksModal').modal('show');
        });

        $("#retbtn").click(function () {

            console.log("user url " + userUrl)
            $.get(userUrl, null, function () {

            });
            // window.location = userUrl;
            //  $('#viewBooksModal').modal('show');
        });

        getBooksData = function () {
            var url = "${pageContext.request.contextPath}/user/${userId}/books/";
            console.log("here in function");
            $.get(url, null, function (data) {
                console.log("here");
                console.log("" + data);
                var mymodal = $('#viewBooksModal');
                mymodal.find('.modal-body').text('');
                var jsonData = data;
                console.log(jsonData.length);
                console.log(jsonData);

                var html = '<div class="table-responsive">' +
                    '<table class="table">' +
                    '<thead>' +
                    '<tr>' +
                    '<th>ID </th>' +
                    '<th>ISBN </th>' +
                    '<th>Title </th>' +
                    '<th>Location </th>' +
                    '<th>No. of copies </th>' +
                    '<th>Author </th>' +
                    '<th>Publisher </th>'
                '</tr>';
                for (i = 0; i < jsonData.length; i++) {
                    //console.log("title string"+JSON.stringify(jsonData[i]));
                    html = html + '<tr>';
                    html = html + '<td>' + jsonData[i].bookId + '</td>';
                    html = html + '<td>' + jsonData[i].isbn + '</td>';
                    html = html + '<td>' + jsonData[i].title + '</td>';
                    html = html + '<td>' + jsonData[i].location + '</td>';
                    html = html + '<td>' + jsonData[i].author + '</td>';
                    html = html + '<td>' + jsonData[i].callnumber + '</td>';
                    html = html + '<td>' + jsonData[i].keywords + '</td>';
                    var userUrl = "${pageContext.request.contextPath}/user/${userId}/book/" + jsonData[i].bookId;
                    console.log(userUrl);
                    // html = html + '<td>'+ '<button class="btn btn-info" id="retbtn"  >Return it </button>' +'</td>';

                    html = html + '</tr>';
                }
                html = html + '</table>';
                html = html + '</div>';

                mymodal.find('.modal-body').append(html);

            });

        }


        $("#searchBtn").click(function () {
            $('#searchBooksModal').modal('show');
        });

        $("#searchBtn1").click(function () {
            $('#searchBooksModal').modal('show');
        });

    });
</script>
<body>
<!-- header -->


<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">LMS- Group2 Dashboard</a>
        </div>
        <spring:url value="/register" var="userlogout"/>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <p style=" color: white; padding-top: 10px" id="loggedinusername"><i
                    ></i> Admin <span class="caret"></span></p>
                </li>
                <li><a class="navbar-brand" style="padding-left:30px; color: white;" href="${userlogout}"/>Logout</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- /container -->
</div>
<!-- /Header -->

<!-- Main -->
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3">
            <!-- Left column -->
            <%--<a href="#"><strong><i class="glyphicon glyphicon-wrench"></i> Tools</strong></a>--%>

            <hr>

            <ul class="nav nav-stacked">
                <li class="nav-header"><a href="#" data-toggle="collapse" data-target="#userMenu">Settings <i
                        class="glyphicon glyphicon-chevron-down"></i></a>
                    <ul class="nav nav-stacked collapse in" id="userMenu">
                        <li class="active"><a id="homeLink" href="#"><i class="glyphicon glyphicon-home"></i> Home</a>
                        </li>
                        <%--<li><a id="addBtn1" href="#"><i class="glyphicon glyphicon-plus-sign"></i> Add a Book</a></li>--%>
                        <li><a id="searchBtn1" href="#"><i class="glyphicon glyphicon-search"></i> Search a Book</a>
                        </li>
                        <%--<li><a href="#"><i class="glyphicon glyphicon-remove"></i> Remove a Book</a></li>--%>
                        <%--<li><a id="viewBooksBtn1" href="#"><i class="glyphicon glyphicon-list"></i> View all books</a>--%>
                        </li>
                        <li><a id="mystudents" href="#"><i class="glyphicon glyphicon-flag"></i>My Books</a></li>
                        <li><a id="mybooks" href="#"><i class="glyphicon glyphicon-flag"></i>My Books</a></li>
                        <li><a href="${userlogout}"><i class="glyphicon glyphicon-off"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>

            <hr>

            <hr>

            <hr>
        </div>
        <div class="row">
            <!-- center left-->
            <div class="col-md-6">
                <div style="font-weight: bold; text-align: center; vertical-align: middle" class="well">
                    <i class="glyphicon glyphicon-education"></i>&nbsp;&nbsp;Library
                </div>

                <hr>

            
                <div class="modal fade" id="viewBooksModal" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" id="viewBooksContent">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="viewbooksmodalid">List of all the books in LMS</h4>
                            </div>
                            <div class="modal-body">
                                <form:form class="form-style-9" method="post"
                                           action="/user/${userId}/book/${book.bookId}"
                                           modelAttribute="book" id="viewbooksform">
                                    <c:forEach var="book" items="${books}">
                                        <tr>
                                            <td>${book.isbn}</td>
                                            <td>${book.title}</td>
                                            <td>${book.author}</td>
                                            <td>${book.current_status}</td>
                                            <td><input type="submit" value="Return it"/></td>
                                        </tr>
                                    </c:forEach>

                                </form:form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <%--<button type="button" class="btn btn-primary">Add Book </button>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END: Modal for viewing books -->

                <div class="modal fade" id="searchBooksModal" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" id="searchBooksContent">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="searchbooksmodalid">Search Books</h4>
                            </div>
                            <div class="modal-body">
                                <form:form class="form-style-9" method="post"
                                           action="${pageContext.request.contextPath}/user/${userId}"
                                           modelAttribute="book" id="searchbooksform">

                                    <ul>
                                        <li>
                                            <input type="text" class="field-style field-split align-left"
                                                   name="isbn" placeholder="ISBN" path="isbn">
                                            <input type="text" name="title" path="title"
                                                   class="field-style field-split align-right" placeholder="Title"
                                            />
                                        </li>
                                        <li>
                                            <input type="text" name="author" path="author"
                                                   class="field-style field-split align-left" placeholder="Author"
                                            />
                                            <input type="text" name="publisher" path="publisher"
                                                   class="field-style field-split align-right"
                                                   placeholder="Publisher"/>
                                        </li>
                                        <li>
                                            <select class="selectpicker" name="current_status"
                                                    data-style="btn-info">
                                                <option>Available</option>
                                                <option>Hold</option>
                                                <option>Wait-Listed</option>
                                            </select>
                                            <%--<input type="text" name="keywords"--%>
                                            <%--class="field-style field-full align-none"--%>
                                            <%--placeholder="Keywords"/>--%>
                                            <%--</li>--%>

                                        <li>
                                            <input type="submit" value="Search"/>
                                        </li>
                                    </ul>
                                </form:form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="btn-group btn-group-justified">
                    <%--<a id="addBtn" href="#" class="btn btn-primary col-sm-3">--%>
                    <%--<i class="glyphicon glyphicon-plus"></i>--%>
                    <%--<br> Add--%>
                    <%--</a>--%>
                    <a href="#" id="searchBtn" class="btn btn-primary col-sm-3">
                        <i class="glyphicon glyphicon-search"></i>
                        <br> Search
                    </a>
                    <%--<a href="#" class="btn btn-primary col-sm-3">--%>
                    <%--<i class="glyphicon glyphicon-remove"></i>--%>
                    <%--<br> Remove--%>
                    <%--</a>--%>
                        <%--<a id="viewBooksBtn" href="#" class="btn btn-primary col-sm-3">--%>
                        <%--<i class="glyphicon glyphicon-list"></i>--%>
                        <%--<br> List--%>
                        <%--</a>--%>
                </div>

                <hr>

                <div id="reportsdata" class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Reports</h4></div>
                    <security:authorize access="hasRole('ROLE_PATRON')">
                        <h2>This text is only visible to a user</h2>
                        <br/>
                    </security:authorize>

                    <security:authorize access="hasRole('ROLE_LIBRARIAN')">
                        <h2>This text is only visible to an admin</h2>
                        <br/>
                    </security:authorize>
                    <div class="panel-body">

                        <small>Available</small>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="72"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 72%">
                                <span class="sr-only">72% Complete</span>
                            </div>
                        </div>
                        <small>Hold</small>
                        <div class="progress">
                            <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar"
                                 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                <span class="sr-only">20% Complete</span>
                            </div>
                        </div>
                        <small>WaitListed</small>
                        <div class="progress">
                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                <span class="sr-only">60% Complete (warning)</span>
                            </div>
                        </div>
                        <small>Failures</small>
                        <div class="progress">
                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                <span class="sr-only">80% Complete</span>
                            </div>
                        </div>
                    </div>
                    <!--/panel-body-->
                </div>
                <!--/panel-->

                <hr>

             
        </div>
        <!--/col-span-9-->
    </div>
</div>
<!-- /Main -->

<footer class="text-center">Credits: This Bootstrap 3 dashboard layout is compliments of <a
        href="http://www.bootply.com/85850"><strong>Bootply.com</strong></a></footer>

<%--<div class="modal" id="addWidgetModal">--%>
<%--<div class="modal-dialog">--%>
<%--<div class="modal-content">--%>
<%--<div class="modal-header">--%>
<%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
<%--<h4 class="modal-title">Add Widget</h4>--%>
<%--</div>--%>
<%--<div class="modal-body">--%>
<%--<p>Add a widget stuff here..</p>--%>
<%--</div>--%>
<%--<div class="modal-footer">--%>
<%--<a href="#" data-dismiss="modal" class="btn">Close</a>--%>
<%--<a href="#" class="btn btn-primary">Save changes</a>--%>
<%--</div>--%>
<%--</div>--%>
<%--<!-- /.modal-content -->--%>
<%--</div>--%>
<%--<!-- /.modal-dalog -->--%>
<%--</div>--%>
<!-- /.modal -->
<!-- script references -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
