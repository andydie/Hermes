package org.hermes.admin.dao;

import org.hermes.admin.bean.DispatchInfo;
import org.hermes.admin.bean.Driver;
import org.hermes.admin.bean.Vehicle;
import org.hermes.admin.bean.WayBill;

import java.util.List;

/**
 * Created by admin on 2016/2/21.
 */
public interface AdminDao {
    public void addWayBill(WayBill wb);
    public List<WayBill> queryWayBill();
    public void deleteWayBill(String id);

    public void addDispatchInfo(DispatchInfo dispatchInfo);
    public List<DispatchInfo> queryDispatchInfo();
    public void deleteDispatchInfo(String id);

    public void addDriver(Driver driver);
    public List<Driver> queryDriver();
    public void deleteDriver(String id);
    public void updateDriver(Driver driver);

    public void addVehicleInfo(Vehicle vehicle);
    public List<Vehicle> queryVehicle();
    public void deleteVehicleInfo(int id);
    public void updateVehicleInfo(Vehicle vehicle);
}
