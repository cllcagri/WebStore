<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Products</title>
</head>
<body>
<section>
    <div class="jumbotron">
        <div class="container">
            <h1>Welcome to Web Store!</h1>
            <p>The one and only amazing web store</p>
        </div>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please sign in</h3>
                        <div class="panel-body">
                            <c:url var="loginUrl" value="/login" />
                            <form action="${loginUrl}" method="post" class="form-horizontal">
                                <c:if test="${param.error != null}" >
                                    <div class="alert alert-danger">
                                        <p>Invalid username and password.
                                        </p>
                                    </div>
                                </c:if>

                                <c:if test="${param.logout != null}">
                                    <div class="alert alert-success">
                                        <p>You have been logged out successfully.</p>
                                    </div>
                                </c:if>

                                <c:if test="${param.accessDenied != null}" >
                                    <div class="alert alert-danger">
                                        <p>Access Denied: You are not authorised! </p>
                                    </div>
                                </c:if>

                                <div class="input-group input-sm">
                                    <label class="input-group-addon" for="userId">
                                        <i class="fa fa-user"></i>
                                    </label>
                                    <input type="text" class="form-control"
                                           id="userId" name="userId"
                                           placeholder="Enter Username"
                                           required>
                                </div>
                                <div class="input-group input-sm">
                                    <label class="input-group-addon" for="password">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                    <input type="password"
                                           class="form-control" id="password"
                                           name="password" placeholder="Enter Password" required>
                                </div>
                                <div class="form-actions">
                                    <input type="submit" class="btn btn-block btn-primary btn-default" value="Log in">
                                </div>
                            </form>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>