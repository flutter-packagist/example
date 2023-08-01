import 'package:example/routes/app_pages.dart';
import 'package:mvc/base/base_model.dart';

class TransitionModel extends BaseModel {
  Map<String, String> routes = {
    "none": Routes.transitionNone,
    "fade": Routes.transitionFade,
    "scale": Routes.transitionScale,
    "rotate": Routes.transitionRotate,
    "size": Routes.transitionSize,
    "right": Routes.transitionRight,
    "left": Routes.transitionLeft,
    "top": Routes.transitionTop,
    "bottom": Routes.transitionBottom,
    "rightFade": Routes.transitionRightFade,
    "leftFade": Routes.transitionLeftFade,
  };
}
