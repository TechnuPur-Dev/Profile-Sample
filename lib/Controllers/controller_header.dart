import 'package:get/get.dart';

class ControllerHeader extends GetxController {
  var flagMenu = false.obs;
  setMenu(bool value) => flagMenu.value = value;
}
