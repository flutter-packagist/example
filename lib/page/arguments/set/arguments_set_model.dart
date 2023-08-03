import 'package:example/routes/app_pages.dart';
import 'package:mvc/base/base_model.dart';

class ArgumentsSetModel extends BaseModel {
  String description = '''
相关说明：
1. push、go、to 三种跳转方式，都支持设置 params、queryParams 和 pathParams，queryParams 会拼接在 url 后面，pathParams 会替换 url 中的参数，params只是单纯的参数传递；
2. push跳转方式，将当前页面压入栈中，不会web上不会改变浏览器地址栏的地址；
3. go跳转方式，将当前页面压入栈中，会web上不会改变浏览器地址栏的地址；
4. to跳转方式，为push和go两种方式的封装，web上为go，其他平台为push。
  ''';

  Map<String, String> routes = {
    '路由路径跳转：push 设置 params': Routes.argumentsParams,
    '路由路径跳转：push 设置 queryParams': Routes.argumentsQuery,
    '路由路径跳转：push 设置 pathParams': Routes.argumentsPath,
    '路由路径跳转：go 设置 params': Routes.argumentsParams,
    '路由路径跳转：go 设置 queryParams': Routes.argumentsQuery,
    '路由路径跳转：go 设置 pathParams': Routes.argumentsPath,
    '路由路径跳转：to 设置 params': Routes.argumentsParams,
    '路由路径跳转：to 设置 queryParams': Routes.argumentsQuery,
    '路由路径跳转：to 设置 pathParams': Routes.argumentsPath,
    '路由名称跳转：push name 设置 params': 'namePushParams',
    '路由名称跳转：push name 设置 queryParams': 'namePushQuery',
    '路由名称跳转：push name 设置 pathParams': 'namePushPath',
    '路由名称跳转：go name 设置 params': 'nameGoParams',
    '路由名称跳转：go name 设置 queryParams': 'nameGoQuery',
    '路由名称跳转：go name 设置 pathParams': 'nameGoPath',
    '路由名称跳转：to name 设置 params': 'nameGoParams',
    '路由名称跳转：to name 设置 queryParams': 'nameGoQuery',
    '路由名称跳转：to name 设置 pathParams': 'nameGoPath',
  };

  final params = {'title': '标题', 'url': '链接'};
}
