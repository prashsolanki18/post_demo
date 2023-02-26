import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunflower_lab_test/app/app_colors.dart';
import 'package:sunflower_lab_test/app/app_font_weight.dart';
import 'package:sunflower_lab_test/app/app_fonts_size.dart';
import 'package:sunflower_lab_test/app/app_strings.dart';

class PostDetailView extends StatelessWidget {
  final String title;
  final String body;

  const PostDetailView({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).viewPadding.top),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: AppColors.colorWhite),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: AppColors.primaryPalette,
            ),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(AppStrings.postDetails,
                style: GoogleFonts.montserrat(
                    fontSize: fontSize21, fontWeight: AppFontWeight.bold, color: AppColors.colorWhite),
                textAlign: TextAlign.center),
          ),
          const Divider(color: AppColors.colorE5E5E5, height: 1, thickness: 1),
          SizedBox(height: 18.h),
          Text(title,
                  style: GoogleFonts.montserrat(
                      fontSize: fontSize21, fontWeight: AppFontWeight.bold, color: AppColors.color1D1D1F))
              .paddingSymmetric(horizontal: 20.w),
          SizedBox(height: 8.h),
          Text(body,
                  style: GoogleFonts.montserrat(
                      fontSize: fontSize17, fontWeight: AppFontWeight.semiBold, color: AppColors.color1D1D1F))
              .paddingSymmetric(horizontal: 20.w),
          SizedBox(height: 12.h),
          const SafeArea(child: Offstage()),
        ],
      ),
    );
  }
}
