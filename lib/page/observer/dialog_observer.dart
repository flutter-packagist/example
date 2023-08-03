import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:oktoast/oktoast.dart';

class DialogObserver extends NavigatorObserver {
  /// Creates a [DialogObserver].

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is GetDialogRoute) {
      showToast("弹窗展示", position: ToastPosition.top);
      logD('弹窗展示');
      return;
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is GetDialogRoute) {
      showToast("弹窗关闭", position: ToastPosition.top);
      logD('弹窗关闭');
      return;
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      logD('didRemove: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      logD('didReplace: new= ${newRoute?.str}, old= ${oldRoute?.str}');

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) =>
      logD('didStartUserGesture: ${route.str}, '
          'previousRoute= ${previousRoute?.str}');

  @override
  void didStopUserGesture() => logD('didStopUserGesture');
}

extension on Route<dynamic> {
  String get str => 'route(${settings.name}: ${settings.arguments})';
}
