/**
 * Created by admin on 2016/2/20.
 */
require(['jquery','bluebootstrap','util','css!common/css/style.css'],function($){
    $('.dropdown-toggle').dropdown();
    $('.collapse').collapse();
    $('#query').on('click',function(){
        var id=$('#waybillId').val();
        location.href='query?wayBillId='+id;
    });
});
