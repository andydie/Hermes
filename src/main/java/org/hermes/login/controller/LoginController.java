package org.hermes.login.controller;

import org.hermes.common.bean.Result;
import org.hermes.login.bean.LoginInfo;
import org.hermes.login.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * Created by admin on 2016/2/17.
 */
@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "check/{username}/{password}",method= RequestMethod.GET)
    public void wtf(@PathVariable String username,@PathVariable String password){

    }
    @RequestMapping("login")
    public String login(){
        return "login/login";
    }

    @ResponseBody
    @RequestMapping("checkLogin")
    public Result checkLogin(@RequestBody LoginInfo loginInfo,HttpSession session){
        return loginService.checkLogin(loginInfo, session);
    }
}
