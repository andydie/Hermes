import org.hermes.shiro.service.ShiroService;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Set;

/**
 * Created by Cabeza on 2016/5/9.
 */
public class ShiroServiceTest {
    private static Logger log= LoggerFactory.getLogger(ShiroService.class);
    @Test
    public void testFindRoles(){
        String conf= "applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
        ShiroService shiroService=ac.getBean("shiroService",ShiroService.class);
        Set<String> set=shiroService.findRoles("admin");
        log.info(set.toString());
    }
    @Test
    public void testFindPermissions(){
        String conf= "applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
        ShiroService shiroService=ac.getBean("shiroService",ShiroService.class);
        log.info(shiroService.findPermissions("admin").toString());
    }
    @Test
    public void testFindByUsername(){
        String conf= "applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
        ShiroService shiroService=ac.getBean("shiroService",ShiroService.class);
        log.info(shiroService.getByUserName("admin").toString());
    }
}
