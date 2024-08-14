import 'package:flutter/widgets.dart';
import 'package:mvc/base/base_model.dart';

class RepeatModel extends BaseModel {
  int count = 0;

  GlobalKey ancestorKey = GlobalKey();
}