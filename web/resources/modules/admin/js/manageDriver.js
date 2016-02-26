/**
 * Created by admin on 2016/2/26.
 */
/**
 * Created by admin on 2016/2/21.
 */
var driverData;
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
        initTable();
        $('.modal-close').click(function(){
            $('.vehicle-modal').modal('hide');
        });
        $('#vehicleTable tbody').on('click','td.details-control',function(){
            var tr=$(this).parents('tr');
            var row=table.api().row(tr);
            if ( row.child.isShown() ) {
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                row.child(detailsFormat(row.data()) ).show();
                tr.addClass('shown');
            }
        });
        $('#addDriver').click(function(){
            $('.add-driver-modal').modal();
        });
        $('.add-driver-modal .modal-confirm').click(function(){
            var name=$('.add-driver-modal .name').val(),
                sex=$('.add-driver-modal .sex').val(),
                driverLicenceType=$('.add-driver-modal .driverLicenceType').val(),
                driverLicenceNumber=$('.add-driver-modal .driverLicenceNumber').val(),
                driverYears=$('.add-driver-modal .driverYears').val(),
                idNumber=$('.add-driver-modal .idNumber').val(),
                tel=$('.add-driver-modal .tel').val(),
                address=$('.add-driver-modal .address').val(),
                remark=$('.add-driver-modal .remark').val();
            var data={
                name:name,
                sex:sex,
                driverLicenceType:driverLicenceType,
                driverLicenceNumber:driverLicenceNumber,
                driverYears:driverYears,
                idNumber:idNumber,
                tel:tel,
                address:address,
                remark:remark
            }
            $.sendj('admin/ajax/addDriver',data,function(res){
                data.id=res.msg;
                driverData.push(data);
                updateTable();
                $('.add-driver-modal').modal('hide');
            });
        });
    }
);
function initTable(){
    $._send("admin/ajax/queryDriver",function(data){
        driverData=data;
        drawTable(driverData);
    });
}
function updateTable(){
    $('#vehicleTable').html('');
    drawTable(driverData);
}
function drawTable(data){
    table= $('#vehicleTable').dataTable({
        data:data,
        columnDefs:[
            {
                targets:0,
                data:'id',
                visible:false,
                searchable:false
            }, {
                targets:1,
                data:'name'
            },{
                targets:2,
                data:'sex'
            },{
                targets:3,
                data:'driverLicenceNumber'
            },{
                targets:4,
                data:'driverLicenceType'
            },{
                targets:5,
                data:'driverYears'
            },{
                targets:6,
                visible:false,
                data:'idNumber'
            },{
                targets:7,
                data:'tel'
            },{
                targets:8,
                visible:false,
                data:'address'
            },{
                targets:9,
                visible:false,
                data:'remark'
            },{
                targets:10,
                data:null,
                class:'details-control',
                orderable:'false',
                defaultContent:''
            },{
                targets:11,
                data:null,
                searchable:false,
                orderable:false,
                defaultContent:'<button class="btn btn-primary btn-sm update">更改</button>' +
                                '<button class="btn btn-danger btn-sm delete">删除</button>'
            }
        ],
        drawCallback:function(){
            $('#vehicleTable tbody').on('click','button',function(){
                var tr=$(this).parents('tr');
                var rowData=table.api().row(tr).data();
                if($(this).hasClass('delete')){
                    $.confirmOn({
                        tipText: "是否删除该条信息？",
                        confirmBtn: "删除",
                        cancelBtn: "取消",
                        confirmId:'delDriver',
                        afterConfirm: function () {
                            $.sendj('admin/ajax/deleteDriver',{id:rowData.id},function(data){
                                driverData.remove(rowData);
                                updateTable();
                                $.confirmOff('delDriver');
                            })
                        }
                    });
                }
                if($(this).hasClass('update')){

                }
            });
        },
        "bDestroy":true
    });
}
function detailsFormat ( d ) {
    return '<dl class="dl-horizontal">' +
        '<dt>身份证号</dt>'+
        '<dd>'+ d.idNumber+'</dd>'+
        '<dt>联系地址</dt>'+
        '<dd>'+ d.address+'</dd>'+
        '<dt>备注</dt>'+
        '<dd>'+ d.remark+'</dd>'+
        '</dl>'
}