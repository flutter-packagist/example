import 'package:example/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_model.dart';

class MainModel extends BaseModel {
  Map<String, String> routes = {
    "MVC示例": Routes.mvc,
    "路由 Navigator 2.0（StatefulShellRoute）: TabBar和TabBarView同步切换，支持滑动页面切换浏览器地址":
        GetPlatform.isWeb ? Routes.tab1 : Routes.tab,
    "路由 Navigator 2.0（StatefulShellRoute）: BottomNavigationBar和PageView同步切换，支持滑动页面切换浏览器地址":
        GetPlatform.isWeb ? Routes.page1 : Routes.page,
    "路由 Navigator 2.0（StatefulShellRoute.indexedStack）: BottomNavigationBar驱动IndexedStack内部页面切换":
        GetPlatform.isWeb ? Routes.stack1 : Routes.stack,
    "路由 Navigator 2.0（ShellRoute）: 匹配路由路径切换":
        GetPlatform.isWeb ? Routes.shell1 : Routes.shell,
    "路由参数传递": Routes.arguments,
    "页面调整动画": Routes.transition,
    "页面路由监听": Routes.dialog,
    "路由拦截和重定向": Routes.redirect,
    "404页面": Routes.notFound,
    "网络请求": Routes.network,
    "权限请求": Routes.permission,
    "下拉刷新和上拉加载更多": Routes.refresh,
    "数据库操作": Routes.database,
  };
}
