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
        $("#login").click(function () {
            var uname = $("input[name='name']").val();
            var upwd = $("input[name='pwd']").val();
            $.ajax({
                url: "longin",
                type: "post",
                data: {uname: uname, upwd: upwd},
                dataType: "JSON",
                success: function (data) {
                    /* console.log(data) */
                    window.location.href = "success.jsp"
                },
                error: function () {

                }
            })
        })
    })
</script>
<body>
<form action="longin" method="post">
    name:<input type="text" name="name"/>
    pwd:<input type="text" name="pwd"/>
    <input type="button" id="login" value="longin"/>
</form>
</body>
</html>