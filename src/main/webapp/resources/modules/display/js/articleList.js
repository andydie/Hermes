/**
 * Created by admin on 2016/2/21.
 */
require(['jquery',
        'underscore',
        'bootstrap',
        'util',
        'metisMenu',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css'],
    function ($,_) {
        $('#side-menu').metisMenu();
        hi.initMenu($);
        var articleList;
        $._send('display/article/ajax/queryArticle',function(data){
            articleList=data;
            _.each(articleList,function(article){
                $('#article-list').append(formatArticleLi(article));
            });
        });
        $('#article-list').on('click','.article-edit',function(){
           var articleId=$(this).parents('.article-li').attr('value');
            location.href="display/article/edit?id="+articleId;
        });
        $('#article-list').on('click','.article-delete',function(){
            var articleId=$(this).parents('.article-li').attr('value');
            console.log(articleId);
            $.confirmOn({
                tipText: "是否删除该公告？",
                confirmBtn: "删除",
                cancelBtn: "取消",
                confirmId: 'deleteArticle',
                afterConfirm: function () {
                    $._send('display/article/ajax/deleteArticleById/' + articleId, function (data) {
                        console.log(data);
                        $.confirmOff('deleteArticle');
                        location.href='display/article/list';
                    });
                }
            });
        });
    }
);

function formatArticleLi(article){
    return '<li class="list-group-item article-li" value="' +
        article.id +
        '">'+
   article.title+
    '<span class="pull-right">'+
    '<span class="label label-warning article-edit">修改</span>'+
    '<span class="label label-danger article-delete">删除</span>'+
    '</span>'+
    '</li>';
}