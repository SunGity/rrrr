<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.8.3(1).js"></script>
<script type="text/javascript">
    $(function () {
        $("#zhu").click(function () {
            var uname = $("input[name='uname']").val();
            var upwd = $("input[name='upwd']").val();
            var usex = $("input[name='usex']").val();
            var username = $("input[name='username']").val();
            $.ajax({
                url: "zc",
                type: "post",
                data: {uname: uname, upwd: upwd, usex: usex, username: username},
                dataType: "JSON",
                success: function (data) {
                    /* console.log(data) */
                    if (data == 1) {
                        alert("注册成功!")
                        window.location.href = "longin.jsp"
                    } else {
                        alert("此用户名太受欢迎!")
                        window.location.href = "zhuce.jsp"
                    }

                },
                error: function () {

                }
            })
        })
    })
</script>
<body>
<form action="zhuce" method="post">
    name:<input type="text" name="uname"/>
    pwd:<input type="text" name="upwd"/>
    sex:<input type="text" name="usex"/>
    username<input type="text" name="username"/>
    <input type="button" value="注册" id="zhu"/>
</form>
</body>
</html>