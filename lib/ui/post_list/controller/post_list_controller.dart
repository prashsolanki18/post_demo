import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunflower_lab_test/app/app_routes.dart';
import 'package:sunflower_lab_test/app/app_strings.dart';
import 'package:sunflower_lab_test/data/network/client/connectivity_manager.dart';
import 'package:sunflower_lab_test/data/network/models/post_list.dart';
import 'package:sunflower_lab_test/data/network/repository/post_repository.dart';
import 'package:sunflower_lab_test/ui/post_list/view/post_detail_view.dart';
import 'package:sunflower_lab_test/utility/utils.dart';

class PostListController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PostList> postList = <PostList>[].obs;
  RxList<PostList> searchedPostList = <PostList>[].obs;
  RxBool isShowSearchBox = false.obs;
  TextEditingController searchController = TextEditingController();
  RxString searchText = ''.obs;
  RxBool isGridOn = false.obs;

  @override
  void onInit() {
    super.onInit();
    ConnectivityManager(callback: (bool isNetConnected) {
      if (isNetConnected) {
        getPostList();
      }
    });
    if (ConnectivityManager().isNetConnected.isTrue) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) => getPostList());
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  ///[getPostList] is used to call api of get post list
  void getPostList() {
    isLoading.value = true;
    PostRepository().getPostList().then((value) {
      isLoading.value = false;
      value.fold((l) {
        Utils.showMessage(AppStrings.error, l);
      }, (r) {
        postList.assignAll(r);
      });
    });
  }

  ///[navigateToAddNewPostPage] is used to navigate to add new post page
  void navigateToAddNewPostPage() {
    if (isLoading.isFalse) Get.toNamed(AppRoutes.createPostPage);
  }

  ///[onSuffixClickSearchBox] is used to call when close the search box
  void onSuffixClickSearchBox() {
    isShowSearchBox.value = false;
    searchController.clear();
    searchText.value = '';
    Utils.closeKeyboard();
  }

  ///[onChangeSearchBox] is used to call when search box text changed
  void onChangeSearchBox(String value) {
    searchedPostList.value =
        postList.where((element) => element.title.toString().toLowerCase().contains(value.toLowerCase())).toList();
    searchText.value = value;
  }

  ///[isSearchTextEmpty] is used to check search text empty or not
  bool isSearchTextEmpty() {
    return searchText.value.trim().isEmpty;
  }

  ///[openPostDetails] is used to open post details bottom sheet
  void openPostDetails(String title, String body) {
    Utils.closeKeyboard();
    Get.bottomSheet(PostDetailView(title: title, body: body), isDismissible: true);
  }
}
