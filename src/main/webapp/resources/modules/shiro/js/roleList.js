/**
 * Created by zhangxs on 2016/5/11.
 */
require(['jquery',
        'underscore',
        'bootstrap',
        'util',
        'metisMenu',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css',
        'css!modules/shiro/css/role-list.css'
    ],
    function ($, _) {
        $('#side-menu').metisMenu();
        hi.initMenu($);
        var roleList;
        var $roleSelect = $('#user-role');
        $._send('shiro/all-role', function (data) {
            roleList = data;
            console.log(roleList);
            for (var i = 0; i < roleList.length; i++) {
                $('#role-list').append(roleListFormat(roleList[i]));
            }
        });

        $('.new-role-btn').on('click', function () {
            $('.add-role-modal').modal();
        });
        $('.add-role-modal .modal-confirm').on('click', function () {
            var roleDesc = $('#role-desc').val();
            var roleName=$('#role-name').val();
            $.sendj('shiro/add-role',{roleName:roleName,roleDesc:roleDesc},function(data){
                console.log(data);
                $('add-role-modal').modal('hide');
                location.href='shiro/role/list';
            });
        });

        $('#role-list').on('click','.role-delete',function(){
            var $this=this;
            $.confirmOn({
                tipText: "是否删除该角色？",
                confirmBtn: "删除",
                cancelBtn: "取消",
                confirmId: 'deleteRole',
                afterConfirm: function () {
                    var roleId=$($this).attr('role-id');
                    $._send('shiro/delete-role/'+roleId,function(data){
                        console.log(data);
                        $.confirmOff('deleteRole');
                        location.href='shiro/role/list';
                    });
                }
            });



        });

    }
);
function roleListFormat(role) {
    return '<div class="col-xs-3">' +
        '<div class="thumbnail">' +
        '<div class="caption">' +
        '<h3>' +
        role.roleDesc +
        '</h3>' +
        '<p class="role-icon">' +
        '<span class="glyphicon glyphicon-fire"></span>' +
        '</p>' +
        '<span class="role-delete" role-id="' +
        role.roleId+
        '">' +
        '<i class="fa fa-undo"></i> ' +
        '<span>删除</span>' +
        '</span>' +
        '<span class="role-edit">' +
        '<a href="' +
        'shiro/role/edit?roleId=' + role.roleId +
        '">' +
        '<i class="fa fa-edit"></i> ' +
        '<span>编辑</span>' +
        '</a>' +
        '</span>' +
        '<br>' +
        '</div>' +
        '</div>' +
        '</div>';
}