var require= {
    baseUrl: 'resources',
    paths:{
        'jquery': "common/js/jquery-1.11.3.min",
        'underscore':'common/js/underscore',
        'bootstrap': 'common/js/bootstrap.min',
        'bluebootstrap':'common/js/bootstrap.min',
        'util':'common/js/jquery.util',
        'metisMenu':'common/js/metisMenu.min',
        'datatables':'common/js/jquery.dataTables.min'
    },
    shim:{
        bootstrap:{
            deps:[
                'jquery',
                'css!common/css/bootstrap.min.css'
            ]
        },
        underscore:{
            deps:[
                'jquery'
            ]
        },
        bluebootstrap:{
            deps:[
                'jquery',
                'css!common/css/min.bootstrap.css'
            ]
        },
        util:{
            deps:[
                'jquery',
                'css!common/css/jquery.util.css'
            ]
        },
        metisMenu:{
            deps:[
                'jquery',
                'css!common/css/metisMenu.min.css'
            ]
        },
        datatables:{
            deps:[
                'jquery',
                'css!common/css/jquery.dataTables.css'
            ]
        }
    },
    map: {
        '*': {
            'css': 'common/js/css'
        }
    }
};
/**
 *删除数组指定下标或指定对象
 */
Array.prototype.remove=function(obj){
    for(var i =0;i <this.length;i++){
        var temp = this[i];
        if(!isNaN(obj)){
            temp=i;
        }
        if(temp == obj){
            for(var j = i;j <this.length;j++){
                this[j]=this[j+1];
            }
            this.length = this.length-1;
        }
    }
}