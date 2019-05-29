<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.8.3(1).js"></script>
<script type="text/javascript">
    $(function () {
        $("#up").click(function () {
            var uname = $("input[name='uname']").val();
            var upwd = $("input[name='upwd']").val();
            var usex = $("input[name='usex']").val();
            var username = $("input[name='username']").val();
            var ustate = $("input[name='ustate']").val();
            $.ajax({
                url: "update",
                type: "post",
                data: {uname: uname, upwd: upwd, usex: usex, username: username, ustate: ustate},
                dataType: "JSON",
                success: function (data) {
                    /* console.log(data) */
                    if (data == 1) {
                        alert("修改成功!")
                        window.location.href = "success.jsp"
                    } else {
                        alert("此用户名义被占用!")
                        window.location.href = "success.jsp"
                    }

                },
                error: function () {

                }
            })
        })
    })
</script>
<body>
<form action="update" method="post">
    <input type="hidden" name="uid" value="${user.uid}"/><br/>
    name:<input type="text" name="uname" value="${user.uname }"/><br/>
    pwd:<input type="text" name="upwd" value="${user.upwd }"/><br/>
    sex:<input type="text" name="usex" value="${user.usex }"/><br/>
    username:<input type="text" name="username" value="${user.username }"/><br/>
    udata:<input type="text" name="udata" value="<fmt:formatDate value='${user.udata}' pattern='yyyy-MM-dd hh:mm:ss'/>"
                 min="2017-06-30T00:00"/><br/>
    sta:<input type="text" name="ustate" value="${user.ustate }"/><br/>
    <input type="button" value="update" id="up"/>
</form>
</body>
</html>