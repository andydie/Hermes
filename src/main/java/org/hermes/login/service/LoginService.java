package org.hermes.login.service;

import org.hermes.common.bean.Result;
import org.hermes.login.bean.LoginInfo;
import org.n3r.eql.Eql;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

/**
 * Created by admin on 2016/2/17.
 */
@Service
public class LoginService {
    public Result checkLogin(LoginInfo loginInfo,HttpSession session){
        return Result.build(new Eql().limit(1).params(loginInfo).returnType(String.class).execute(), "");
    }
}
