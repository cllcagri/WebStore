<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Products</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<section>
    <div class="pull-right" style="padding-right:50px">
        <a href="?language=en">English</a>|<a href="?language=nl" >Dutch</a>
    </div>
    <a href="<c:url value="/logout" />">Logout</a>
</section>
<section>
    <div class="jumbotron">
        <div class="container">
            <h1>Add Product</h1>
            <p>Add product By Form</p>
        </div>
    </div>
</section>
<section class="container">
    <form:form method="POST" modelAttribute="newProduct" class="form-horizontal" enctype="multipart/form-data">
        <form:errors path="*" cssClass="alert alert-danger" element="div"/>
        <fieldset>
            <legend>Add new product</legend>
            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2"
                       for="productId"><spring:message code="addProduct.form.productId.label"/></label>
                <div class="col-lg-10">
                    <form:input id="productId" path="productId" type="text" class="form:input-large"/>
                    <form:errors path="productId" cssClass="text-danger"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2"
                       for="name">Product Name</label>
                <div class="col-lg-10">
                    <form:input id="name" path="name" type="text" class="form:input-large"/>
                    <form:errors path="name" cssClass="text-danger"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2"
                       for="unitPrice">unit Price</label>
                <div class="col-lg-10">
                    <form:input id="unitPrice" path="unitPrice" type="text" class="form:input-large"/>
                    <form:errors path="unitPrice" cssClass="text-danger"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2"
                       for="manufacturer">Manufacturer</label>
                <div class="col-lg-10">
                    <form:input id="manufacturer" path="manufacturer" type="text" class="form:input-large"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2"
                       for="category">Category</label>
                <div class="col-lg-10">
                    <form:input id="category" path="category" type="text" class="form:input-large"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2"
                       for="unitsInStock">units In Stock</label>
                <div class="col-lg-10">
                    <form:input id="unitsInStock" path="unitsInStock" type="text" class="form:input-large"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2"
                       for="description">Description</label>
                <div class="col-lg-10">
                    <form:textarea id="description" path="description" rows="2"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2"
                       for="condition">Condition</label>
                <div class="col-lg-10">
                    <form:radiobutton path="condition" id="condition" value="New"/>New
                    <form:radiobutton path="condition" id="condition" value="Old"/>Old
                    <form:radiobutton path="condition" id="condition" value="Refurbished"/>Refurbished
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="productImage">
                    <spring:message code="addProduct.form.productImage.label"/></label>
                <div class="col-lg-10">
                    <form:input id="productImage" path="productImage" type="file" class="form:input-large" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" id="btnAdd" class="btn btn-primary" value="Add"/>
                </div>
            </div>
        </fieldset>
    </form:form>
</section>
</body>
</html>