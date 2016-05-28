package org.hermes.shiro.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.hermes.common.bean.Result;
import org.hermes.shiro.bean.Permission;
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

    @RequiresPermissions("user:read")
    @ResponseBody
    @RequestMapping("all-user")
    public List<User> getAllUser(){
        return shiroService.getAllUser();
    }

    @RequiresPermissions("user:update")
    @ResponseBody
    @RequestMapping("changePassword/{id}")
    public Result changePassword(@RequestParam String newPassword,@PathVariable String id){
        return shiroService.changePassword(id,newPassword);
    }

    @RequiresPermissions("user:update")
    @ResponseBody
    @RequestMapping("changeRole/{userId}")
    public Result changeRole(@RequestParam String roleId,@PathVariable String userId){
        return shiroService.changeRole(userId,roleId);
    }

    @RequiresPermissions("role:read")
    @ResponseBody
    @RequestMapping("all-role")
    public List<Role> getAllRole(){
        return shiroService.getAllRole();
    }

    @RequiresPermissions("role:read")
    @ResponseBody
    @RequestMapping("role/{roleId}")
    public Role getRoleById(@PathVariable String roleId){
        return shiroService.getRoleById(roleId);
    }

    @RequiresPermissions("role:delete")
    @ResponseBody
    @RequestMapping("delete-user/{userId}")
    public Result deleteUser(@PathVariable String userId){
        return shiroService.deleteUser(userId);
    }

    @RequiresPermissions("user:create")
    @ResponseBody
    @RequestMapping("add-user")
    public Result addUser(@RequestBody User user){
        return shiroService.addUser(user);
    }

    @RequiresPermissions("role:create")
    @ResponseBody
    @RequestMapping("add-role")
    public Result addRole(@RequestBody Role role){
        return shiroService.addRole(role);
    }

    @RequiresPermissions("role:delete")
    @ResponseBody
    @RequestMapping("delete-role/{roleId}")
    public Result deleteRole(@PathVariable String roleId){
        return shiroService.deleteRole(roleId);
    }

    @ResponseBody
    @RequestMapping("all-permision")
    public List<Permission> getAllPermission(){
        return shiroService.getAllPermission();
    }

    @ResponseBody
    @RequestMapping("{roleId}/permission")
    public List<Permission> getPermissionByRoleId(@PathVariable String roleId){
        return shiroService.getPermissionByRoleId(roleId);
    }
    @ResponseBody
    @RequestMapping("{roleId}/update-permission")
    public Result updatePermissionByRoleId(@PathVariable String roleId,@RequestParam String permissionStr){
        return shiroService.updatePermissionByRoleId(roleId,permissionStr);
    }

    @ResponseBody
    @RequestMapping("getCurrentStaffId")
    public String getCurrentUserName(){
        Subject subject= SecurityUtils.getSubject();
        Session session=subject.getSession();
        return (String)session.getAttribute("staffId");
    }

    @RequestMapping("user/list")
    public String gotoUserList(){
        return "shiro/userList";
    }


    @RequestMapping("user/add")
    public String gotoAddUser(){
        return "shiro/addUser";
    }


    @RequestMapping("role/list")
    public String gotoRoleList(){
        return "shiro/roleList";
    }

    @RequestMapping("role/edit")
    public String gotoRoleEdit(){
        return "shiro/roleEdit";
    }

    @RequestMapping("unauthor")
    public String gototUnauthor(){
        return "error/unauthor";
    }
}
