import 'package:packagist_mvc/mvc.dart';

import 'mvc_tab2_model.dart';

const String mvcTab2Btn1 = 'mvcTab2Btn1';
const String mvcTab2Btn2 = 'mvcTab2Btn2';

class MvcTab2Controller extends BaseController<MvcTab2Model> {
  @override
  MvcTab2Model model = MvcTab2Model();

}

extension Action on MvcTab2Controller {
  void onBtn1Tap() {
    model.count++;
    update([mvcTab2Btn1]);
  }

  void onBtn2Tap() {
    model.count++;
    update();
  }
}

extension Network on MvcTab2Controller {}
