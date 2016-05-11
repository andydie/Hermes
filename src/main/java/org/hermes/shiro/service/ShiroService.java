package org.hermes.shiro.service;

import org.hermes.common.bean.Collections;
import org.hermes.common.bean.Result;
import org.hermes.shiro.bean.Role;
import org.hermes.shiro.bean.User;
import org.n3r.eql.Eql;
import org.springframework.stereotype.Service;

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

    public Result changeRole(String userId,String roleId){
        int result=new Eql().update("changeRole").params(Collections.asMap("roleId",roleId,"userId",userId)).execute();
        if(result>0)
            return Result.build("1","修改角色成功");
        return Result.build("0","修改角色失败");
    }
}
