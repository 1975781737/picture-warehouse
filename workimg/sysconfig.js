window.LOCAL_CONFIG = {
  //API_HOME: 'http://192.168.33.35:35002/bemp/',
   API_HOME: 'http://${primary_ip_address}:${app_server_port}/ebank', //本地

  #if($app_server_address == 'window.location.hostname')
    API_HOME: window.location.protocol+'//' + window.location.hostname + ':${app_server_port}/ebank',
  #elseif($app_server_address == 'primary_ip_address')
	API_HOME: window.location.protocol+'//${primary_ip_address}:${app_server_port}/ebank',
  #else
    API_HOME: window.location.protocol+'//${app_server_address}:${app_server_port}/ebank',
  #end

  // API_HOME: 'http://192.168.33.35:35059/ebank/', //tomcat
  PRINT_CLOUD:'http://localhost',
  WS_REQ:'ws://localhost:8080/bemp/websocket/',
  //WS_REQ:'ws://192.168.33.35:35002/bemp/websocket/', //测试
  MENUS_ROOT_NAME: '0',
  LOCK_TIME: 100,
  //BANK_NAME:'jjbank',
  THEME: 'theme-black',
  MAX_EXCEL_EXPORT_ROWS:2000,  //excel最大导出条数
  TABS_VIEW_LIMIT: 8, // tab页最大打开数量
  isFrame: false, // 当前运行是否在Frame中运行
  isUcf: false, // 当前运行是否在UCF中运行
  isRefresh: true, // 缓存页面时是否需要在关闭选项卡处刷新页面
  isAllKeepAlive: true,// 是否页面都进行缓存（服务端无返回isKeppAlive字段时）
  isUnderscore:true,//入参是否把驼峰规则转换下划线规则（容微服务模式需要设置为true）
  isO45Page:true,//是否是O45页面
  isToken: true, // 为false时证明不需要登录
  passwordChangeRule:{//修改当前密码规则
    minLength:8,//密码最少位数
    kindLength:3//修改密码至少包含几种字符组成，包含a-z、A-Z、0-9、特殊字符
  },
  isCustomLogin: true,
  isNeddLogout: true,
  menus:[{
    "title": "系统",
    "id": "1",
    "parentId": "0",
    "kindCode": null,
    "path": null,
    "type": null,
    "expand": null,
    "children": [{
      "title": "权限管理",
      "id": "697684",
      "parentId": "1",
      "kindCode": null,
      "path": "",
      "type": null,
      "expand": null,
      "children": [{
        "title": "维护菜单",
        "id": "697685",
        "parentId": "697684",
        "kindCode": null,
        "path": "/pb/menu/menuMain",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "法人角色管理",
        "id": "697686",
        "parentId": "697684",
        "kindCode": null,
        "path": "/pb/role/legalPersonRole",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "机构角色管理",
        "id": "697688",
        "parentId": "697684",
        "kindCode": null,
        "path": "/pb/role/role",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "机构临时角色管理",
        "id": "697789",
        "parentId": "697684",
        "kindCode": null,
        "path": "/pb/role/branchTemporaryRole",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "法人管理",
        "id": "697687",
        "parentId": "697684",
        "kindCode": null,
        "path": "/pb/legalperson/legalPersonMain",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "法人管理员管理",
        "id": "697688",
        "parentId": "697684",
        "kindCode": null,
        "path": "/pb/legalpersonmanager/legalPersonManagerMain",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "session管理",
        "id": "704514",
        "parentId": "697684",
        "kindCode": null,
        "path": "/authorize/session/indexSession",
        "type": null,
        "expand": null,
        "children": null
      }]
    }, {
      "title": "系统管理",
      "id": "697690",
      "parentId": "1",
      "kindCode": null,
      "path": "a",
      "type": null,
      "expand": null,
      "children": [{
        "title": "系统参数管理",
        "id": "1509788121010008",
        "parentId": "697690",
        "kindCode": null,
        "path": "/authorize/parameter/systemParam/indexSystemParameter",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "字典管理",
        "id": "697692",
        "parentId": "697690",
        "kindCode": null,
        "path": "/authorize/dictionary/indexDictionary.page",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "营业日期管理",
        "id": "697703",
        "parentId": "697690",
        "kindCode": null,
        "path": "/system/busiDate/editBusidDate.page",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "业务参数管理",
        "id": "1513825421010002",
        "parentId": "697690",
        "kindCode": null,
        "path": "/authorize/parameter/businessParam/index",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "缓存管理",
        "id": "15145643636513334",
        "parentId": "697690",
        "kindCode": null,
        "path": "/authorize/parameter/cacheParam/indexCacheParameter",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "通讯日志查询",
        "id": "1517212689010008",
        "parentId": "697690",
        "kindCode": null,
        "path": "/busMsgQuery/indexBusMsgQuery.page",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "ESB签到功能管理",
        "id": "2570433501000028",
        "parentId": "697690",
        "kindCode": null,
        "path": "/authorize/user/indexUserSign.page",
        "type": null,
        "expand": null,
        "children": null
      }]
    }, {
      "title": "产品中心",
      "id": "697702",
      "parentId": "1",
      "kindCode": null,
      "path": "",
      "type": null,
      "expand": null,
      "children": [{
        "title": "产品管理",
        "id": "1510982801010005",
        "parentId": "697702",
        "kindCode": null,
        "path": "/bm/product/productMain",
        "type": null,
        "expand": null,
        "children": null
      }]
    }, {
      "title": "票交管理",
      "id": "706216",
      "parentId": "1",
      "kindCode": null,
      "path": "a",
      "type": null,
      "expand": null,
      "children": [{
        "title": "票交所系统信息",
        "id": "706217",
        "parentId": "706216",
        "kindCode": null,
        "path": "a",
        "type": null,
        "expand": null,
        "children": [{
          "title": "节假日管理",
          "id": "697713",
          "parentId": "706217",
          "kindCode": null,
          "path": "/pub/businessHoliday/holidayManage.page",
          "type": null,
          "expand": null,
          "children": null
        }, {
          "title": "基础数据查询",
          "id": "706219",
          "parentId": "706217",
          "kindCode": null,
          "path": "/pub/baseData/indexBaseData.page",
          "type": null,
          "expand": null,
          "children": null
        }, {
          "title": "票交所基础数据导入",
          "id": "1509787237010004",
          "parentId": "706217",
          "kindCode": null,
          "path": "/pub/cppmdata/indexCppDataImport.page",
          "type": null,
          "expand": null,
          "children": null
        }]
      }, {
        "title": "会员机构",
        "id": "706224",
        "parentId": "706216",
        "kindCode": null,
        "path": "a",
        "type": null,
        "expand": null,
        "children": [{
          "title": "行名行号查询",
          "id": "706229",
          "parentId": "706224",
          "kindCode": null,
          "path": "/pub/hvpsBank/indexHvpsBank.page",
          "type": null,
          "expand": null,
          "children": null
        }, {
          "title": "权限数据查询",
          "id": "2550972101000004",
          "parentId": "706224",
          "kindCode": null,
          "path": "/pub/authorityData/indexAuthorityData",
          "type": null,
          "expand": null,
          "children": null
        }]
      }]
    }, {
      "title": "扩展管理",
      "id": "2557189601000002",
      "parentId": "1",
      "kindCode": null,
      "path": "a",
      "type": null,
      "expand": null,
      "children": [{
        "title": "通用字段查询",
        "id": "2557189801000004",
        "parentId": "2557189601000002",
        "kindCode": null,
        "path": "/common/comfield/indexField.page",
        "type": null,
        "expand": null,
        "children": null
      }, {
        "title": "通用字段配置管理",
        "id": "2557190101000010",
        "parentId": "2557189601000002",
        "kindCode": null,
        "path": "/common/comfield/indexFieldConf.page",
        "type": null,
        "expand": null,
        "children": null
      }]
    }]
  }] ,
  testmenus: [{
    /*
     * url: // 页面路由路径
     * id: // 对应页面name属性【页面缓存+页面刷新时必须】
    */
    "url": null,
    "id": "bizTest",
    "title": "测试菜单",
    "icon": "home",
    "parent_id": "BIZFRAME",
    "children": [
      { // 无token时的默认菜单
        "url": "http://192.168.94.82:8091/#/hui/mainIndex",
        "id": "iframetest",
        "title": "测试iframe",
        "icon": "home",
        "isKeepAlive": true,
        "comName": "iframetest"
      },
    ],
  }]
};
