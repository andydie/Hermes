package org.hermes.shiro.controller;

import org.hermes.common.bean.Result;
import org.hermes.shiro.bean.Role;
import org.hermes.shiro.bean.User;
import org.hermes.shiro.service.ShiroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Cabeza on 2016/5/10.
 */
@Controller
@RequestMapping("shiro")
public class ShiroController {
    @Autowired
    ShiroService shiroService;

    @ResponseBody
    @RequestMapping("all-user")
    public List<User> getAllUser(){
        return shiroService.getAllUser();
    }

    @ResponseBody
    @RequestMapping("changePassword/{id}")
    public Result changePassword(@RequestParam String newPassword,@PathVariable String id){
        return shiroService.changePassword(id,newPassword);
    }

    @ResponseBody
    @RequestMapping("changeRole/{userId}")
    public Result changeRole(@RequestParam String roleId,@PathVariable String userId){
        return shiroService.changeRole(userId,roleId);
    }

    @ResponseBody
    @RequestMapping("all-role")
    public List<Role> getAllRole(){
        return shiroService.getAllRole();
    }

    @ResponseBody
    @RequestMapping("delete-user/{userId}")
    public Result deleteUser(@PathVariable String userId){
        return shiroService.deleteUser(userId);
    }

    @ResponseBody
    @RequestMapping("add-user")
    public Result addUser(@RequestBody User user){
        return shiroService.addUser(user);
    }

}
