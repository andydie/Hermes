package org.hermes.admin.bean;

/**
 * Created by admin on 2016/2/21.
 */
public class WayBill {
    private String id;
    private String itemName;
    private String originPlace;
    private String destination;
    private String weight;
    private String expense;
    private String state;
    private String createTime;
    private String sender;
    private String receiver;
    private String receivedTime;
    private String staffId;
    private String staffName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getOriginPlace() {
        return originPlace;
    }

    public void setOriginPlace(String originPlace) {
        this.originPlace = originPlace;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getExpense() {
        return expense;
    }

    public void setExpense(String expense) {
        this.expense = expense;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getReceivedTime() {
        return receivedTime;
    }

    public void setReceivedTime(String receivedTime) {
        this.receivedTime = receivedTime;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    @Override
    public String toString() {
        return "WayBill{" +
                "id='" + id + '\'' +
                ", itemName='" + itemName + '\'' +
                ", originPlace='" + originPlace + '\'' +
                ", destination='" + destination + '\'' +
                ", weight='" + weight + '\'' +
                ", expense='" + expense + '\'' +
                ", state='" + state + '\'' +
                ", createTime='" + createTime + '\'' +
                ", sender='" + sender + '\'' +
                ", receiver='" + receiver + '\'' +
                ", receivedTime='" + receivedTime + '\'' +
                ", staffId='" + staffId + '\'' +
                ", staffName='" + staffName + '\'' +
                '}';
    }
}
