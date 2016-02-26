package org.hermes.login.service;

import org.hermes.common.bean.Result;
import org.hermes.login.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by admin on 2016/2/17.
 */
@Service
public class LoginService {
    @Autowired
    private LoginDao loginDao;
    Map<String, String> map=new HashMap<String, String>();

    public Result checkLogin(String username,String password,HttpSession session){
        map.clear();
        map.put("username", username);
        map.put("password",password);
        return Result.build(loginDao.loginCheck(map)+"","");
    }
}
