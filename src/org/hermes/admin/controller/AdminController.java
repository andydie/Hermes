package org.hermes.admin.controller;

import org.hermes.admin.bean.DispatchInfo;
import org.hermes.admin.bean.Driver;
import org.hermes.admin.bean.Vehicle;
import org.hermes.admin.bean.WayBill;
import org.hermes.admin.service.AdminService;
import org.hermes.common.bean.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2016/2/21.
 */
@RequestMapping("admin")
@Controller
public class AdminController {

    @Autowired
    AdminService adminService;

    @RequestMapping("ajax/addWayBill")
    @ResponseBody
    public Result add1WayBill(@RequestBody WayBill wb){
        return adminService.addWayBill(wb);
    }
    @ResponseBody
    @RequestMapping("ajax/queryWayBill")
    public List<WayBill> queryWayBill(){
        return adminService.queryWayBill();
    }

    @ResponseBody
    @RequestMapping("ajax/deleteWayBill")
    public Result deleteWayBill(@RequestBody Map<String,String> map){
       return adminService.deleteWayBill(map.get("id"));
    }

    @ResponseBody
    @RequestMapping("ajax/addDispatchInfo")
    public Result addDispatchInfo(@RequestBody DispatchInfo dispatchInfo){
        return adminService.addDispatchInfo(dispatchInfo);
    }
    @RequestMapping("ajax/queryDispatchInfo")
    @ResponseBody
    public List<DispatchInfo> queryDispatchInfo(){
        return adminService.queryDispatchInfo();
    }

    @ResponseBody
    @RequestMapping("ajax/addDriver")
    public Result addDriver(@RequestBody Driver driver){
        return adminService.addDriver(driver);
    }
    @ResponseBody
    @RequestMapping("ajax/queryDriver")
    public List<Driver> queryDriver(){
        return adminService.queryDriver();
    }

    @ResponseBody
    @RequestMapping("ajax/deleteDriver")
    public Result deleteDriver(@RequestBody Map<String,String> map){
        return adminService.deleteDriver(map.get("id"));
    }

    @ResponseBody
    @RequestMapping("ajax/updateDriver")
    public Result updateDriver(@RequestBody Driver driver){
        return adminService.updateDriver(driver);
    }
    @ResponseBody
    @RequestMapping("ajax/addVehicle")
    public Result addVehicle(@RequestBody Vehicle vehicle){
        return adminService.addVehicle(vehicle);
    }

    @ResponseBody
    @RequestMapping("ajax/queryVehicle")
    public List<Vehicle> queryVehicle(){
        return adminService.queryVehicle();
    }

    @ResponseBody
    @RequestMapping("ajax/deleteVehicle")
    public Result deleteVehicleInfo(@RequestBody Map<String,Integer> params){
        System.out.println(params);
        return adminService.deleteVehicleInfo(params.get("id"));
    }
    @ResponseBody
    @RequestMapping("ajax/updateVehicle")
    public Result updateVehicleInfo(@RequestBody Vehicle vehicle){
        return adminService.updateVehicleInfo(vehicle);
    }

    @RequestMapping("addWayBill")
    public String gotoAddWayBill(){
        return "admin/addWayBill";
    }

    @RequestMapping("createdispatch")
    public String gotoCreateDispatch(){
        return "admin/createDispatch";
    }

    @RequestMapping("manageVehicle")
    public String gotoManageVehicle(){
        return "admin/manageVehicle";
    }

    @RequestMapping("manageDriver")
    public String gotoManageDriver(){
        return "admin/manageDriver";
    }
}
