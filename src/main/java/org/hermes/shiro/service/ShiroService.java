package org.hermes.shiro.service;

import org.hermes.common.bean.Collections;
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
}
