package org.hermes.shiro.service;

import org.hermes.common.bean.Collections;
import org.hermes.common.bean.Result;
import org.hermes.shiro.bean.Permission;
import org.hermes.shiro.bean.Role;
import org.hermes.shiro.bean.User;
import org.n3r.eql.Eql;
import org.n3r.eql.map.EqlRowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Cabeza on 2016/5/9.
 */
@Service
public class ShiroService {
    public Set<String> findRoles(String username) {
        List<String> list=new Eql().params(Collections.asMap("username",username)).returnType(String.class).execute();
        return new HashSet<String>(list);
    }

    public Set<String> findPermissions(String username) {
        List<String> list=new Eql().params(Collections.asMap("username",username)).returnType(String.class).execute();
        return new HashSet<String>(list);
    }

    public User getByUserName(String username) {
        return new Eql().selectFirst("getByUserName").params(Collections.asMap("username",username)).returnType(User.class).execute();
    }

    public List<User> getAllUser(){
        return new Eql().returnType(User.class).execute();
    }

    public Result changePassword(String id,String newPassword) {
        int result=new Eql().update("changePassword").params(Collections.asMap("id",id,"newPassword",newPassword)).execute();
        if(result>0)
            return Result.build("1","改密成功");
        return Result.build("0","改密失败");
    }

    public List<Role> getAllRole(){
        return new Eql().returnType(Role.class).execute();
    }

    public Role getRoleById(String roleId){
        Role role= new Eql().selectFirst("getRoleById").params(Collections.asMap("roleId",roleId)).returnType(Role.class).execute();
        role.setPermissions(getPermissionByRoleId(roleId));
        return role;
    }

    public Result addRole(Role role){
        int result=new Eql().insert("addRole").params(role).execute();
        if(result>0)
            return Result.build("1","添加角色成功");
        return Result.build("0","添加角色失败");

    }

    public Result deleteRole(String roleId){
        deleteRolePermissionRelation(roleId);
        int result=new Eql().delete("deleteRole").params(Collections.asMap("roleId",roleId)).execute();
        if(result>0)
            return Result.build("1","删除角色成功");
        return Result.build("0","删除角色失败");
    }

    public Result changeRole(String userId,String roleId){
        int result=new Eql().update("changeRole").params(Collections.asMap("roleId",roleId,"userId",userId)).execute();
        if(result>0)
            return Result.build("1","修改用户成功");
        return Result.build("0","修改用户失败");
    }

    public Result deleteUser(String userId){
        int result=new Eql().delete("deleteUser").params(Collections.asMap("userId",userId)).execute();
        if(result>0)
            return Result.build("1","删除用户成功");
        return Result.build("0","删除用户失败");
    }

    public Result addUser(User user){
        int result=new Eql().insert("addUser").params(user).execute();
        if(result>0)
            return Result.build("1","添加用户成功");
        return Result.build("0","添加用户失败");
    }

    public List<Permission> getAllPermission(){
        return new Eql().returnType(Permission.class).execute();
    }

    public List<Permission> getPermissionByRoleId(String roleId){
        return new Eql().params(Collections.asMap("roleId", roleId)).returnType(Permission.class).execute();
    }

    public void deleteRolePermissionRelation(String roleId){
        new Eql().params(Collections.asMap("roleId",roleId)).execute();
    }

    public Result updatePermissionByRoleId(String roleId,String permissionStr){
        clearPermissionByRoleId(roleId);
        String[] arr=permissionStr.split(",");
        for(int i=0;i<arr.length;i++){
            addPermissionByRoleId(roleId, arr[i]);
        }
        return Result.build("更新roleId为" + roleId + "的角色成功", "共更新" + arr.length + "条");
    }

    public Result clearPermissionByRoleId(String roleId){
        int result=new Eql().delete("clearPermissionByRoleId").params(Collections.asMap("roleId",roleId)).execute();
        return Result.build("删除roleId为"+roleId,"共删除"+result+"条");
    }

    public void addPermissionByRoleId(String roleId, String permissionId){
        new Eql().params(Collections.asMap("roleId",roleId,"permissionId",permissionId)).execute();
    }
}
