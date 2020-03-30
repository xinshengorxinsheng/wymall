package com.controller.portal;

import com.common.Const;
import com.common.ResponseCode;
import com.common.ServerResponse;
import com.pojo.User;
import com.service.ICartService;
import com.vo.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart/")
public class CartController {
    @Autowired
    private ICartService iCartService;

    @RequestMapping("list.do")
    public String list(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return "login";
        }
        ServerResponse<CartVo> response=iCartService.list(user.getId());
        session.setAttribute("cart",response.getData());
        return "redirect:/jsp/cart.jsp";
    }

    @RequestMapping(value="add.do",method= RequestMethod.POST)
    public String add(HttpSession session, Integer count, Integer productId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return "login";
        }
        iCartService.add(user.getId(),productId,count);
        ServerResponse<CartVo> response=iCartService.list(user.getId());
        session.setAttribute("cart",response.getData());
        return "redirect:/jsp/cart.jsp";
    }

    @RequestMapping("delete_all.do")
    public String deleteAll(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return "login";
        }
        iCartService.deleteAll(user.getId());
        ServerResponse<CartVo> response=iCartService.list(user.getId());
        session.setAttribute("cart",response.getData());
        return "redirect:/jsp/cart.jsp";
    }

    @RequestMapping("delete_product.do")
    public String deleteProduct(HttpSession session,String productIds){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return "login";
        }
        iCartService.deleteProduct(user.getId(),productIds);
        ServerResponse<CartVo> response=iCartService.list(user.getId());
        session.setAttribute("cart",response.getData());
        return "redirect:/jsp/cart.jsp";
    }

    @RequestMapping("update.do")
    @ResponseBody
    public ServerResponse<CartVo> update(HttpSession session, Integer count, Integer productId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.update(user.getId(),productId,count);
    }

    @RequestMapping("select_all.do")
    @ResponseBody
    public ServerResponse<CartVo> selectAll(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.selectOrUnSelect(user.getId(),null,Const.Cart.CHECKED);
    }

    @RequestMapping("un_select_all.do")
    @ResponseBody
    public ServerResponse<CartVo> unSelectAll(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.selectOrUnSelect(user.getId(),null,Const.Cart.UN_CHECKED);
    }



    @RequestMapping("select.do")
    @ResponseBody
    public ServerResponse<CartVo> select(HttpSession session,Integer productId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.selectOrUnSelect(user.getId(),productId,Const.Cart.CHECKED);
    }

    @RequestMapping("un_select.do")
    @ResponseBody
    public ServerResponse<CartVo> unSelect(HttpSession session,Integer productId){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }
        return iCartService.selectOrUnSelect(user.getId(),productId,Const.Cart.UN_CHECKED);
    }



    @RequestMapping("get_cart_product_count.do")
    @ResponseBody
    public ServerResponse<Integer> getCartProductCount(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user ==null){
            return ServerResponse.createBySuccess(0);
        }
        return iCartService.getCartProductCount(user.getId());
    }
}
