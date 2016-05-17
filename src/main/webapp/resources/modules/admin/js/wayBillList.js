/**
 * Created by admin on 2016/2/21.
 */
var tableData;
var table;
require(['jquery',
        'underscore',
        'bootstrap',
        'util',
        'metisMenu',
        'datatables',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css',
        'css!modules/admin/css/wayBillList.css'
    ],
    function($,_){
        $('#side-menu').metisMenu();
        $._send('admin/ajax/queryWayBill',function(data){
            console.log(data);
            _.each(data,function(waybill){
                $('.waybill-list').append(formatWayBillItem(waybill));
            });
        });
    }
);

function formatWayBillItem(waybill){
    var btnClass='btn-primary waybill-task';
    var btnText='领取运单';
    if(waybill.staffName!=null){
        btnClass='btn-success waybill-staff';
        btnText='负责人 '+waybill.staffName;
    }
    return '<div class="col-xs-3 waybill-item">'+
        '<div class="waybill-path">'+
        waybill.originPlace+'-'+waybill.destination+
    '</div>'+
    '<div class="waybill-name">'+
    waybill.itemName+
    '</div>'+
    '<div class="waybill-weight">'+
    waybill.weight+
    '</div>'+
    '<div class="waybill-createtime">'+
    waybill.createTime+
    '</div>'+
    '<div class="line">'+
    '</div>'+
    '<div class="waybill-btn">'+
    '<button class="btn ' +
        btnClass +
        '" type="button">'+
    '<span>'+
    btnText+
    '</span>'+
    '</button>'+
    '</div>'+
    '<br>'+

    '<span class="waybill-delete" role-id="1">'+
    '<i class="fa fa-undo">'+'</i>'+
    '  <span>删除</span>'+
    '</span>'+
    '<span class="waybill-detail">'+
    '<a href="' +
        'admin/waybill/detail?waybillId=' +waybill.id+
        '">'+
    '<i class="fa fa-edit">'+'</i>'+
    '  <span>详情</span>'+
    '</a>'+
    '</span>'+
    '</div>';
}
