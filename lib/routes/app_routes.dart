part of 'app_pages.dart';

abstract class Routes {
  static const home = _Paths.home;
  static const tab = _Paths.tab1;
  static const tab1 = _Paths.tab1;
  static const tab2 = _Paths.tab2;
}

abstract class _Paths {
  static const home = '/home';
  static const tab1 = '/tab1';
  static const tab2 = '/tab2';
  static const notFound = '/404';
}
