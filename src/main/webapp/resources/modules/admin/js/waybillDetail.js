/**
 * Created by admin on 2016/2/29.
 */
var table,
    dispatchData;
require(['jquery',
        'backbone',
        'mn',
        'underscore',
        'text!modules/index/tpl/timeLine.html',
        'bootstrap',
        'util',
        'easyui',
        'metisMenu',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css',
        'css!modules/admin/css/dispatchList.css',
        'css!modules/admin/css/timeline.css'
    ],
    function ($, Backbone, Marionette, _, tpl){
        $('#side-menu').metisMenu();
        var waybillId=hi.getQueryString('waybillId');
        $._send('admin/ajax/getWayBill/'+waybillId,function(data){
            console.log(data);
            initDataGrid(data);
            if(data.state!=2){
                $('.waybill-arrival-btn').show();
            }else{
                $('.waybill-arrival-alert').text('已于'+data.receivedTime+'抵达目的地');
                $('.waybill-arrival-alert').show();
            }
        });
        $('.waybill-arrival-btn').on('click',function(){
            $._send('admin/ajax/wayBillArrival/'+waybillId,function(data){
                console.log(data);
                location.reload();
            });
        });
        initHi($, Backbone, Marionette, _);
        hi.app.s(tpl);
        var Dispatch = Backbone.Model.extend({
            defaults: {
                id: "",
                originPlace: "",
                destination: "",
                driverId: "",
                vehicleId: "",
                createTime: "",
                arriveTime: "",
                state: ""
            }
        });

        var DispatchView = Marionette.ItemView.extend({
            template: "dispatch-item"
        });

        var DispatchList = Backbone.Collection.extend({
            model: Dispatch,
            initialize: function () {
                var $this = this;
                $._send('admin/ajax/getJourneyRecordByWayBillId/' + waybillId, function (data) {
                    var dispatchData= _.sortBy(data,function(dispatch){
                        return new Date(dispatch.createTime);
                    });
                    _.each(dispatchData,function(dispatch,index){
                        dispatch.index=index;
                    });
                    console.log(dispatchData);
                    $this.add(dispatchData);
                });
            }
        });
        var DispatchListView=Marionette.CollectionView.extend({
            childView: DispatchView,
            initialize: function () {

            }
        });


        var TimeLineLayout = Marionette.LayoutView.extend({
            el: "#time-panel",
            template: 'timeline-list-layout',
            regions: {
                dispatchList: "#dispatch-list"
            },
            initialize: function () {

            },
            onShow: function () {
                this.dispatchList=new DispatchList();
                this.showChildView('dispatchList',new DispatchListView({collection: this.dispatchList}));
            }
        });
        new TimeLineLayout().render().onShow();

    }
);
function initDataGrid(waybillData){
    var waybillSign='运单信息';
    var gridData={};
    gridData.rows=new Array();
    gridData.rows.push({
        name:'单号',
        value:waybillData.id,
        group:waybillSign
    });
    gridData.rows.push({
        name:'货物名称',
        value:waybillData.itemName,
        group:waybillSign
    });
    gridData.rows.push({
        name:'起始地',
        value:waybillData.originPlace,
        group:waybillSign
    });
    gridData.rows.push({
        name:'目的地',
        value:waybillData.destination,
        group:waybillSign
    });
    gridData.rows.push({
        name:'重量',
        value:waybillData.weight+'kg',
        group:waybillSign
    });
    gridData.rows.push({
        name:'创建时间',
        value:waybillData.createTime,
        group:waybillSign
    });
    gridData.rows.push({
        name:'价格',
        value:waybillData.expense+'元',
        group:waybillSign
    });
    gridData.rows.push({
        name:'发件人',
        value:waybillData.sender,
        group:waybillSign
    });
    gridData.rows.push({
        name:'收件人',
        value:waybillData.receiver,
        group:waybillSign
    });
    gridData.rows.push({
        name:'负责人',
        value:waybillData.staffName,
        group:waybillSign
    });

    $('#pg').propertygrid({
        data:gridData,
        showHeader:false
    });
}
