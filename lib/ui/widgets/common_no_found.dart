import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunflower_lab_test/app/app_colors.dart';
import 'package:sunflower_lab_test/app/app_font_weight.dart';
import 'package:sunflower_lab_test/app/app_fonts_size.dart';

class CommonNoFound extends StatelessWidget {
  final String title;
  final String desc;

  const CommonNoFound({Key? key, required this.title, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: GoogleFonts.montserrat(
                    fontSize: fontSize26, fontWeight: AppFontWeight.semiBold, color: AppColors.color1D1D1F),
                textAlign: TextAlign.center),
            SizedBox(height: 6.h),
            Text(desc,
                style: GoogleFonts.montserrat(
                    fontSize: fontSize17, fontWeight: AppFontWeight.regular, color: AppColors.color757575),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
