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

    public WayBill getWayBillById(String id){
        return new Eql().selectFirst("getWayBillById").params(Collections.asMap("id",id)).returnType(WayBill.class).execute();
    }

    public Result deleteWayBill(String id){
        int result=new Eql().delete("deleteWayBill").params(id).execute();
        if(result==1)
            return Result.build("2",id,"del suc");
        return Result.build("0",id,"del error");
    }

    public Result addDispatchInfo(DispatchInfo dispatchInfo){
        updateVehicleState(dispatchInfo.getVehicleId(),"1");
        updateDriverState(dispatchInfo.getDriverId(),"1");
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

    public Result changeDispatchInfoState(String dispatchId,String state){
        int result=new Eql().update("changeDispatchInfoState").params(Collections.asMap("dispatchId",dispatchId,"state",state)).execute();
        if(result<1)
            return Result.build("0","更新失败");
        return Result.build("2","更新成功");
    }
    public Result setDispatchArrivalTime(String dispatchId){
        int result=new Eql().update("setDispatchArrivalTime").params(Collections.asMap("dispatchId",dispatchId)).execute();
        if(result<1)
            return Result.build("0","更新失败");
        return Result.build("2","更新成功");
    }

    public Result dispatchArrival(String dispatchId){
        DispatchInfo dispatchInfo=getDispatchById(dispatchId);
        updateDriverState(dispatchInfo.getDriverId(),"0");
        updateVehicleState(dispatchInfo.getVehicleId(),"0");
        changeDispatchInfoState(dispatchId,"2");
        setDispatchArrivalTime(dispatchId);
        List<WayBill> wayBills=getWayBillByDispatchId(dispatchId);
        for(int i=0;i<wayBills.size();i++){
            changeWayBillState(wayBills.get(i).getId(),"0");
            changeJourneyRecordState(dispatchId,wayBills.get(i).getId(),"2");
        }
        return Result.build("1","抵达");
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
    public Result updateDriverState(String driverId,String state){
        int result=new Eql().update("updateDriverState").params(Collections.asMap("driverId",driverId,"state",state)).execute();
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

    public Result updateVehicleState(String vehicleId,String state){
        int result=new Eql().update("updateVehicleState").params(Collections.asMap("vehicleId",vehicleId,"state",state)).execute();
        if(result<1)
            return Result.build("0","更新state失败");
        return Result.build("2","更新state成功");
    }

    public DispatchInfo getDispatchById(String id){
        return new Eql().selectFirst("getDispatchById").params(Collections.asMap("id",id)).returnType(DispatchInfo.class).execute();
    }

    public List<WayBill> getNotOnWayWayBill(){
        return new Eql().returnType(WayBill.class).execute();
    }

    public List<WayBill> getAlreadyOnWayWayBill(String dispatchId){
        return  new Eql().params(Collections.asMap("dispatchId",dispatchId)).returnType(WayBill.class).execute();
    }


    public Result addToJourneyRecord(String str,String dispatchId){
        String[] arr=str.split(",");
        for(int i=0;i<arr.length;i++){
            createJourneyRecord(arr[i],dispatchId);
            changeWayBillState(arr[i],"1");
        }
        return Result.build("1",str,dispatchId);
    }
    public Result deleteWayBillsFromJourneyRecord(String str,String dispatchId){
        String[] arr=str.split(",");
        for(int i=0;i<arr.length;i++){
            deleteJourneyRecord(arr[i], dispatchId);
            changeWayBillState(arr[i],"0");
        }
        return Result.build("1",str,dispatchId);
    }

    public void createJourneyRecord(String waybillId,String dispatchId){
        new Eql().params(Collections.asMap("waybillId",waybillId,"dispatchId",dispatchId)).execute();
    }

    public void deleteJourneyRecord(String dispatchId,String waybillId){
        new Eql().params(Collections.asMap("waybillId",waybillId,"dispatchId",dispatchId)).execute();
    }

    public void changeJourneyRecordState(String dispatchId,String waybillId,String state){
        new Eql().params(Collections.asMap("waybillId",waybillId,"dispatchId",dispatchId,"state",state)).execute();
    }


    public Result changeWayBillState(String waybillId,String state){
        int result=new Eql().update("changeWayBillState").params(Collections.asMap("waybillId",waybillId,"state",state)).execute();
        if(result>0)
            return Result.build("1","update suc");
        return Result.build("0","update error");
    }

    public void setWayBillArriveTime(String wayBillId){
        new Eql().params(Collections.asMap("wayBillId",wayBillId)).execute();
    }

    public List<DispatchInfo> getJourneyRecordByWayBillId(String wayBillId){
        return  new Eql().params(Collections.asMap("wayBillId",wayBillId)).returnType(DispatchInfo.class).execute();
    }

    public List<WayBill> getWayBillByDispatchId(String dispatchId){
        return new Eql().params(Collections.asMap("dispatchId",dispatchId)).returnType(WayBill.class).execute();
    }


    public Result setWayBillStaffId(String wayBillId,String staffId){
        int result=new Eql().update("setWayBillStaffId").params(Collections.asMap("wayBillId",wayBillId,"staffId",staffId)).execute();
        if(result>0)
            return Result.build("1","更新成功");
        return Result.build("0","更新失败");
    }
}
