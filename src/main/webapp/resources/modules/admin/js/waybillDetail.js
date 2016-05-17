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
        var waybillId=hi.getQueryString('waybillId');
        $._send('admin/ajax/getWayBill/'+waybillId,function(data){
            console.log(data);
            initDataGrid(data);
        });

        function initDataGrid(waybillData){
            var waybillSign='运单信息';
            var gridData={};
            gridData.rows=new Array();
            gridData.rows.push({
                name:'货物名称',
                value:waybillData.itemName,
                group:waybillSign
            });
            gridData.rows.push({
                name:'起始地',
                value:waybillData.originPlace,
                group:waybillSign
            });
            gridData.rows.push({
                name:'目的地',
                value:waybillData.destination,
                group:waybillSign
            });
            gridData.rows.push({
                name:'重量',
                value:waybillData.weight,
                group:waybillSign
            });
            gridData.rows.push({
                name:'创建时间',
                value:waybillData.createTime,
                group:waybillSign
            });
            gridData.rows.push({
                name:'价格',
                value:waybillData.expense,
                group:waybillSign
            });
            gridData.rows.push({
                name:'发件人',
                value:waybillData.sender,
                group:waybillSign
            });
            gridData.rows.push({
                name:'收件人',
                value:waybillData.receiver,
                group:waybillSign
            });
            gridData.rows.push({
                name:'负责人',
                value:waybillData.staffName,
                group:waybillSign
            });

            $('#pg').propertygrid({
                data:gridData,
                showHeader:false
            });
        }
    }
);
