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
        'css!modules/admin/css/sb-admin-2.css',
        'css!modules/admin/css/wayBillList.css'
    ],
    function($,_){
        $('#side-menu').metisMenu();
        var $wayBillList=$('.waybill-list');
        var $alertEmpty=$('.alert-empty');
        $('.query-waybill-id button').on('click',function(){
            var wayBillId=$('.query-waybill-id input').val();
            if(wayBillId==null||wayBillId==''){
                return showWarning();
            }
            $wayBillList.html(' ');
            $._send('admin/ajax/getWayBill/'+wayBillId,function(data){
                console.log(data);
                if(data==''||data==null)
                    return showEmptyAlert();
                appendQueryResult(data);
            });
        });

        $('.query-waybill-item-name button').on('click',function(){
            var wayBillItemName=$('.query-waybill-item-name input').val();
            if(wayBillItemName==null||wayBillItemName==''){
                return showWarning();
            }
            $wayBillList.html(' ');
            $.sendm('admin/ajax/queryWayBillByItemName',{itemName:wayBillItemName},function(data){
                console.log(data);
                if(data==''||data==null)
                    return showEmptyAlert();
                appendQueryResult(data);
            });
        });

        $('.query-waybill-origin-place button').on('click',function(){
            var originPlace=$('.query-waybill-origin-place input').val();
            if(originPlace==null||originPlace==''){
                return showWarning();
            }
            $wayBillList.html(' ');
            $.sendm('admin/ajax/queryWayBillByOriginPlace',{originPlace:originPlace},function(data){
                console.log(data);
                if(data==''||data==null)
                    return showEmptyAlert();
                appendQueryResult(data);
            });
        });
        $('.query-waybill-destination button').on('click',function(){
            var destination=$('.query-waybill-destination input').val();
            if(destination==null||destination==''){
                return showWarning();
            }
            $wayBillList.html(' ');
            $.sendm('admin/ajax/queryWayBillByDestination',{destination:destination},function(data){
                console.log(data);
                if(data==''||data==null)
                    return showEmptyAlert();
                appendQueryResult(data);
            });
        });

        $('.query-waybill-limit-time button').on('click',function(){
            try{
                var beginStr=$('#begin-time').datebox('getValue').toString();
                var endStr=$('#end-time').datebox('getValue').toString();
            }catch(e){
                $('.easyui-datebox').datebox();
                return showWarning();
            }
            if(beginStr&&endStr){
                $wayBillList.html(' ');
                beginStr=new Date(beginStr).setHours(0).toString();
                endStr=new Date(endStr).setHours(0).toString();
                $.sendm('admin/ajax/queryWayBillLimitTime',{beginStr:beginStr,endStr:endStr},function(data){
                    console.log(data);
                    if(data==''||data==null)
                        return showEmptyAlert();
                    appendQueryResult(data);
                });
            }else{
                return showWarning();
            }
        });


        $('.easyui-datebox').on('click',function(){
            $('.easyui-datebox').datebox();
        });
        function showWarning(){
            $('.query-alert').show();
            setTimeout(function(){
                $('.query-alert').hide();
            },1500);
        }

        function appendQueryResult(wayBillList){
            if(wayBillList instanceof Array){
                _.each(wayBillList,function(waybill){
                    $wayBillList.append(formatWayBillItem(waybill));
                });
            }else{
                $wayBillList.append(formatWayBillItem(wayBillList));
            }
        }
        function showEmptyAlert(){
            $alertEmpty.show();
            setTimeout(function(){
                $alertEmpty.hide();
            },1500);
        }
    }
);
function myformatter(date){
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    var d = date.getDate();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}
function parser(s){
    if (!s) return new Date();
    var ss = (s.split('-'));
    var y = parseInt(ss[0],10);
    var m = parseInt(ss[1],10);
    var d = parseInt(ss[2],10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
        return new Date(y,m-1,d);
    } else {
        return new Date();
    }
}

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
        '</div>'+
        '<br>'+
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