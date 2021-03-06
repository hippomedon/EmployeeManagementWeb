<%@page import="com.wwwxy.employeemanagement.entity.EventEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.EventDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if(session.getAttribute("admin")==null){
		response.sendRedirect("../login.jsp");
	}else{
		if((int)session.getAttribute("admin")==0){
			response.sendRedirect("empmain.jsp");
		}
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事项记录查询</title>
<style type= "text/css">
	#head{
		width:100%;
		display:inline-block;
	}
	 form{
		width:220px;
		margin-left:200px;
		display:inline-block;
	}
	a{
	    height: 25px;
	    color: black;
	    text-decoration: none;
	    background-color: #DCDCDC;
	    font-size:15px;
	    border-radius:5px;
	    display:inline-block;
	}
	input{
        border: 1px solid #ccc; 
        padding: 7px 0px;
        border-radius: 3px; /*css3属性IE不支持*/
       /*  padding-left:5px;  */
        padding:0;
    }
    #inquire{
    	width:160px;
    	height:25px;
    }
    #submit{
    	width:45px;
    	height:30px;
		font-size:15px;
	}
	#submit:hover{
		cursor:pointer;
	}
			table{
	font-size:15px; 
} 
table{ 
table-layout:fixed; 
empty-cells:show; 
border-collapse: collapse; 
margin:0 auto; 
} 
td{ 
height:30px; 
}  
.table{ 
border:1px solid #cad9ea; 
color:#666; 
} 
.table td { 
background-repeat:repeat-x; 
height:30px; 
} 
.table td,.table td{ 
border:1px solid #cad9ea; 
padding:0 1em 0; 
} 
h1{	
	margin:0;
	text-align:center;
}
.box{
	width:900px;
	margin:50px auto;
	background-color:white;
}
body{
	background-image: url("../image/bg.jpg");
            margin: 0px;
            padding: 0px;
			background-attachment:fixed;
}
a{
	font-size:15px;
}
.return{
	width:40%;
	float:left;	
	margin-left:50px;
}
 .select{
 	width:40%;
 	float:right;
 	margin-right:110px;
 }
 	.exit{
        	display:inline-block;
        	background-color:transparent;
        	padding:0;
        	color:white;
        	text-decoration:none;
        	margin:0;
        }
        .exit:hover{
        	display: inline-block;
            color: red;
            cursor:pointer;
        }
         .exit:active{
           
           display: inline-block;
           background-color:transparent;
       }
        .welcome{
        	width:170px;
        	height:25px;
        	float:right;
        	margin-right:300px;
        	color:white;
        }
</style>
</head>
<body>
	<%
		int id = 0;
		List<EventEntity> list = null;
		EventDao ed = new EventDao();
		if(request.getParameter("inquire")!=null){
			id = Integer.parseInt(request.getParameter("inquire"));
			list = ed.getEventById(id);
		}else{
			list = ed.getAllEvent();
		}
		pageContext.setAttribute("list", list);
	%>
	<br>
	<div class="welcome">欢迎你:${sessionScope.username },<a class="exit" href="exit.jsp">退出</a></div>
	<div  class="box">
		<br>
		<h1>欢迎来到事项记录查询</h1>
	<br>
		<div id= "head">
			<div class="return"><a href="event.jsp">返回管理系统</a></div>
			<div class="select">
			<form id="form" action="getevent.jsp" method="get">
				<input type="text" name="inquire" placeholder="请输入查询员工编号" id="inquire"/>
				<input type="submit" value="查询" id="submit"/>
			</form>
			</div>
		</div>
		<br><br>
		<table width="90%" class="table">
			<tr>
				<td>事项编号</td>
				<td>员工编号</td>
				<td>迟到早退次数</td>
				<td>加班次数</td>
				<td>旷工次数</td>
				<td>事项奖惩</td>
			</tr>
			
			
			
			<c:forEach items="${list }" var="str" varStatus="st">
				<c:choose>
					<c:when test="${st.index%2==0 }">
						<tr bgcolor="#DCDCDC">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
			
				<td>${str.eId }</td>									 
				<td>${str. eMpid}</td>
				<td>${str. eClocking}</td>
				<td>${str. eOvertime}</td>
				<td>${str. eBigevent}</td>
				<td>${str. eAward}</td>
				</tr>
			</c:forEach>
		</table>
		<br><br>
		</div>
</body>
</html>