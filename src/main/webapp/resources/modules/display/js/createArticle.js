/**
 * Created by admin on 2016/2/21.
 */
require(['jquery',
        'bootstrap',
        'util',
        'metisMenu',
        'zh_CN',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css'],
    function ($) {
        $('#side-menu').metisMenu();
        var editor;
        KindEditor.ready(function (K) {
                editor = K.create('#create-area');
            });
        setTimeout(function(){
            editor==null&&(editor = KindEditor.create('#create-area'));
        },2000);
        $('#confirm-create').on('click',function(){
            var content=editor.html();
            var title=$('#create-title').val();
            $.sendj('display/article/ajax/saveArticle',{
                title:title,
                content:content
            },function(data){
                console.log(data);
                location.href="display/article/list";
            })
        });
    }
);