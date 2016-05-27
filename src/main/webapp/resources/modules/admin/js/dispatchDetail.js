/**
 * Created by admin on 2016/2/29.
 */
var table,
    dispatchData;
require(['jquery',
        'underscore',
        'bootstrap',
        'util',
        'easyui',
        'metisMenu',
        'datatables',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css',
        'css!modules/admin/css/dispatchList.css'
    ],
    function($,_){
        $('#side-menu').metisMenu();
        hi.initMenu($);
        var dispatchId=hi.getQueryString('dispatchId');
        var vehicleId;
        var driverId;
        var dispatchData;
        var vehicleData;
        var driverData;
        $._send('admin/ajax/getDispatchById/'+dispatchId,function(data){
            vehicleId=data.vehicleId;
            driverId=data.driverId;
            dispatchData=data;
            $._send('admin/ajax/queryDriverById/'+driverId,function(data){
                driverData=data;
                console.log(data);
                if(driverData&&vehicleData)
                    initDataGrid(dispatchData,driverData,vehicleData);
            });
            $._send('admin/ajax/queryVehicleById/'+vehicleId,function(data){
                vehicleData=data;
                console.log(data);
                if(driverData&&vehicleData)
                    initDataGrid(dispatchData,driverData,vehicleData);
            });
            if(data.state=='0'){
                $('#send-btn').show();
                $('.state0').css({display:'block'});
                $._send('admin/ajax/getNotOnWayWayBill',function(data){
                    $('#dg').datagrid({
                        data:data,
                        singleSelect:false
                    });
                });

                $._send('admin/ajax/getAlreadyOnWayWayBill/'+dispatchId,function(data){
                    $('#delete-dg').datagrid({
                        data:data,
                        singleSelect:false
                    });
                });
            }else{
                data.state=='1'&&$('#arrival-btn').show();
                $('.state1').css({display:'block'});
                $._send('admin/ajax/getAlreadyOnWayWayBill/'+dispatchId,function(data){
                    $('#list-dg').datagrid({
                        data:data,
                        singleSelect:false
                    });
                });
            }
        });

        $('#delete-dispatch').on('click',function(){
            var list=$('#delete-dg').datagrid('getChecked');
            var s='';
            _.each(list,function(waybill){
                s!=''&&(s+=',');
                s+=waybill.id;
            });
            console.log(s);
            $.sendm('admin/ajax/deleteWayBillsFromJourneyRecord/'+dispatchId,{str:s},function(data){
                console.log(data);
                location.reload();
            });
        });

        $('#add-dispatch').on('click',function(){
            var list=$('#dg').datagrid('getChecked');
            var s='';
            _.each(list,function(waybill){
                s!=''&&(s+=',');
                s+=waybill.id;
            });
            console.log(s);
            $.sendm('admin/ajax/addToJourneyRecord/'+dispatchId,{str:s},function(data){
                location.reload();
            });
        });

        $('#send-btn').on('click',function(){
            $._send('admin/ajax/dispatchSend/'+dispatchId,function(data){
                console.log(data);
                location.href='admin/dispatch/list';
            });
        });

        $('#arrival-btn').on('click',function(){
            $._send('admin/ajax/dispatchArrival/'+dispatchId,function(data){
                console.log(data);
                location.href='admin/dispatch/list';
            });
        });
        function initDataGrid(dispatchData,driverData,vehicleData){
            var dispatchSign='调度信息';
            var driverSign='司机信息';
            var vehicleSign='车辆信息';
            var gridData={};
            gridData.rows=new Array();
            gridData.rows.push({
                name:'始发地',
                value:dispatchData.originPlace,
                group:dispatchSign
            });
            gridData.rows.push({
                name:'目的地',
                value:dispatchData.destination,
                group:dispatchSign
            });
            gridData.rows.push({
                name:'姓名',
                value:driverData.name,
                group:driverSign
            });
            gridData.rows.push({
                name:'性别',
                value:driverData.sex,
                group:driverSign
            });
            gridData.rows.push({
                name:'驾照号',
                value:driverData.driverLicenceNumber,
                group:driverSign
            });
            gridData.rows.push({
                name:'驾龄',
                value:driverData.driverYears,
                group:driverSign
            });
            gridData.rows.push({
                name:'车牌',
                value:vehicleData.plateNumber,
                group:vehicleSign
            });
            gridData.rows.push({
                name:'车型',
                value:vehicleData.vehicleType,
                group:vehicleSign
            });
            gridData.rows.push({
                name:'车主',
                value:vehicleData.ownerName,
                group:vehicleSign
            });
            gridData.rows.push({
                name:'车主电话',
                value:vehicleData.ownerTel,
                group:vehicleSign
            });
            console.log(gridData);
            $('#pg').propertygrid({
                data:gridData,
                showHeader:false
            });
        }
    }
);
