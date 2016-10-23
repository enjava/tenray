<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>

注册成功
<%
PrintWriter outjs = response.getWriter();
 outjs.print("<script>alert('注册成功,请登录!);window.location.reload("index.jsp");</script>");
 return null;
  %>
</body>

</html>