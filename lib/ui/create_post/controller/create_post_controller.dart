import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunflower_lab_test/app/app_strings.dart';
import 'package:sunflower_lab_test/utility/utils.dart';

class CreatePostController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  FocusNode titleFocusNode = FocusNode();
  FocusNode bodyFocusNode = FocusNode();

  RxBool isFocusTitle = false.obs;
  RxBool isFocusBody = false.obs;

  @override
  void onClose() {
    titleController.dispose();
    bodyController.dispose();
    titleFocusNode.dispose();
    bodyFocusNode.dispose();
    super.onClose();
  }

  ///[onCreatePost] is used to call create post
  void onCreatePost() {
    Utils.closeKeyboard();
    Utils.hideMessage();
    if (checkValidation()) {
      Utils.showMessage(AppStrings.success, AppStrings.createPostInfoValidated);
    }
  }

  ///[checkValidation] check necessary validation
  bool checkValidation() {
    if (titleController.text.trim().isEmpty) {
      Utils.showMessage(AppStrings.error, AppStrings.pleaseEnterTitle);
      return false;
    } else if (bodyController.text.trim().isEmpty) {
      Utils.showMessage(AppStrings.error, AppStrings.pleaseEnterBody);
      return false;
    }
    return true;
  }
}
