part of 'app_pages.dart';

abstract class Routes {
  static const home = Paths.home;
  static const tab = Paths.tab;
  static const tab1 = Paths.tab1;
  static const tab2 = Paths.tab2;
  static const page = Paths.page;
  static const page1 = Paths.page1;
  static const page2 = Paths.page2;
  static const stack = Paths.stack;
  static const stack1 = Paths.stack1;
  static const stack2 = Paths.stack2;
  static const shell = Paths.shell;
  static const shell1 = Paths.shell1;
  static const shell2 = Paths.shell2;
  static const transition = Paths.transition;
  static const transitionNone = "${Paths.transition}/${Paths.none}";
  static const transitionFade = "${Paths.transition}/${Paths.fade}";
  static const transitionScale = "${Paths.transition}/${Paths.scale}";
  static const transitionRotate = "${Paths.transition}/${Paths.rotate}";
  static const transitionSize = "${Paths.transition}/${Paths.size}";
  static const transitionRight = "${Paths.transition}/${Paths.right}";
  static const transitionLeft = "${Paths.transition}/${Paths.left}";
  static const transitionTop = "${Paths.transition}/${Paths.top}";
  static const transitionBottom = "${Paths.transition}/${Paths.bottom}";
  static const transitionRightFade = "${Paths.transition}/${Paths.rightFade}";
  static const transitionLeftFade = "${Paths.transition}/${Paths.leftFade}";
  static const arguments = Paths.arguments;
  static const argumentsParams = "${Paths.arguments}/${Paths.argumentsParams}";
  static const argumentsPath = "${Paths.arguments}/${Paths.argumentsPath}";
  static const argumentsQuery = "${Paths.arguments}/${Paths.argumentsQuery}";
}

abstract class Paths {
  static const home = '/home';
  static const tab = '/tab';
  static const tab1 = '/tab1';
  static const tab2 = '/tab2';
  static const page = '/page';
  static const page1 = '/page1';
  static const page2 = '/page2';
  static const stack = '/stack';
  static const stack1 = '/stack1';
  static const stack2 = '/stack2';
  static const shell = '/shell';
  static const shell1 = '/shell1';
  static const shell2 = '/shell2';
  static const transition = '/transition';
  static const none = 'none';
  static const fade = 'fade';
  static const scale = 'scale';
  static const rotate = 'rotate';
  static const size = 'size';
  static const right = 'right';
  static const left = 'left';
  static const top = 'top';
  static const bottom = 'bottom';
  static const rightFade = 'rightFade';
  static const leftFade = 'leftFade';
  static const arguments = '/arguments';
  static const argumentsParams = 'params';
  static const argumentsPath = 'path/:title/:url';
  static const argumentsQuery = 'query';
  static const notFound = '/404';
}
