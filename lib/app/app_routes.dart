import 'package:get/get.dart';
import 'package:sunflower_lab_test/ui/create_post/binding/create_post_binding.dart';
import 'package:sunflower_lab_test/ui/create_post/view/create_post_page.dart';
import 'package:sunflower_lab_test/ui/post_list/binding/post_list_binding.dart';
import 'package:sunflower_lab_test/ui/post_list/view/post_list_page.dart';

/// All routes for app pages are defined here
class AppRoutes {
  static const postListPage = '/post_list_page';
  static const createPostPage = '/create_post_page';

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.postListPage,
      page: () => const PostListPage(),
      binding: PostListBinding(),
    ),
    GetPage(
      name: AppRoutes.createPostPage,
      page: () => const CreatePostPage(),
      binding: CreatePostBinding(),
    ),
  ];
}
