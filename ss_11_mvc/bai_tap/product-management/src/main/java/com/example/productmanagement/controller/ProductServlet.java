package com.example.productmanagement.controller;

import com.example.productmanagement.model.Product;
import com.example.productmanagement.service.IProductService;
import com.example.productmanagement.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = {"", "/product-servlet", "/product"})
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addNewProduct(req, resp);
                break;
            case "edit":
                updateProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            case "search":
                findByName(req, resp);
                break;
            default:
                showListProduct(req, resp);
        }
    }

    private void findByName(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        List<Product> products = productService.findByName(name);
        RequestDispatcher dispatcher;
        if (products == null) {
            dispatcher = req.getRequestDispatcher("error-404.jsp");
        } else {
            req.setAttribute("list", products);
            dispatcher = req.getRequestDispatcher("search.jsp");
            try {
                dispatcher.forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = req.getRequestDispatcher("error-404.jsp");
        } else {
            productService.deleteProduct(id);
            dispatcher = req.getRequestDispatcher("delete.jsp");
            req.setAttribute("message", "Xóa thành công sản phẩm: " + product.getName());
            try {
                dispatcher.forward(req,resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
//            try {
//                resp.sendRedirect("/product");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
        }
    }

    private void addNewProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = (int) (Math.random() * 1000);
        String name = req.getParameter("name");
        long price = Long.parseLong(req.getParameter("price"));
        String detail = req.getParameter("detail");
        Product product = new Product(id, name, price, detail);
        productService.addNewProduct(product);
        RequestDispatcher dispatcher = req.getRequestDispatcher("create.jsp");
        req.setAttribute("message", "Thêm sản phẩm thành công");
        dispatcher.forward(req, resp);

    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        long price = Long.parseLong(req.getParameter("price"));
        String detail = req.getParameter("detail");
        Product product = productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = req.getRequestDispatcher("error-404.jsp");
        } else {
            productService.editProduct(id, name, price, detail);
        }
        req.setAttribute("product", product);
        req.setAttribute("message", "Sửa thành công");
        dispatcher = req.getRequestDispatcher("edit.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                showDeleteForm(req, resp);
                break;
            case "detail":
                showDetailForm(req, resp);
                break;
            case "search":
                showSearchForm(req, resp);
                break;
            default:
                showListProduct(req, resp);
        }
    }

    private void showSearchForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("search.jsp");
        dispatcher.forward(req, resp);
    }

    private void showDetailForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("detail.jsp");
        req.setAttribute("product", product);
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("delete.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("create.jsp");
        dispatcher.forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = req.getRequestDispatcher("eror-404.jsp");
        } else {
            req.setAttribute("product", product);
            dispatcher = req.getRequestDispatcher("edit.jsp");
            try {
                dispatcher.forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showListProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.getAll();
        RequestDispatcher dispatcher = req.getRequestDispatcher("list.jsp");
        req.setAttribute("list", products);
        dispatcher.forward(req, resp);
    }
}
