import 'package:get/get.dart';
import 'package:sunflower_lab_test/ui/post_list/controller/post_list_controller.dart';

class PostListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostListController());
  }
}
