/**
 * Created by admin on 2016/2/29.
 */
var table,
    dispatchData;
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
        $._send('admin/ajax/queryDispatchInfo',function(data){
            dispatchData=data;
            drawTable(dispatchData);
        })
    }
);
function drawTable(data){
    $('#dispatchTable').dataTable({
        data:data,
        columnDefs:[
            {
                targets:0,
                data:'id'
            },{
                targets:1,
                data:'vehicleId'
            },{
                targets:2,
                data:'driverId'
            },{
                targets:3,
                data:'originPlace'
            },{
                targets:4,
                data:'destination'
            },{
                targets:5,
                data:function( row, type, set, meta ){
                    return row.state=='1'?'抵达':'在途';
                }
            },{
                targets:6,
                data:'arriveTime'
            },{
                targets:7,
                data:null,
                defaultContent:' ',
                searchable:false,
                orderable:false
            }
        ]
    });
}