import org.hermes.admin.bean.WayBill;
import org.hermes.admin.controller.AdminController;
import org.hermes.admin.service.AdminService;
import org.hermes.common.bean.Collections;
import org.hermes.common.bean.Result;
import org.hermes.login.controller.LoginController;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Cabeza on 2016/4/15.
 */
public class AdminControllerTest {
    Logger log= LoggerFactory.getLogger(LoginController.class);
    @Test
    public void testAddWayBill(){
        String conf= "applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
        WayBill wayBill=new WayBill();
        wayBill.setItemName("itemname");
        AdminController adminController=ac.getBean("adminController",AdminController.class);
        Result result=adminController.addWayBill(wayBill);
        log.info("result{}:"+result);
    }

    @Test
    public void testQueryWayBill(){
        String conf="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
        AdminController adminController=ac.getBean("adminController",AdminController.class);
        List<WayBill> list=adminController.queryWayBill();
        log.info(list.toString());
    }

    @Test
    public void testDeleteWayBill(){
        String conf="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
        AdminController adminController=ac.getBean("adminController",AdminController.class);
        Result result=adminController.deleteWayBill(Collections.asMap("id","1"));
        log.info("result{}:"+result);
    }
}
