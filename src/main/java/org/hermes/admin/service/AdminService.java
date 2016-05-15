package org.hermes.admin.service;

import org.hermes.admin.bean.DispatchInfo;
import org.hermes.admin.bean.Driver;
import org.hermes.admin.bean.Vehicle;
import org.hermes.admin.bean.WayBill;
import org.hermes.common.bean.Collections;
import org.hermes.common.bean.Result;
import org.n3r.eql.Eql;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2016/2/21.
 */
@Service
public class AdminService {
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
        int result=new Eql().insert("addDispatchInfo").params(dispatchInfo).execute();
        if(result<1)
            return Result.build("0","插入失败");
        return Result.build("2","插入成功");
    }

    public List<DispatchInfo> queryDispatchInfo(){
        return new Eql().returnType(DispatchInfo.class).execute();
    }

    public Result deleteDispatchInfo(String id){
        int result=new Eql().delete("deleteDispatchInfo").params(id).execute();
        if(result==1)
            return Result.build("2",id,"del suc");
        return Result.build("0",id,"del error");
    }

    public Result addDriver(Driver driver){
        int result=new Eql().insert("addDriver").params(driver).execute();
        if(result<1)
            return Result.build("0","插入失败");
        return Result.build("2","插入成功");
    }
    public List<Driver> queryDriver(){
        return new Eql().returnType(Driver.class).execute();
    }


    public Driver queryDriverById(String id){
        return new Eql().selectFirst("queryDriverById").params(Collections.asMap("id",id)).returnType(Driver.class).execute();
    }

    public Result deleteDriver(String id){
        int result=new Eql().delete("deleteDriver").params(id).execute();
        if(result==1)
            return Result.build("2",id,"del suc");
        return Result.build("0",id,"del error");
    }
    public Result updateDriver(Driver driver){
        int result=new Eql().update("updateDriver").params(driver).execute();
        if(result<1)
            return Result.build("0","更新失败");
        return Result.build("2","更新成功");
    }

    public Result addVehicle(Vehicle vehicle){
        int result=new Eql().insert("addVehicle").params(vehicle).execute();
        if(result<1)
            return Result.build("0","插入失败");
        return Result.build("2","插入成功");
    }
    public List<Vehicle> queryVehicle(){
        return new Eql().returnType(Vehicle.class).execute();
    }

    public Vehicle queryVehicleById(String id){
        return new Eql().selectFirst("queryVehicleById").params(Collections.asMap("id",id)).returnType(Vehicle.class).execute();
    }

    public Result deleteVehicleInfo(String id){
        int result=new Eql().delete("deleteVehicleInfo").params(id).execute();
        if(result==1)
            return Result.build("2",id,"del suc");
        return Result.build("0",id,"del error");
    }
    public Result updateVehicleInfo(Vehicle vehicle){
        int result=new Eql().update("updateVehicleInfo").params(vehicle).execute();
        if(result<1)
            return Result.build("0","更新失败");
        return Result.build("2","更新成功");
    }

    public DispatchInfo getDispatchById(String id){
        return new Eql().selectFirst("getDispatchById").params(Collections.asMap("id",id)).returnType(DispatchInfo.class).execute();
    }
}
