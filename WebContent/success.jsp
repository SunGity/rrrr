<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        $.ajax({
            url: "All",
            type: "get",
            dataType: "JSON",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var datetime = new Date(parseInt(data[i].udata)).toLocaleDateString().replace(/\//g, "-") + " "
                        + new Date(parseInt(data[i].udata)).toTimeString().substr(0, 8);
                    $("#ta").append("<tr><td><input type='checkbox' value=" + data[i].uid + " name='check'/></td><td>"
                        + data[i].uname + "</td><td>"
                        + data[i].usex + "</td><td>"
                        + datetime + "</td><td><button onclick='updateByid("
                        + data[i].uid + ")'>修改</button></td><td><button onclick='delByid("
                        + data[i].uid + ")'>删除</button></td></tr>");

                }


            },
            error: function () {

            }

        })

    })

    function updateByid(uid) {
        alert(uid);
        $.ajax({
            url: "selectupdate",
            type: "get",
            data: {uid: uid},
            dataType: "JSON",
            success: function (data) {
                /* console.log(data) */

                window.location.href = "update.jsp"


            },
            error: function () {

            }
        })
    }


    function delByid(uid) {
        alert(uid);
        $.ajax({
            url: "del",
            type: "get",
            data: {uid: uid},
            dataType: "JSON",
            success: function (data) {
                /* console.log(data) */
                if (data == 1) {
                    alert("删除成功!");
                    window.location.href = "success.jsp"
                } else {
                    alert("删除失败!");
                    window.location.href = "success.jsp"
                }

            },
            error: function () {

            }
        })
    }

    /* $(function(){
        $("#del").click(function(){
                var uid = [];
                $("input:checkbox").each(function(){
                    if($(this).prop("checked") == true){
                        uid+=$(this).val();
                    }
                })
                if(uid!=null){
                    window.location.href="piliang?uid="+uid;
                }
        })
    })  */

    function dele() {
        obj = document.getElementsByName("check");
        checkVal = [];
        for (k in obj) {
            if (obj[k].checked) checkVal.push(obj[k].value);
        }
        alert(checkVal);
        $.ajax({
            url: "piliang",
            type: "get",
            data: {uid: checkVal},
            traditional: true,
            dataType: "JSON",
            success: function (data) {
                /* console.log(data) */
                if (data == 1) {
                    alert("删除成功!");
                    window.location.href = "success.jsp"
                } else {
                    alert("删除失败!");
                    window.location.href = "success.jsp"
                }

            },
            error: function () {

            }
        })

        /* window.location.href = "piliang?uid="+checkVal;
         */
    }
</script>
<body>

欢迎${sessionScope.uname }<br/>
<a href="zhuce.jsp">添加新用户</a><br/>
<table id="ta">
    <tr>
        <td><a href="#" id="del" onclick=dele()>批量删除</a></td>
        <td>姓名：</td>
        <td>性别：</td>
        <td>日期：</td>
        <td>修改</td>
        <td>删除</td>
    </tr>
    <%-- <c:forEach items="${u }" var="u">
    <tr>
        <td><input type="checkbox" value="${u.uid }" name="check"/></td>
        <td>${u.uname }</td>
        <td>${u.usex }</td>
        <td><a href="selectupdate?uid=${u.uid }">修改</a></td>
        <td><a href="delete?uid=${u.uid }">删除</a></td>
    </tr>
    </c:forEach> --%>
</table>
<%-- <table>
<tr>
<td>${pageNo }/${totalpage }</td>
<c:if test="${pageNo>1 }">
<td><a href="fenye?pageNo=1">首页</a></td>
<td><a href="fenye?pageNo=${pageNo-1 }">上一页</a></td></c:if>
<c:if test="${pageNo<totalpage }">
<td><a href="fenye?pageNo=${pageNo+1 }">下一页</a></td>
<td><a href="fenye?pageNo=${totalpage }">尾页</a></td></c:if>
</tr>
</table> --%>
</body>

</html>