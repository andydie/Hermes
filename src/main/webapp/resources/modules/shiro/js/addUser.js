/**
 * Created by zhangxs on 2016/5/11.
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
        var roleList;
        var $roleSelect=$('#user-role');
        $._send('shiro/all-role', function (data) {
            roleList=data;
            console.log(roleList);
            for(var i=0;i<roleList.length;i++){
                $roleSelect.append($('<option>').attr('value',roleList[i].roleId).text(roleList[i].roleDesc));
            }
        });

        $('#add-user').on('click',function(){
            var userName=$('#user-name').val();
            var password=$('#password').val();
            var roleId=$roleSelect.val();
            var staffName=$('#staff-name').val();
            $.sendj('shiro/add-user',{username:userName,password:password,roleId:roleId,staffName:staffName},function(data){
                console.log(data);
                $('.alert').addClass('hide');
                if(data.code=='1'){
                    $('.alert.alert-success').removeClass('hide');
                    location.href="admin/security/user/list";
                }
                if(data.code=='0')
                    $('.alert.alert-danger').removeClass('hide');
            });
        });
    }
);