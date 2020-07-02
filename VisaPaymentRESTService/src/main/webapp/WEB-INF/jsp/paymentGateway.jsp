<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
	body { margin-top:20px; }
	.panel-title {display: inline;font-weight: bold;}
	.checkbox.pull-right { margin: 0; }
	.pl-ziro { padding-left: 0px; }
	.bahar{margin-left:38%;margin-top:100px}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:#F0F0F0">
	<center>Welcome to the payment gateway !</center>		
	
	
	
	<div class = "bahar">
	<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Payment Details
                    </h3>
                    <div class="checkbox pull-right">
                        <label>
                            <input type="checkbox" />
                            Remember
                        </label>
                    </div>
                </div>
                <div class="panel-body">
                    <form role="form" action = "confirm" method = "Post">
                    <div class="form-group">
						<label>
							MERCHANT	: &nbsp ${obj.merchantName}
						</label>
						<label>
							MERCHANT PAN 	: &nbsp ${obj.merchantPrimaryAccountNumber}
						</label>
                    </div>
                    
                    <div class="form-group">
                        <label for="cardNumber">
                            CARD NUMBER</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="cardNumber" placeholder="Valid Card Number"
                                required autofocus />
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-7 col-md-7">
                            <div class="form-group">
                                <label for="expityMonth">
                                    EXPIRY DATE</label>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" name="expiryMonth" placeholder="MM" required />
                                </div>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" name="expiryYear" placeholder="YY" required /></div>
                            </div>
                        </div>
                        <div class="col-xs-5 col-md-5 pull-right">
                            <div class="form-group">
                                <label for="cvCode">
                                    CVV CODE</label>
                                <input type="password" class="form-control" name="cvv" placeholder="CVV" required />
                            </div>
                        </div>
                    </div>
		            <ul class="nav nav-pills nav-stacked">
		                <li class="active"><a href="#"><span class="badge pull-right"><span class="glyphicon glyphicon-usd"></span>${amountToBePaid.longValue()}</span> Final Payment</a>
		                </li>
		            </ul>
		            <br/>
		            <button class="btn btn-success btn-lg btn-block" role="button" type = "submit">Pay</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>	
</body>
</html>