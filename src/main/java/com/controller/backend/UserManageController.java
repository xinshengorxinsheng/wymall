package com.controller.backend;

import com.common.Const;
import com.common.ServerResponse;
import com.github.pagehelper.PageInfo;
import com.pojo.User;
import com.service.IProductService;
import com.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Set;

@Controller
@RequestMapping("/manage/user")
public class UserManageController {

    @Autowired
    private IUserService iUserService;

    @Autowired
    private IProductService iProductService;

    @RequestMapping(value="login.do",method = RequestMethod.POST)
    public String login(String username, String password, HttpSession session){
        ServerResponse<User> response = iUserService.login(username,password);
        if(response.isSuccess()){
            User user = response.getData();
            if(user.getRole() == Const.Role.ROLE_ADMIN){
                //说明登录的是管理员
                session.setAttribute(Const.CURRENT_USER,user);
                ServerResponse<PageInfo> list=iProductService.getProductList(1,12);
                session.setAttribute("page", list.getData());
                Set<Integer> markProductId=iProductService.getProductIdByAllOrder();
                session.setAttribute("markProductByUserId", markProductId);
                return "redirect:/jsp/manageHome.jsp";
            }else{
                return "manageLogin";
            }
        }
        return "manageLogin";
    }
    @RequestMapping(value="logout.do",method= RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute(Const.CURRENT_USER);
        return "manageLogin";
    }
}
