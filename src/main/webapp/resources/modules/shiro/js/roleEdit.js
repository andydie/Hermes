/**
 * Created by zhangxs on 2016/5/11.
 */
require(['jquery',
        'underscore',
        'bootstrap',
        'util',
        'easyui',
        'metisMenu',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css',
        'css!modules/shiro/css/role-list.css'
    ],
    function ($,_) {
        $('#side-menu').metisMenu();
        var roleId=hi.getQueryString('roleId');
        var permissionList;
        $._send('shiro/all-permision', function (data) {
            permissionList=data;
            $._send('shiro/role/'+roleId,function(roleData){
                $('.role-name').text('修改'+roleData.roleDesc+'权限');
                createTree(permissionList,roleData.permissions);
            });
        });

        $('#save-permission').on('click',function(){
            var nodes = $('#tt').tree('getChecked');
            nodes= _.filter(nodes,function(node){
                return node.parentId!='0';
            });
            var s='';
            _.each(nodes,function(node){
                s!=''&&(s+=',');
                s+=node.id;
            });
            $.sendm('shiro/'+roleId+'/update-permission',{permissionStr:s},function(data){
                console.log(data);
                location.href='shiro/role/list';
            });
        });


    }
);
function createTree(permissionList,rolePermissions){
    var data=new Array();
    _.each(permissionList,function(permission){
        permission.text=permission.description;
        delete permission.description;
        if(permission.parentId=='0'){
            permission.children=new Array();
            permission.state='closed';
            data.push(permission);
        }
    });
    _.each(permissionList,function(permission,rolePermission){
       if(permission.parentId!='0'){

           _.each(rolePermissions,function(rolePermission){
               if(rolePermission.id==permission.id){
                   permission.checked=true;
               }
           });

           _.each(data,function(father){
               if(permission.parentId==father.id){
                    father.children.push(permission);
                   if(permission.checked==true){
                       father.state='open';
                   }
               }
           })
       }
    });
    $('#tt').tree({
        checkbox:true,
        data:data
    });
}