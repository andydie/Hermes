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
        var articleData;
        var articleId=hi.getQueryString("id");
        $._send('display/article/ajax/queryArticleById/'+articleId,function(data){
            articleData=data;
            console.log(articleData);
            $('#edit-title').val(articleData.title);
            editor.html(articleData.content);
        });

        KindEditor.ready(function (K) {
                editor = K.create('#edit-area');
            });
        setTimeout(function(){
            editor==null&&(editor = KindEditor.create('#edit-area'))&&editor.html(articleData.content);
        },2000);
        $('#confirm-edit').on('click',function(){
            var content=editor.html();
            var title=$('#edit-title').val();
            $.sendj('display/article/ajax/updateArticle',{id:articleId,title:title,content:content},function(data){
                console.log(data);
                location.href="display/article/list";
            });
        });
    }
);