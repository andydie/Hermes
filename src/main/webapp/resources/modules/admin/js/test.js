/**
 * Created by zhangxs on 2016/5/9.
 */
require(['jquery',
        'backbone',
        'mn',
        'underscore',
        'text!modules/admin/tpl/test.html',
        'bootstrap',
        'util',
        'metisMenu',
        'datatables',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css'],
    function($,Backbone,Marionette,_,tpl){
        $('#side-menu').metisMenu();
        initHi($,Backbone,Marionette,_);
        hi.app.s(tpl);
        var ScenesLayout = Marionette.LayoutView.extend({
            el:"#cabeza",
            template:'my-show',
            initialize:function(){
                console.log('1');
            }
        });
        new ScenesLayout().render();
    }
);