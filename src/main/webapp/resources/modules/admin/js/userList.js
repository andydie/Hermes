/**
 * Created by zhangxs on 2016/5/9.
 */
require(['jquery',
        'backbone',
        'mn',
        'underscore',
        'text!modules/admin/tpl/userList.html',
        'easyui',
        'bootstrap',
        'util',
        'metisMenu',
        'datatables',
        'css!modules/admin/css/font-awesome.min.css',
        'css!modules/admin/css/sb-admin-2.css',
        'css!modules/admin/css/user-list.css'],
    function ($, Backbone, Marionette, _, tpl) {
        $('#side-menu').metisMenu();
        initHi($, Backbone, Marionette, _);
        hi.app.s(tpl);

        var userList;

        var Scene = Backbone.Model.extend({
            url: hi.ctx + '/scene',
            defaults: {
                username: "",
                password: "",
                roleDesc: "",
                id: "1",
                roleId: "",
                showChangePassword: false
            }
        });

        var RoleList = Backbone.Model.extend({
            defaults: {
                username: "",
                userId: "",
                list: '',
                userRoleId: "",
                showChangeRole: false
            }
        });

        var SceneView = Marionette.ItemView.extend({
            template: "scene-list-sceneView",
            initialize: function () {
                this.listenTo(this.model, "change:roleDesc", this.render);
            },
            events: {
                'click .change-password': 'changePassword',
                'click .change-role': 'changeRole',
                'click .delete-user': 'deleteUser'
            },
            changePassword: function () {
                scene.set(this.model.attributes);
                scene.set({showChangePassword: true});
            },
            changeRole: function () {
                roleList.set({showChangeRole: false});
                roleList.set({
                    userId: this.model.get('id'),
                    username: this.model.get('username'),
                    userRoleId: this.model.get('roleId'),
                    showChangeRole: true
                });
            },
            deleteUser: function () {
                var $this = this;
                $.confirmOn({
                    tipText: "是否删除该用户？",
                    confirmBtn: "删除",
                    cancelBtn: "取消",
                    confirmId: 'deleteUser',
                    afterConfirm: function () {
                        $._send('shiro/delete-user/' + $this.model.get('id'), function (data) {
                            console.log(data);
                            $this.model.collection.remove($this.model);
                            $.confirmOff('deleteUser');
                        })
                    }
                });
            }
        });

        var SceneList = Backbone.Collection.extend({
            model: Scene,
            initialize: function () {
                var $this = this;
                $._send('shiro/all-user', function (data) {
                    $this.add(data);
                    userList = $this.models;
                });
            }
        });

        var ScenesView = Marionette.CollectionView.extend({
            childView: SceneView,
            initialize: function () {

            }
        });

        var scene = new Scene();
        var roleList = new RoleList();

        var UserPasswordModal = Marionette.ItemView.extend({
            model: Scene,
            template: 'change-password',
            events: {
                'click .close': 'closeModal',
                'click .modal-confirm': 'changePassword'
            },
            initialize: function () {
                this.listenTo(this.model, "change:showChangePassword", this.show);
            },
            show: function () {
                this.render();
                this.model.get("showChangePassword") && this.$el.find('.modal').modal();
            },
            closeModal: function () {
                this.$el.find('.modal').modal('hide');
            },
            changePassword: function () {
                var $this = this;
                var newPassword = this.$el.find('.new-password').val();
                $.sendm('shiro/changePassword/' + $this.model.get('id'), {newPassword: newPassword}, function (data) {
                    $this.closeModal();
                });
            }
        });
        var RoleListModal = Marionette.ItemView.extend({
            model: RoleList,
            template: 'change-role',
            events: {
                'click .close': 'closeModal',
                'click .modal-confirm': 'changeRole'
            },
            initialize: function () {
                this.listenTo(this.model, "change:list", this.render);
                this.listenTo(this.model, "change:showChangeRole", this.show);
            },
            closeModal: function () {
                this.$el.find('.modal').modal('hide');
            },
            changeRole: function () {
                var $this = this;
                var userId = $this.model.get('userId');
                var roleId = $this.$el.find('.role-option').val();
                var roleDesc = _.find(this.model.get('list'), function (role) {
                    return role.roleId == roleId;
                }).roleDesc;
                _.find(userList, function (user) {
                    return user.id == userId;
                }).set({roleDesc: roleDesc, roleId: roleId});
                $.sendm('shiro/changeRole/' + userId, {roleId: roleId}, function (data) {
                    console.log(data);
                });
                this.closeModal();
            },
            show: function () {
                this.render();
                this.model.get("showChangeRole") && this.$el.find('.modal').modal();
            }
        });

        var ScenesLayout = Marionette.LayoutView.extend({
            el: "#cabeza",
            template: 'user-list',
            regions: {
                sceneList: "#scene-list",
                changePasswordModal: "#change-password-modal",
                changeRoleModal: "#change-role-modal"
            },
            initialize: function () {

            },
            onShow: function () {
                this.sceneList = new SceneList();
                $._send('shiro/all-role', function (data) {
                    roleList.set('list', data);
                });
                this.showChildView('sceneList', new ScenesView({collection: this.sceneList}));
                var userPasswordModal = new UserPasswordModal({model: scene});
                this.showChildView('changePasswordModal', userPasswordModal);
                var roleListModal = new RoleListModal({model: roleList});
                this.showChildView('changeRoleModal', roleListModal);
            }
        });
        new ScenesLayout().render().onShow();

    }
);