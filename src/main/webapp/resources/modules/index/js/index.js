/**
 * Created by admin on 2016/2/20.
 */
require(['jquery',
        'underscore',
        'bluebootstrap',
        'util',
        'css!common/css/style.css'],
    function ($,_) {
        $('.dropdown-toggle').dropdown();
        $('.collapse').collapse();
        $('#query').on('click', function () {
            var id = $('#waybillId').val();
            location.href = 'query?wayBillId=' + id;
        });
        var articleData;
        $._send('display/article/ajax/queryArticle',function(data){
            articleData=data;
            _.each(articleData,function(article){
                $('#article-list').append(formatArticle(article));
            });
        });
    });

function formatArticle(article){
    return '<h4>'+

    article.title+

    '</h4>'+
    article.content+
    '<hr>';
}
