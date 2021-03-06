<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring"
           uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js"></script>
    <script type="text/javascript" src="/js/src/controllers.js"></script>
    <title>Order Confirmation</title>
</head>

<body>
<section>
    <div class="jumbotron">
        <div class="container">
            <h1>Order</h1>
            <p>Order Confirmation</p>
        </div>
    </div>
</section>

<div class="container">
    <div class="row">
        <form:form modelAttribute="order" class="form-horizontal">
        <input type="hidden" name="_flowExecutionKey"
               value="${flowExecutionKey}" />
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <div class="text-center">
                <h1>Receipt</h1>
            </div>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>Shipping Address</strong> <br>
                            ${order.shippingDetail.name}<br>
                            ${order.shippingDetail.shippingAddress.doorNo},
                            ${order.shippingDetail.shippingAddress.streetName}<br>
                            ${order.shippingDetail.shippingAddress.areaName},
                            ${order.shippingDetail.shippingAddress.state}<br>
                            ${order.shippingDetail.shippingAddress.country},
                            ${order.shippingDetail.shippingAddress.zipCode}<br>
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p>
                        <em>Shipping DateDate:
                            <fmt:formatDate type="date" value="${order.shippingDetail.shippingDate}" /></em>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>Billing Address</strong> <br>
                            ${order.customer.name}<br>
                            ${order.customer.billingAddress.doorNo},
                            ${order.customer.billingAddress.streetName}
                        <br>
                            ${order.customer.billingAddress.areaName},
                            ${order.customer.billingAddress.state}
                        <br>
                            ${order.customer.billingAddress.country},
                            ${order.customer.billingAddress.zipCode}
                        <br> <abbr >P:</abbr>
                            ${order.customer.phoneNumber}
                    </address>
                </div>
            </div>
            <div class="row">
                <table class="table table-hover">
                    <thead> <tr>
                        <th>Product</th>
                        <th>#</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="cartItem" items="${order.cart.cartItems}">
                        <tr>
                            <td class="col-md-9">
                                <em>${cartItem.product.name}</em></td>
                            <td class="col-md-1"
                                style="text-align: center">
                                    ${cartItem.quantity}
                            </td>
                            <td class="col-md-1 text-center">$${cartItem.product.unitPrice}
                            </td>
                            <td class="col-md-1 text-center">$${cartItem.totalPrice}
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td> </td>
                        <td> </td>
                        <td class="text-right">
                            <h4>
                                <strong>Grand Total:</strong>
                            </h4>
                        </td>
                        <td class="text-center text-danger">
                            <h4>
                                <strong>$${order.cart.grandTotal}
                                </strong>
                            </h4>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <button id="back" class="btn btn-default"
                        name="_eventId_backToCollectShippingDetail">
                        back</button>
                <button type="submit" class="btn btn-success" name="_eventId_orderConfirmed">
                            Confirm
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </button>
                <button id="btnCancel" class="btn btn-default" name="_eventId_cancel">Cancel</button>
            </div>
        </div>
        </form:form>
    </div>
</div>
</body>
</html>