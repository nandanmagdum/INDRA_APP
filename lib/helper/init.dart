import 'package:get/get.dart';
import 'package:version1/controllers/navigation_bar_controller.dart';

class Init extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => NavigationBarController());
  }
}
