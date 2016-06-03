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
        $._send('admin/getWayBillID',function(data){
           console.log(data);
            $('#waybillId').text(data.code);
        });
    }
);


