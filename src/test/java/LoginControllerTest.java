import org.hermes.common.bean.Result;
import org.hermes.login.bean.LoginInfo;
import org.hermes.login.controller.LoginController;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Cabeza on 2016/4/15.
 */
public class LoginControllerTest {

    @Test
    public void testCheckLogin(){
        Logger log= LoggerFactory.getLogger(LoginController.class);
        String conf= "applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
        LoginController loginController=ac.getBean("loginController", LoginController.class);
        Result result=loginController.checkLogin(new LoginInfo("test", "test"), null);
        log.info("result{}:"+result);
    }
}
