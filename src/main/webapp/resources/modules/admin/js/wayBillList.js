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
        hi.initMenu($);
        $._send('admin/ajax/queryWayBill',function(data){
            console.log(data);
            _.each(data,function(waybill){
                $('.waybill-list').append(formatWayBillItem(waybill));
            });
        });

        $('.waybill-list').on('click','.waybill-delete',function(){
            var wayBillId=$(this).attr('value');
            $.confirmOn({
                tipText: "是否删除该运单？",
                confirmBtn: "删除",
                cancelBtn: "取消",
                confirmId: 'deleteWayBill',
                afterConfirm: function () {
                    $._send('admin/ajax/softDeleteWayBill/'+wayBillId,function(data){
                        console.log(data);
                        $.confirmOff('deleteWayBill');
                        location.reload();
                    });
                }
            });
        });

        $('.waybill-list').on('click','.waybill-task',function(){
            var wayBillId=$(this).attr('value');
            $._send('shiro/getCurrentStaffId',function(data){
                var staffId=data;
                $.sendm('admin/setWayBillStaffId/'+wayBillId,{staffId:staffId},function(data){
                    console.log(data);
                    location.reload();
                });
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
    waybill.weight+'kg'+
    '</div>'+
    '<div class="waybill-createtime">'+
    waybill.createTime+
    '</div>'+
    '<div class="line">'+
    '</div>'+
    '<div class="waybill-btn">'+
    '<button class="btn ' +
        btnClass +
        '"value="' +
        waybill.id +
        '" type="button">'+
    '<span>'+
    btnText+
    '</span>'+
    '</button>'+
    '</div>'+
    '<br>'+

    '<span class="waybill-delete" value="' +
        waybill.id +
        '" role-id="1">'+
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
