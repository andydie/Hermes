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
        'css!modules/admin/css/sb-admin-2.css'],
    function($,_){
        $('#side-menu').metisMenu();
        hi.initMenu($);
        initTable();
        $('#addVehicle').click(function(){
            $('.vehicle-modal').modal();
        });
        $('.modal-close').click(function(){
            $('.vehicle-modal').modal('hide');
        });
        $('.vehicle-modal .modal-confirm').click(function(){
            var plateNumber=$('.vehicle-modal .plateNumber').val(),
                vehicleType=$('.vehicle-modal .vehicleType').val(),
                ownerName=$('.vehicle-modal .ownerName').val(),
                ownerTel=$('.vehicle-modal .ownerTel').val(),
                ownerIdNumber=$('.vehicle-modal .ownerIdNumber').val(),
                ownerAddress=$('.vehicle-modal .ownerAddress').val(),
                remark=$('.vehicle-modal .remark').val();
            var newVehicleData={
                plateNumber:plateNumber,
                vehicleType:vehicleType,
                ownerName:ownerName,
                ownerTel:ownerTel,
                ownerIdNumber:ownerIdNumber,
                ownerAddress:ownerAddress,
                remark:remark
            };
            $.sendj('admin/ajax/addVehicle', newVehicleData, function(data){
                initTable();
                $('.vehicle-modal input').val('');
                $('.vehicle-modal').modal('hide');
            });
        });

        $('#wayBillTable').on('click','.waybill-del',function(){
            var waybillId=$(this).attr('waybillId');
            $.confirmOn({
                tipText: "是否删除该条运单？",
                confirmBtn: "删除",
                cancelBtn: "取消",
                confirmId:'delWaybill',
                afterConfirm: function () {
                    $.sendj('admin/ajax/deleteWayBill',{id:waybillId},function(data){
                        $.confirmOff('delWaybill');
                        initTable();
                    })
                }
            });
        });
    }
);
function initTable(){
    $._send('admin/ajax/queryWayBill',function(data){
        table&&table.fnClearTable();
        tableData=data;
        loadTableData(data);
        console.log(data);
    });
}
function loadTableData(data){
    table=$('#wayBillTable').dataTable({
        data:data,
        columnDefs: [
            {
                targets: 0,
                data:'id',
                title:'id',
                visible: false,
                searchable: false
            },
            {
                targets:1,
                data:'itemName',
                title:'物品'
            },
            {
                targets:2,
                data:'originPlace',
                title:'起始地'
            },
            {
                targets:3,
                data:'destination',
                title:'目的地'
            },
            {
                targets:4,
                data:'weight',
                title:'重量'
            },
            {
                targets:5,
                data:'sender',
                title:'寄送人'
            },
            {
                targets:6,
                data:'receiver',
                title:'收件人'
            },
            {
                targets:7,
                data:null,
                searchable:false,
                orderable:false,
                defaultContent:'<button type="button" class="btn btn-danger btn-sm waybill-del">del</button>'
            }
        ],
        rowCallback:function( row, data, index ){
            var id=data.id;
            $('td',row).last().find('button').attr('waybillId',id).attr("index",index);
        },
        "bDestroy":true
    });
}
function delVehicle(id,row){
    $.confirmOn({
        tipText: "是否删除该条信息？",
        confirmBtn: "删除",
        cancelBtn: "取消",
        confirmId:'delVehicle',
        afterConfirm: function () {
            $.sendj('admin/ajax/deleteVehicle',{id:id},function(data){
                initTable();
                $.confirmOff('delVehicle');
            })
        }
    });
}