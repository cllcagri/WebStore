package com.packt.webstore.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PromoCodeInterceptor implements HandlerInterceptor {

    private String promoCode;
    private String errorRedirect;
    private String offerRedirect;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String givenPromoCode = request.getParameter("promo");
        if (promoCode.equals(givenPromoCode)) {
            String fullPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/" + request.getContextPath();
            response.sendRedirect(fullPath + "/" + offerRedirect);
        } else {
            response.sendRedirect(errorRedirect);
        }

        return false;
    }

    public void setPromoCode(String promoCode) {
        this.promoCode = promoCode;
    }

    public void setErrorRedirect(String errorRedirect) {
        this.errorRedirect = errorRedirect;
    }

    public void setOfferRedirect(String offerRedirect) {
        this.offerRedirect = offerRedirect;
    }
}
