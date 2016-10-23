<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: en
  Date: 2016/10/23
  Time: 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
<s:iterator value="users" status="st">
    <tr>
        <td><s:property value="id"/></td>
        <td><s:property value="username"/></td>
        <td><s:property value="password"/></td>
    </tr>
</s:iterator>
    </table>
</body>
</html>
