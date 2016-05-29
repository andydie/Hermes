/**
 * Created by admin on 2016/2/20.
 */
require(['jquery',
        'underscore',
        'bootstrap',
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

        $('.regist-btn').on('click',function(){
            $('.regist-user').modal();
        });

        $('#user-name').on('blur',function(){
            var userName=$('#user-name').val();
            if(userName.trim()!=''){
                $.sendm('shiro/checkUserName',{username:userName},function(data){
                    if(data.code=='0') {
                        $('.user-name-alert').show();
                        $('#add-user').hide();
                    }else{
                        $('.user-name-alert').hide();
                        $('#add-user').show();
                    }
                });
            }
        });
        $('#add-user').on('click',function(){
            var userName=$('#user-name').val();
            var password=$('#password').val();
            var roleId='0';
            var staffName=$('#staff-name').val();
            var staffTel=$('#staff-tel').val();
            $.sendj('shiro/add-user',{username:userName,password:password,roleId:roleId,staffName:staffName,type:'2',staffTel:staffTel},function(data){
                console.log(data);
                $('.alert').addClass('hide');
                if(data.code=='1'){
                    $('.alert.alert-success').removeClass('hide');
                    $('.regist-user').modal('hide');
                }
                if(data.code=='0')
                    $('.alert.alert-danger').removeClass('hide');
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
