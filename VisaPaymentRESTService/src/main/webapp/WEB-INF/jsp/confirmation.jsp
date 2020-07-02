<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style>
* {
  background: #212121;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}
.content {
  font-family: 'Helvetica Neue';
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
  font-size: 30px;
}

.title { 
  font-weight: bold;
  color: #e7e7e7;
}

.symbol {
  -webkit-text-stroke: 13px #212121;
  font-size: 150px;
  color: #ff2c3c;
}
.text { 
  margin-top: 15px;
  font-size: 25px;
  color: #e7e7e7;
  text-align: center; 
  font-family: 'avenir';
  font-weight: lighter;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:#F0F0F0">	
	<div class='content'>
	  <div class='fa fa-check-circle-o symbol'></div>
	  <div class='title'>Payment Successful!</div>
	  <div class='text'>Your transaction id is ${obj.transactionId}</div>
	</div>
</body>
</html>