import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sunflower_lab_test/app/app_class.dart';
import 'package:sunflower_lab_test/app/app_strings.dart';
import 'package:sunflower_lab_test/ui/create_post/controller/create_post_controller.dart';
import 'package:sunflower_lab_test/ui/widgets/common_app_bar.dart';
import 'package:sunflower_lab_test/ui/widgets/common_app_button.dart';
import 'package:sunflower_lab_test/ui/widgets/common_app_input_floating.dart';
import 'package:sunflower_lab_test/utility/utils.dart';

class CreatePostPage extends GetView<CreatePostController> {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppClass().isShowLoading.isTrue ? null : Get.back();
        return false;
      },
      child: GestureDetector(
        onTap: () => Utils.closeKeyboard(),
        child: Scaffold(
          appBar: const CommonAppBar(label: AppStrings.createPost),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Focus(
                  onFocusChange: (value) {
                    controller.isFocusTitle.value = value;
                    if (value) Utils.hideMessage();
                  },
                  child: Obx(
                    () => CommonAppInputFloating(
                      textEditingController: controller.titleController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      maxLength: 100,
                      isFocused: controller.isFocusTitle.isTrue,
                      hintText: AppStrings.title,
                      currentFocusNode: controller.titleFocusNode,
                      nextFocusNode: controller.bodyFocusNode,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Focus(
                  onFocusChange: (value) {
                    controller.isFocusBody.value = value;
                    if (value) Utils.hideMessage();
                  },
                  child: Obx(
                    () => CommonAppInputFloating(
                      textEditingController: controller.bodyController,
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      maxLength: 500,
                      isFocused: controller.isFocusBody.isTrue,
                      hintText: AppStrings.body,
                      currentFocusNode: controller.bodyFocusNode,
                      minLine: 7,
                      maxLine: 12,
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Obx(() => CommonAppButton(
                    onClick: () => controller.onCreatePost(),
                    text: AppStrings.createPost,
                    isLoading: AppClass().isShowLoading.isTrue,
                    radius: 5,
                    height: 44.h)),
              ],
            ).paddingSymmetric(horizontal: 25.w),
          ),
        ),
      ),
    );
  }
}
