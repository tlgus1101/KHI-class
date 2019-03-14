<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8">

<title>KHI 관리자 로그인</title>
<link href="/_KHI/admin_main/NewFile.css" type="text/css" rel="stylesheet" />
 <script type="text/javascript" src="script.js"></script>

</head>

<body>

<div class="materialContainer"> <form action="Admin_main.action" method="post">


   <div class="box">

      <div class="title">LOGIN</div>

      <div class="input">
         
         <input type='text' name='id' id='id' placeholder='UserName' onfocus="this.value=''">
         <span class="spin"></span>
      </div>

      <div class="input">
       
         <input type='Password' name='Password' id='Password' placeholder='Password' onfocus="this.value=''">
         <span class="spin"></span>
      </div>

      <div class="button login">
         <button type="submit"><span>GO</span> <i class="fa fa-check"></i></button>
      </div>



   </div>
   </form>
</div>




</body>
</html>