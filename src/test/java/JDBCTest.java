import org.hermes.login.dao.LoginDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by admin on 2016/2/17.
 */
public class JDBCTest {
    public static void main(String[] args) {
        String conf= "applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
        LoginDao adminDao=ac.getBean("loginDao",LoginDao.class);
        Map<String,String> map=new HashMap<String, String>();
        map.put("username","test");
        map.put("password", "test");
        System.out.println(adminDao.loginCheck(map));
    }
}
