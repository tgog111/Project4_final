<%--
  Created by IntelliJ IDEA.
  User: gongs
  Date: 2023-11-17
  Time: 오후 4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="com.example.project4_final.*, java.io.File" %>
<%@ page import ="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드 결과</title>
</head>

<body>
<%
    String filename = "";
    int sizeLimit = 15 * 1024 * 1024;

    String realPath = request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();

    MultipartRequest multpartRequest = null;
    multpartRequest = new MultipartRequest(request, realPath,
            sizeLimit, "utf-8",new DefaultFileRenamePolicy());
    filename = multpartRequest.getFilesystemName("photo");
%>

폼에서 전송된 원래 파일명
파일명: <%=filename%><br/>
<img src="${pageContext.request.contextPath}/upload/<%=filename%>">

</body>
</html>
