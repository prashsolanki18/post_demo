import 'package:get/get.dart';
import 'package:sunflower_lab_test/ui/create_post/controller/create_post_controller.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePostController());
  }
}
