package org.hermes.admin.bean;

/**
 * Created by admin on 2016/2/22.
 */
public class Driver {
    private String id;
    private String name;
    private String sex;
    private String driverLicenceType;
    private String driverLicenceNumber;
    private String driverYears;
    private String idNumber;
    private String tel;
    private String address;
    private String remark;//备注
    private String state;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDriverLicenceType() {
        return driverLicenceType;
    }

    public void setDriverLicenceType(String driverLicenceType) {
        this.driverLicenceType = driverLicenceType;
    }

    public String getDriverLicenceNumber() {
        return driverLicenceNumber;
    }

    public void setDriverLicenceNumber(String driverLicenceNumber) {
        this.driverLicenceNumber = driverLicenceNumber;
    }

    public String getDriverYears() {
        return driverYears;
    }

    public void setDriverYears(String driverYears) {
        this.driverYears = driverYears;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Driver{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", driverLicenceType='" + driverLicenceType + '\'' +
                ", driverLicenceNumber='" + driverLicenceNumber + '\'' +
                ", driverYears='" + driverYears + '\'' +
                ", idNumber='" + idNumber + '\'' +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                ", remark='" + remark + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}
