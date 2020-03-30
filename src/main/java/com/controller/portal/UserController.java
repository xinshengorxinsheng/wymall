package com.controller.portal;

import com.common.Const;
import com.common.ResponseCode;
import com.common.ServerResponse;
import com.pojo.User;
import com.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private IUserService iUserService;
    /**
     * 用户登录
     */
    @RequestMapping(value="login.do",method= RequestMethod.POST)
    public String login(String username, String password,HttpSession session){
            ServerResponse<User> response=iUserService.login(username,password);
            if(response.isSuccess()){
                User user = response.getData();
                if(user.getRole() == Const.Role.ROLE_CUSTOMER){
                    session.setAttribute(Const.CURRENT_USER, response.getData());
                    return "redirect:/index.jsp";
                }else{
                    return "login";
                }
            }
            return "login";
    }
    /**
     *用户退出
     */
    @RequestMapping(value="logout.do",method= RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute(Const.CURRENT_USER);
        return "redirect:/index.jsp";
    }
    /**
     *用户注册
     */
    @RequestMapping(value="register.do",method= RequestMethod.POST)
    @ResponseBody
    public  ServerResponse<String> register(User user){
        return iUserService.register(user);
    }
    /**
     * 防恶意注册
     * @param str
     * @param type
     * @return
     */
    @RequestMapping(value="check_valid.do",method= RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> checkValid(String str,String type){
        return iUserService.checkValid(str,type);
    }
    /**
     * 查询用户信息
     * @param session
     * @return
     */
    @RequestMapping(value="get_user_info.do",method= RequestMethod.POST)
    @ResponseBody
    public ServerResponse<User> getUserInfo(HttpSession session){
        User user=(User)session.getAttribute(Const.CURRENT_USER);
        if(user!=null){
            return ServerResponse.createBySuccess(user);
        }
        return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
    }
    @RequestMapping(value="forget_get_question.do",method= RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> forgetGetQuestion(String username){
        return iUserService.selectQuestion(username);
    }
    @RequestMapping(value="forget_check_answer.do",method= RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> forgetCheckAnswer(String username,String question,String answer){
        return iUserService.checkAnswer(username,question,answer);
    }

    @RequestMapping(value="forget_reset_password.do",method= RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> forgetResetPassword(String username,String passwordNew,String forgetToken){
        return iUserService.forgetResetPassword(username,passwordNew,forgetToken);
    }

    @RequestMapping(value = "reset_password.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> resetPassword(HttpSession session,String passwordOld,String passwordNew){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorMessage("用户未登录");
        }
        return iUserService.resetPassword(passwordOld,passwordNew,user);
    }
    /**
     * 更新用户个人信息
     */
    @RequestMapping(value = "update_information.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<User> update_information(HttpSession session,User user){
        User currentUser = (User)session.getAttribute(Const.CURRENT_USER);
        if(currentUser == null){
            return ServerResponse.createByErrorMessage("用户未登录");
        }
        user.setId(currentUser.getId());
        user.setUsername(currentUser.getUsername());
        ServerResponse<User> response = iUserService.updateInformation(user);
        if(response.isSuccess()){
            response.getData().setUsername(currentUser.getUsername());
            session.setAttribute(Const.CURRENT_USER,response.getData());
        }
        return response;
    }
    @RequestMapping(value = "get_information.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<User> get_information(HttpSession session){
        User currentUser = (User)session.getAttribute(Const.CURRENT_USER);
        if(currentUser == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"未登录,需要强制登录status=10");
        }
        return iUserService.getInformation(currentUser.getId());
    }



}

