import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunflower_lab_test/app/app_colors.dart';
import 'package:sunflower_lab_test/app/app_font_weight.dart';
import 'package:sunflower_lab_test/app/app_fonts_size.dart';
import 'package:sunflower_lab_test/app/app_images.dart';
import 'package:sunflower_lab_test/app/app_strings.dart';
import 'package:sunflower_lab_test/ui/widgets/common_app_image.dart';

class CommonNoInternet extends StatelessWidget {
  const CommonNoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CommonAppImage(imagePath: AppImages.icNoInternet, height: 60, width: 60),
            SizedBox(height: 15.h),
            Text(AppStrings.noInternet,
                style: GoogleFonts.montserrat(
                    fontSize: fontSize26, fontWeight: AppFontWeight.semiBold, color: AppColors.color757575),
                textAlign: TextAlign.center),
            SizedBox(height: 6.h),
            Text(AppStrings.noInternetDesc,
                style: GoogleFonts.montserrat(
                    fontSize: fontSize17, fontWeight: AppFontWeight.regular, color: AppColors.color757575),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
