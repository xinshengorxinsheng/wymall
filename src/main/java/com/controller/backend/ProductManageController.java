package com.controller.backend;

import com.common.Const;
import com.common.ResponseCode;
import com.common.ServerResponse;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import com.pojo.Product;
import com.pojo.User;
import com.service.ICategoryService;
import com.service.IFileService;
import com.service.IProductService;
import com.service.IUserService;
import com.util.PropertiesUtil;
import com.vo.ProductDetailVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/manage/product")
public class ProductManageController {

    @Autowired
    private IUserService iUserService;
    @Autowired
    private IProductService iProductService;
    @Autowired
    private IFileService iFileService;
    @Autowired
    private ICategoryService iCategoryService;

    @RequestMapping("save.do")
    public String productSave(HttpSession session, Product product){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return "manageLogin";
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            iProductService.saveOrUpdateProduct(product);
            ServerResponse response=iProductService.manageProductDetail(product.getId());
            session.setAttribute("manageProduct",response.getData());
            ServerResponse<PageInfo> list=iProductService.getProductList(1,12);
            session.setAttribute("page", list.getData());
            Set<Integer> markProductId=iProductService.getProductIdByAllOrder();
            session.setAttribute("markProductByUserId", markProductId);
            return "redirect:/jsp/manageProductInfo.jsp";
        }else{
            return "manageLogin";
        }
    }


    @RequestMapping("edit.do")
    public String editProduct(HttpSession session, Integer count, Integer productId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return "manageLogin";
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            ServerResponse response=iProductService.manageProductDetail(productId);
            session.setAttribute("manageProduct",response.getData());
            return "edit";
        }else{
            return "manageLogin";
        }
    }

    @RequestMapping("add.do")
    public String addProduct(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return "manageLogin";
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            Set<Integer> allProductId=iProductService.getAllProductId();
            session.setAttribute("allPId",allProductId);
            return "add";
        }else{
            return "manageLogin";
        }
    }

    @RequestMapping("detail.do")
    public String getDetail(HttpSession session, Integer productId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return "manageLogin";
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            ServerResponse response=iProductService.manageProductDetail(productId);
            session.setAttribute("manageProduct",response.getData());
            return "manageProductInfo";
        }else{
            return "manageLogin";
        }
    }
    @RequestMapping("uploadEdit.do")
    public String uploadEdit(HttpSession session, @RequestParam(value = "upload_file",required = false) MultipartFile file, HttpServletRequest request){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return "manageLogin";
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            String path = request.getSession().getServletContext().getRealPath("upload");
            String targetFileName = iFileService.upload(file,path);
            String url = PropertiesUtil.getProperty("ftp.server.http.prefix")+targetFileName;
            session.setAttribute("uri",targetFileName);
            session.setAttribute("url",url);
            return "edit";
        }else{
            return "manageLogin";
        }
    }
    @RequestMapping("uploadAdd.do")
    public String uploadAdd(HttpSession session, @RequestParam(value = "upload_file",required = false) MultipartFile file, HttpServletRequest request){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return "manageLogin";
        }
        if(iUserService.checkAdminRole(user).isSuccess()){
            String path = request.getSession().getServletContext().getRealPath("upload");
            String targetFileName = iFileService.upload(file,path);
            String url = PropertiesUtil.getProperty("ftp.server.http.prefix")+targetFileName;
            session.setAttribute("uri",targetFileName);
            session.setAttribute("url",url);
            return "add";
        }else{
            return "manageLogin";
        }
    }
}
