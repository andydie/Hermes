/**
 * Created by admin on 2016/2/29.
 */
require(['jquery',
        'underscore',
        'bootstrap',
        'util',
        'metisMenu',
        'datatables',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css',
        'css!modules/admin/css/dispatchList.css'
    ],
    function($,_){
        $('#side-menu').metisMenu();
        var dispatchList;
        $._send('admin/ajax/queryDispatchInfo',function(data){
            dispatchList=data;
            console.log(data);
            _.each(dispatchList,function(dispatch){
                $('#dispatch-list').append(dispatchListFormat(dispatch));
            });
        })
    }
);
function dispatchListFormat(dispatch){
    var icon='fa-check-circle';
    var colorClass='panel-red';
    var stateText='抵达';
    if(dispatch.state=='0'){
        icon='fa-sitemap';
        colorClass='panel-yellow';
        stateText='装车中';
    }else if(dispatch.state=='1'){
        icon='fa-car';
        colorClass='panel-green';
        stateText='在途';
    }
    return '<div class="col-lg-3 col-md-6">'+
    '<div class="panel ' +
    colorClass +
    '">'+
    '<div class="panel-heading">'+
    '<div class="row">'+
    '<div class="col-xs-12 text-right">'+
    '<div class="location">'+
        dispatch.originPlace+'-'+dispatch.destination+
    '</div>'+
    '<div>'+'<i class="fa ' +
    icon +
    ' fa-5x">'+'</i>'+
    stateText+
    '</div>'+
    '</div>'+
    '</div>'+
    '</div>'+
    '<a href="#">'+
    '<div class="panel-footer">'+
    '<span class="pull-left">'+
        'View Details'+
    '</span>'+
    '<span class="pull-right">'+'<i class="fa fa-arrow-circle-right">'+'</i>'+'</span>'+
    '<div class="clearfix">'+'</div>'+
    '</div>'+
    '</a>'+
    '</div>'+
    '</div>';

}