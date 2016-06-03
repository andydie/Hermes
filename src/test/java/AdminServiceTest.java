import org.hermes.admin.service.AdminService;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

/**
 * Created by Cabeza on 2016/5/15.
 */
public class AdminServiceTest {
    private static Logger log= LoggerFactory.getLogger(AdminServiceTest.class);
    String conf= "applicationContext.xml";
    ApplicationContext ac;
    AdminService adminService;

    public void initService(){
        ac=new ClassPathXmlApplicationContext(conf);
        adminService=ac.getBean("adminService",AdminService.class);
    }

    @Test
    public void queryWayBillTest(){
        initService();
        log.info(adminService.queryWayBill().toString());
    }

    @Test
    public void getDispatchByIdTest(){
        initService();
        log.info(adminService.getDispatchById("1").toString());
    }

    @Test
    public void queryDriverByIdTest(){
        initService();
        log.info(adminService.queryDriverById("1").toString());
    }

    @Test
    public void queryVehicleByIdTest(){
        initService();
        log.info(adminService.queryVehicleById("12").toString());
    }

    @Test
    public void getWayBillByIdTest(){
        initService();
        log.info(adminService.getWayBillById("3").toString());
    }

    @Test
    public void dateFormatTest(){
        Date date=new Date();
        date.setTime(Long.parseLong("1463587200000"));
        System.out.println(date);
    }

    @Test
    public void queryWayBillByItemNameTest(){
        initService();
        log.info(adminService.queryWayBillByItemName("大豆").toString());
    }

    @Test
    public void queryWayBillByOriginPlaceTest(){
        initService();
        log.info(adminService.queryWayBillByOriginPlace("蚌埠").toString());
    }
    @Test
    public void queryWayBillByDestinationTest(){
        initService();
        log.info(adminService.queryWayBillByDestination("苏州").toString());
    }

    @Test
    public void queryWayBillLimitTimeTest(){
        initService();
        log.info(adminService.queryWayBillLimitTime("1463587200000","1463590243675").toString());
    }

    @Test
    public void getWayBillIDTest(){
        initService();
        log.info(adminService.getWayBillID().toString());
    }
}
