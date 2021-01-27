<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Cart</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js"></script>
    <script type="text/javascript" src="/js/src/controllers.js"></script>

</head>
<body>
<section>
    <div class="jumbotron">
        <div class="container">
            <h1>Cart</h1>
            <p>All the selected products in your cart</p>
        </div>
    </div>
</section>
<section class="container" ng-app="cartApp">
    <div ng-controller="cartCtrl" ng-init="initCartId('${cartId}')">
        <div style="padding-bottom: 6%">
            <a class="btn btn-danger pull-left" ng-click="clearCart()">
                <span class="glyphicon glyphicon-remove-sign"></span> Clear Cart
            </a>
            <a href="<spring:url value="/checkout?cartId=${cartId}" />" class="btn btn-success pull-right">
                <span class="glyphicon-shopping-cart glyphicon"></span> Check out
            </a>
        </div>
        <table class="table table-hover">
            <tr>
                <th>Product</th>
                <th>Unit price</th>
                <th>Qauntity</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <tr ng-repeat="item in cart.cartItems">
                <td>{{item.product.productId}} - {{item.product.name}}</td>
                <td>{{item.product.unitPrice}}</td>
                <td>{{item.quantity}}</td>
                <td>{{item.totalPrice}}</td>
                <td>
                    <a href="#" class="label label-danger" ng-click="removeFromCart(item.product.productId)">
                        <span class="glyphicon glyphicon-remove" ></span>
                        Remove
                    </a>
                </td>
            </tr>
            <tr>
                <th></th>
                <th></th>
                <th>Grand Total</th>
                <th>{{cart.grandTotal}}</th>
                <th></th>
            </tr>
        </table>
        <a href="<spring:url value="/products" />" class="btn btn-default">
            <span class="glyphicon-hand-left glyphicon"></span> Continue shopping
        </a>
    </div>
</section>

</body>
</html>