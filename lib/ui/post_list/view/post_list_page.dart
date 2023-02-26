import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunflower_lab_test/app/app_colors.dart';
import 'package:sunflower_lab_test/app/app_font_weight.dart';
import 'package:sunflower_lab_test/app/app_fonts_size.dart';
import 'package:sunflower_lab_test/app/app_images.dart';
import 'package:sunflower_lab_test/app/app_strings.dart';
import 'package:sunflower_lab_test/data/network/client/connectivity_manager.dart';
import 'package:sunflower_lab_test/data/network/models/post_list.dart';
import 'package:sunflower_lab_test/ui/post_list/controller/post_list_controller.dart';
import 'package:sunflower_lab_test/ui/widgets/common_app_input.dart';
import 'package:sunflower_lab_test/ui/widgets/common_ink_well.dart';
import 'package:sunflower_lab_test/ui/widgets/common_no_found.dart';
import 'package:sunflower_lab_test/ui/widgets/common_no_internet.dart';

class PostListPage extends GetView<PostListController> {
  const PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(60), child: getAppBarView()),
      body: Obx(() => ConnectivityManager().isNetConnected.isTrue
          ? Obx(() => controller.isLoading.isTrue ? const Center(child: CircularProgressIndicator()) : getPostView())
          : const CommonNoInternet()),
    );
  }

  ///[getAppBarView] is used to show app bar
  Widget getAppBarView() {
    return Obx(
      () => AppBar(
          backgroundColor: AppColors.colorWhite,
          elevation: 5,
          title: controller.isShowSearchBox.isFalse
              ? Text(AppStrings.postList,
                  style:
                      GoogleFonts.roboto(fontSize: fontSize17, fontWeight: AppFontWeight.bold, color: AppColors.color1D1D1F))
              : CommonAppInput(
                  textEditingController: controller.searchController,
                  isSearchBox: true,
                  hintText: AppStrings.search,
                  prefixIcon: AppImages.icSearchLocation,
                  suffixIcon: AppImages.icClose,
                  onSuffixClick: () => controller.onSuffixClickSearchBox(),
                  onChange: (value) => controller.onChangeSearchBox(value),
                  autoFocus: true,
                  borderRadius: 5,
                ),
          actions: controller.isShowSearchBox.isFalse
              ? [
                  IconButton(
                    onPressed: () => controller.navigateToAddNewPostPage(),
                    icon: const Icon(Icons.add, color: AppColors.color1D1D1F),
                  ),
                  IconButton(
                    onPressed: () => controller.isShowSearchBox.value = true,
                    icon: const Icon(Icons.search, color: AppColors.color1D1D1F),
                  ),
                  Obx(
                    () => Switch(
                      value: controller.isGridOn.value,
                      onChanged: (value) => controller.isGridOn.value = value,
                    ),
                  ),
                ]
              : []),
    );
  }

  ///[getPostView] is used to get list view or grid view of post
  Widget getPostView() {
    return Obx(
      () => controller.isGridOn.isTrue
          ? Obx(
              () => (controller.isSearchTextEmpty() && controller.postList.isEmpty ||
                      (!controller.isSearchTextEmpty() && controller.searchedPostList.isEmpty))
                  ? const CommonNoFound(title: AppStrings.noDataFound, desc: AppStrings.pleaseSearchAnotherText)
                  : GridView.builder(
                      itemCount:
                          controller.isSearchTextEmpty() ? controller.postList.length : controller.searchedPostList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 0, childAspectRatio: 0.55),
                      itemBuilder: (_, index) {
                        return getPostItem(controller.isSearchTextEmpty()
                                ? controller.postList[index]
                                : controller.searchedPostList[index])
                            .paddingOnly(
                                top: index == 0 || index == 1 ? 5.h : 0,
                                bottom: index ==
                                            (controller.isSearchTextEmpty()
                                                    ? controller.postList.length
                                                    : controller.searchedPostList.length) -
                                                1 ||
                                        index ==
                                            (controller.isSearchTextEmpty()
                                                    ? controller.postList.length
                                                    : controller.searchedPostList.length) -
                                                2
                                    ? 5.h
                                    : 0);
                      }).paddingOnly(left: 10.w, right: 10.w),
            )
          : Obx(() => (controller.isSearchTextEmpty() && controller.postList.isEmpty ||
                  (!controller.isSearchTextEmpty() && controller.searchedPostList.isEmpty))
              ? const CommonNoFound(title: AppStrings.noDataFound, desc: AppStrings.pleaseSearchAnotherText)
              : ListView.builder(
                  itemCount:
                      controller.isSearchTextEmpty() ? controller.postList.length : controller.searchedPostList.length,
                  itemBuilder: (_, index) {
                    return getPostItem(
                            controller.isSearchTextEmpty() ? controller.postList[index] : controller.searchedPostList[index])
                        .paddingOnly(
                            left: 10.w,
                            right: 10.w,
                            top: index == 0 ? 5.h : 0,
                            bottom: index ==
                                    (controller.isSearchTextEmpty()
                                            ? controller.postList.length
                                            : controller.searchedPostList.length) -
                                        1
                                ? 5.h
                                : 0);
                  },
                )),
    );
  }

  ///[getPostItem] is used to show post item
  Widget getPostItem(PostList postList) {
    return CommonInkWell(
      onTap: () => controller.openPostDetails(postList.title ?? '', postList.body ?? ''),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            getPostRowItem(postList.title, isName: true),
            getPostRowItem(postList.body).paddingOnly(top: 5),
          ],
        ).paddingAll(10),
      ),
    );
  }

  ///[getPostRowItem] is used to get post row item
  Widget getPostRowItem(String? value, {bool isName = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            value ?? '',
            style: GoogleFonts.roboto(
                fontSize: isName ? fontSize21 : fontSize17,
                fontWeight: isName ? AppFontWeight.bold : AppFontWeight.semiBold,
                color: AppColors.color1D1D1F),
            maxLines: isName ? 5 : 8,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
