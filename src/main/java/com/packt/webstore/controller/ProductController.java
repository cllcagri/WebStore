package com.packt.webstore.controller;

import com.packt.webstore.domain.Product;
import com.packt.webstore.exceptions.NoProductsFoundUnderCategoryException;
import com.packt.webstore.exceptions.ProductNotFoundException;
import com.packt.webstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/products")
    public String list(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "products";
    }

    @RequestMapping("/update/stock")
    public String updateStock() {
        productService.updateAllStock();
        return "redirect:/products";
    }

    @RequestMapping("/products/{category}")
    public String getProductsByCategory(Model model, @PathVariable("category") String category) {

        List<Product> products =
                productService.getProductsByCategory(category);

        if (products == null || products.isEmpty()) {
            throw new NoProductsFoundUnderCategoryException();
        }

        model.addAttribute("products", products);
        return "products";
    }

    @RequestMapping("/products/filter/{params}")
    public String getProductsByFilter(@MatrixVariable(pathVar = "params") Map<String, List<String>> filterParams,
                                      Model model) {

        model.addAttribute("products", productService.getProductsByFilter(filterParams));
        return "products";
    }

    @RequestMapping("/product")
    public String getProductById(@RequestParam("id") String productId, Model model) {
        model.addAttribute("product", productService.getProductById(productId));

        return "product";
    }

    @GetMapping(value = "/products/add")
    public String getAddNewProductForm(Model model) {
        Product newProduct = new Product();
        model.addAttribute("newProduct", newProduct);
        return "addProduct";
    }

    @PostMapping(value = "/products/add")
    public String processAddNewProductForm(@Valid @ModelAttribute("newProduct") Product newProduct, BindingResult result, HttpServletRequest request) throws IOException {

        if(result.hasErrors()){
            return "addProduct";
        }

        String[] suppressedFields = result.getSuppressedFields();
        if (suppressedFields.length > 0) {
            throw new RuntimeException("Attempting to bind disallowed fields: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
        }

        MultipartFile productImage = newProduct.getProductImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if (productImage != null && !productImage.isEmpty()) {
            try {
                productImage.transferTo(new File(rootDirectory + "resources\\images" +
                        newProduct.getProductId() + ".png"));
            } catch (Exception e) {
                throw new RuntimeException("Product Image saving failed", e);
            }
        }

        productService.addProduct(newProduct);
        return "redirect:/products";
    }

    @InitBinder
    public void initialiseBinder(WebDataBinder binder) {
        binder.setAllowedFields("productId", "name", "unitPrice", "description", "manufacturer", "category", "unitsInStock", "condition", "productImage", "language");
    }

    @ExceptionHandler(ProductNotFoundException.class)
    public ModelAndView handleError(HttpServletRequest req, ProductNotFoundException exception) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("invalidProductId", exception.getProductId());
        mav.addObject("exception", exception);
        mav.addObject("url", req.getRequestURL() + "?" + req.getQueryString());
        mav.setViewName("productNotFound");
        return mav;
    }

    @RequestMapping("/products/invalidPromoCode") public String invalidPromoCode() {
        return "invalidPromoCode";
    }

}
