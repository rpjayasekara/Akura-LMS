<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../fragments/header.jsp"/>

<body>
<nav class="navbar navbar-inverse ">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/${userId}/dashboard">&nbsp; &nbsp;
                &nbsp; My Dashboard</a>

        </div>

    </div>
</nav>

<div class="container">

    <c:if test="${not empty msg}">
        <div class="alert alert-${css} alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>${msg}</strong>
        </div>
    </c:if>
    <div class="container">
    <h1>My Students</h1>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>E-mail</th>
            <th>See books</th>

        </tr>
        </thead>
        <p><font color="red">${errorMessage}</font></p>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.sjsuid}</td>
                <td>${student.useremail}</td>
                <td>
                    <spring:url value="/user/${userId}/${student.id}/studentbooks"
                                var="userUrl"/>
                    <button class="btn btn-info"
                            onclick="location.href='${userUrl}'">Click here
                    </button>
                  
                </td>

            </tr>
        </c:forEach>
    </table>
    </div>


</div>

<jsp:include page="../../fragments/footer.jsp"/>

</body>
</html>