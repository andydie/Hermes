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
        $('.update-vehicle-modal .modal-confirm').click(function(){
            var plateNumber=$('.update-vehicle-modal .plateNumber').val(),
                vehicleType=$('.update-vehicle-modal .vehicleType').val(),
                ownerName=$('.update-vehicle-modal .ownerName').val(),
                ownerTel=$('.update-vehicle-modal .ownerTel').val(),
                ownerIdNumber=$('.update-vehicle-modal .ownerIdNumber').val(),
                ownerAddress=$('.update-vehicle-modal .ownerAddress').val(),
                remark=$('.update-vehicle-modal .remark').val(),
                id=$('.update-vehicle-modal .id').val();
            var data={
                id:id,
                plateNumber:plateNumber,
                vehicleType:vehicleType,
                ownerName:ownerName,
                ownerTel:ownerTel,
                ownerIdNumber:ownerIdNumber,
                ownerAddress:ownerAddress,
                remark:remark
            };
            $.sendj('admin/ajax/updateVehicle',data,function(data){
                console.log(data);
                $('.update-vehicle-modal').modal('hide');
                initTable();
            })
        });
    }
);
function initTable(){
    $._send('admin/ajax/queryVehicle',function(data){
        table&&table.fnClearTable();
        tableData=data;
        loadTableData(data);
    });
}
function loadTableData(data){
    table=$('#vehicleTable').dataTable({
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
                data:'plateNumber',
                title:'车牌'
            },
            {
                targets:2,
                data:'vehicleType',
                title:'车辆类型'
            },
            {
                targets:3,
                data:'ownerName',
                title:'车主'
            },
            {
                targets:4,
                data:'ownerTel',
                title:'电话'
            },
            {
                targets:5,
                data:'ownerIdNumber',
                title:'车主身份证'
            },
            {
                targets:6,
                data:'ownerAddress',
                title:'地址'
            },
            {
                targets:7,
                data:'remark',
                title:'备注'
            },{
                targets:8,
                data:null,
                defaultContent:'<button type="button" class="btn btn-danger btn-sm vehicle-del">删除</button>' +
                '<button type="button" class="btn btn-primary btn-sm vehicle-update">更改</button>'
            }
        ],
        rowCallback:function( row, data, index ){
            var id=data.id;
            $('td',row).last().find('button').attr('vehicleId',id).attr("index",index);
        },
        drawCallback:function(){
            $('.vehicle-del').click(function(btn){
                var id=$(btn.target).attr('vehicleId')
                    row=$(btn.target).parents('tr');
                delVehicle(id,row)
            });
            $('.vehicle-update').click(function(btn){
                var id=$(btn.target).attr('vehicleId');
                var data= _.find(tableData,function(data){
                    return data.id==id;
                });
                updateVehicle(data)
            });
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
function updateVehicle(data){
    $('.update-vehicle-modal .id').val(data.id);
    $('.update-vehicle-modal .plateNumber').val(data.plateNumber);
    $('.update-vehicle-modal .vehicleType').val(data.vehicleType),
    $('.update-vehicle-modal .ownerName').val(data.ownerName);
    $('.update-vehicle-modal .ownerTel').val(data.ownerTel);
    $('.update-vehicle-modal .ownerIdNumber').val(data.ownerIdNumber);
    $('.update-vehicle-modal .ownerAddress').val(data.ownerAddress);
    $('.update-vehicle-modal .remark').val(data.remark);
    $('.update-vehicle-modal').modal();
}