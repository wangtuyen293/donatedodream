<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:if test="${not empty sessionScope.user}">
    <meta name="currentUserId" content="${sessionScope.user.userId}"/>
</c:if>
