import org.hermes.common.bean.Collections;
import org.hermes.common.bean.Result;
import org.hermes.shiro.bean.Role;
import org.hermes.shiro.service.ShiroService;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Arrays;
import java.util.Set;

/**
 * Created by Cabeza on 2016/5/9.
 */
public class ShiroServiceTest {
    private static Logger log= LoggerFactory.getLogger(ShiroService.class);
    String conf= "applicationContext.xml";
    ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
    ShiroService shiroService=ac.getBean("shiroService",ShiroService.class);
    @Test
    public void testFindRoles(){

        Set<String> set=shiroService.findRoles("admin");
        log.info(set.toString());
    }
    @Test
    public void testFindPermissions(){

        log.info(shiroService.findPermissions("admin").toString());
    }
    @Test
    public void testFindByUsername(){
        log.info(shiroService.getByUserName("admin").toString());
    }
    @Test
    public void testGetAllUser(){
        log.info(shiroService.getAllUser().toString());
    }

    @Test
    public void testCollectionUtil(){
        log.info(Collections.asMap("1",1,"2",2).toString());
    }

    @Test
    public void testGetALlRole(){
        log.info(shiroService.getAllRole().toString());
    }
    @Test
    public void testGetAllPermission(){
        log.info(shiroService.getAllPermission().toString());
    }

    @Test
    public void testSplitPermissionStr(){
        String str1="";
        String str2="6";
        String str3="6,7,8,9,10,11,12,13";
        String[] arr1=str1.split(",");
        String[] arr2=str2.split(",");
        String[] arr3=str3.split(",");
        log.info(Arrays.toString(arr1));
        log.info(Arrays.toString(arr2));
        log.info(Arrays.toString(arr3));
    }

    @Test
    public void testAddRole(){
        Role role=new Role();
        role.setRoleName("haha");
        role.setRoleDesc("xixi");
        Result result=shiroService.addRole(role);
        log.info(result.toString());
    }
}
