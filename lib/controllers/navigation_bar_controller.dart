import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  RxInt _currentIndex = 0.obs;
  RxInt get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex.value = index;
  }
}
