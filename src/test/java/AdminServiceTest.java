import org.hermes.admin.service.AdminService;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Cabeza on 2016/5/15.
 */
public class AdminServiceTest {
    private static Logger log= LoggerFactory.getLogger(AdminServiceTest.class);
    String conf= "applicationContext.xml";
    ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
    AdminService adminService=ac.getBean("adminService",AdminService.class);
    @Test
    public void getDispatchByIdTest(){
        log.info(adminService.getDispatchById("1").toString());
    }

    @Test
    public void queryDriverByIdTest(){
        log.info(adminService.queryDriverById("1").toString());
    }

    @Test
    public void queryVehicleByIdTest(){
        log.info(adminService.queryVehicleById("12").toString());
    }
}
