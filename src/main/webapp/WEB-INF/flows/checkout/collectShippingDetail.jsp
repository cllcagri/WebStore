<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring"
           uri="http://www.springframework.org/tags"%>
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
    <title>Customer</title>
</head>
<body>
<section>
    <div class="jumbotron">
        <div class="container">
            <h1>Shipping</h1>
            <p>Shipping details</p>
        </div>
    </div>
</section>
<section class="container">
    <form:form modelAttribute="order.shippingDetail"
               class="form-horizontal">
    <fieldset>
        <legend>Shipping Details</legend>
        <div class="form-group">
            <label class="control-label col-lg-2 col-lg-2" for="name"></label>Name</label>
            <div class="col-lg-10">
                <form:input id="name" path="name"
                            type="text" class="form:input-large" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2 col-lg-2"
                   for="shippingDate">shipping Date (dd/mm/yyyy)</label>
            <div class="col-lg-10">
                <form:input id="shippingDate"
                            path="shippingDate" type="text"
                            class="form:input-large" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2"
                   for="doorNo">Door No</label>
            <div class="col-lg-10">
                <form:input id="doorNo"
                            path="shippingAddress.doorNo" type="text"
                            class="form:input-large" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2"
                   for="streetName">Street Name</label>
            <div class="col-lg-10">
                <form:input id="streetName"
                            path="shippingAddress.streetName."
                            type="text"
                            class="form:input-large" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2"
                   for="areaName">Area Name</label>
            <div class="col-lg-10">
                <form:input id="areaName"
                            path="shippingAddress.areaName"
                            type="text"
                            class="form:input-large" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2"
                   for="state">State</label>
            <div class="col-lg-10">
                <form:input id="state"
                            path="shippingAddress.state" type="text"
                            class="form:input-large" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2"
                   for="country">country</label>
            <div class="col-lg-10">
                <form:input id="country"
                            path="shippingAddress.country" type="text"
                            class="form:input-large" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2"
                   for="zipCode">Zip Code</label>
            <div class="col-lg-10">
                <form:input id="zipCode"
                            path="shippingAddress.zipCode" type="text"
                            class="form:input-large" />
            </div>
        </div>
        <input type="hidden" name="_flowExecutionKey"
               value="${flowExecutionKey}"/>
        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                <button id="back" class="btn btn-default"
                        name="_eventId_backToCollectCustomerInfo">
                    back</button>
                <input type="submit" id="btnAdd" class="btn
       btn-primary"
                       value="Add"
                       name="_eventId_shippingDetailCollected"/>
                <button id="btnCancel" class="btn btn-
       default"
                        name="_eventId_cancel">Cancel</button>
            </div>
        </div>
    </fieldset>
    </form:form>
</section>
</body>
</html>