package com.controller.portal;

import com.common.Const;
import com.common.ServerResponse;
import com.github.pagehelper.PageInfo;
import com.pojo.User;
import com.service.IProductService;
import com.vo.ProductDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

@Controller
@RequestMapping("/product/")
public class ProductController {

    @Autowired
    private IProductService iProductService;



    @RequestMapping("detail.do")
    public String detail(Integer productId,HttpSession session){
        ServerResponse<ProductDetailVo> response=iProductService.getProductDetail(productId);
        session.setAttribute("product",response.getData());
        return "product_info";
    }

    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<PageInfo> list(@RequestParam(value = "keyword",required = false)String keyword,
                                         @RequestParam(value = "categoryId",required = false)Integer categoryId,
                                         @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize",defaultValue = "10") int pageSize,
                                         @RequestParam(value = "orderBy",defaultValue = "") String orderBy){
        return iProductService.getProductByKeywordCategory(keyword,categoryId,pageNum,pageSize,orderBy);
    }

    @RequestMapping("index.do")
    public String index(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                        @RequestParam(value = "pageSize",defaultValue = "9") int pageSize,
                        HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            ServerResponse<PageInfo> list=iProductService.getProductList(pageNum,pageSize);
            session.setAttribute("page", list.getData());
            return "home";
        }else{
            ServerResponse<PageInfo> list=iProductService.getProductList(pageNum,pageSize);
            session.setAttribute("page", list.getData());
            Set<Integer> markProductId=iProductService.getProductIdByUserId(user.getId());
            session.setAttribute("markProductByUserId", markProductId);
            return "home";
        }
    }
}

