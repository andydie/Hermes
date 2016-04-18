package org.hermes.admin.service;

import org.hermes.admin.bean.DispatchInfo;
import org.hermes.admin.bean.Driver;
import org.hermes.admin.bean.Vehicle;
import org.hermes.admin.bean.WayBill;
import org.hermes.admin.dao.AdminDao;
import org.hermes.common.bean.Result;
import org.n3r.eql.Eql;
import org.n3r.eql.EqlPage;
import org.n3r.eql.pojo.Pql;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2016/2/21.
 */
@Service
public class AdminService {
    @Autowired
    AdminDao adminDao;
    public Result addWayBill(WayBill wb){
        int result=new Eql().insert("addWayBill").params(wb).execute();
        if(result<1)
            return Result.build("0","插入失败");
        return Result.build("2","插入成功");
    }
    public List<WayBill> queryWayBill(){
        return new Eql().returnType(WayBill.class).execute();
    }

    public Result deleteWayBill(String id){
        int result=new Eql().delete("deleteWayBill").params(id).execute();
        if(result==1)
            return Result.build("2",id,"del suc");
        return Result.build("0",id,"del error");
    }

    public Result addDispatchInfo(DispatchInfo dispatchInfo){
        adminDao.addDispatchInfo(dispatchInfo);
        return Result.build("1",dispatchInfo.getId(),"suc");
    }

    public List<DispatchInfo> queryDispatchInfo(){
        return adminDao.queryDispatchInfo();
    }

    public Result deleteDispatchInfo(String id){
        adminDao.deleteDispatchInfo(id);
        return Result.build("2",id,"del suc");
    }

    public Result addDriver(Driver driver){
        adminDao.addDriver(driver);
        return Result.build("1",driver.getId(),"suc");
    }
    public List<Driver> queryDriver(){
        return adminDao.queryDriver();
    }

    public Result deleteDriver(String id){
        adminDao.deleteDriver(id);
        return Result.build("2",id,"del suc");
    }
    public Result updateDriver(Driver driver){
        adminDao.updateDriver(driver);
        return Result.build("3",driver.getId(),"update suc");
    }

    public Result addVehicle(Vehicle vehicle){
        adminDao.addVehicleInfo(vehicle);
        return Result.build("1",vehicle.getId(),"suc");
    }
    public List<Vehicle> queryVehicle(){
        return adminDao.queryVehicle();
    }

    public Result deleteVehicleInfo(int id){
        adminDao.deleteVehicleInfo(id);
        return Result.build("2",id+"","del suc");
    }
    public Result updateVehicleInfo(Vehicle vehicle){
        adminDao.updateVehicleInfo(vehicle);
        return Result.build("3",vehicle.getId(),"update sec");
    }
}
