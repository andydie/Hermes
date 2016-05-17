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

        $('.choose-vehicle').on('click',function(){
            $('#dlg-vehicle').dialog();
            $._send("admin/ajax/queryVehicle",function(data){
                var vehicleData=_.filter(data,function(vehicle){
                   return vehicle.state=='0';
                });
                console.log(vehicleData);
                $('#dg-vehicle').datagrid({
                    data:vehicleData,
                    singleSelect:true
                });
                $('#dlg-vehicle').dialog('open');
            });
        });
        $('#dlg-vehicle .dlg-confirm').on('click',function(){
           var node=$('#dg-vehicle').datagrid('getChecked');
            $('#dlg-vehicle').dialog('close');
            console.log(node[0].plateNumber);
            $('.choose-vehicle-input').val(node[0].plateNumber);
        });
    }
);