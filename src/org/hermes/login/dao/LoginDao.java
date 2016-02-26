package org.hermes.login.dao;

import java.util.Map;

/**
 * Created by admin on 2016/2/17.
 */
public interface LoginDao {
    public int loginCheck(Map<String,String> map);
}
