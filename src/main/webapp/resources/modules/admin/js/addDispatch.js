/**
 * Created by admin on 2016/2/29.
 */
require(['jquery',
        'underscore',
        'easyui',
        'bootstrap',
        'util',
        'metisMenu',
        'datatables',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css'],
    function($,_){
        $('#side-menu').metisMenu();

        var vehicleId;
        var driverId;

        $('.choose-vehicle').on('click',function(){
            $('#vehicle-modal').window();
            $._send("admin/ajax/queryVehicle",function(data){
                var vehicleData=_.filter(data,function(vehicle){
                   return vehicle.state=='0';
                });
                console.log(vehicleData);
                $('#dg-vehicle').datagrid({
                    data:vehicleData,
                    singleSelect:true
                });
                $('#vehicle-modal').window('open');
            });
        });

        $('.choose-driver').on('click',function(data){
            $('#driver-modal').window();
            $._send('admin/ajax/queryDriver',function(data){
                var driverData=_.filter(data,function(driver){
                    return driver.state=='0';
                });
                console.log(driverData);
                $('#dg-driver').datagrid({
                    data:driverData,
                    singleSelect:true
                });
                $('#driver-modal').window('open');
            });
        });

        $('#vehicle-modal .dlg-confirm').on('click',function(){
           var node=$('#dg-vehicle').datagrid('getChecked');
            $('#vehicle-modal').window('close');
            vehicleId=node[0].id;
            console.log(vehicleId);
            $('.choose-vehicle-input').val(node[0].plateNumber);
        });
        $('#driver-modal .dlg-confirm').on('click',function(){
            var node=$('#dg-driver').datagrid('getChecked');
            $('#driver-modal').window('close');
            driverId=node[0].id;
            console.log(driverId);
            $('.choose-driver-input').val(node[0].name);
        });

        $('#commitDispatch').on('click',function(){
            var originPlace=$('#origin-place').val();
            var destination=$('#destination').val();
            if(vehicleId&&driverId&&originPlace&&destination){
                $.sendj('admin/ajax/addDispatchInfo',{
                    vehicleId:vehicleId,
                    driverId:driverId,
                    originPlace:originPlace,
                    destination:destination
                },function(data){
                    console.log(data);
                    location.href='admin/dispatch/list';
                });
            }else{
                $('.dispatch-alter').css({display:'block'});
                setTimeout(function(){
                    $('.dispatch-alter').css({display:'none'});
                },1000);
            }
        });
    }
);