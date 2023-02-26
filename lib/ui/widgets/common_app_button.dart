import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunflower_lab_test/app/app_colors.dart';
import 'package:sunflower_lab_test/app/app_font_weight.dart';
import 'package:sunflower_lab_test/app/app_fonts_size.dart';

/// Common app button used in whole app
class CommonAppButton extends StatelessWidget {
  final String? text;
  final VoidCallback onClick;
  final double horizontalPadding;
  final double topPadding;
  final double radius;
  final bool isTransparentWithBorder;
  final Color? transparentWithBorderColor;
  final TextStyle? textStyle;
  final bool isTransparent;
  final bool isLoading;
  final String? icon;
  final Color? iconColor;
  final double? height;
  final bool isExpanded;
  final Color? buttonColor;
  final double innerVerticalPadding;
  final double innerHorizontalPadding;

  const CommonAppButton({
    Key? key,
    this.text,
    required this.onClick,
    this.horizontalPadding = 0,
    this.topPadding = 0,
    this.radius = 100,
    this.isTransparentWithBorder = false,
    this.transparentWithBorderColor,
    this.textStyle,
    this.isTransparent = false,
    this.isLoading = false,
    this.icon,
    this.iconColor,
    this.height,
    this.isExpanded = true,
    this.buttonColor,
    this.innerVerticalPadding = 0,
    this.innerHorizontalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, left: horizontalPadding, right: horizontalPadding),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
              border: buttonColor != null
                  ? null
                  : Border.all(
                      color: isTransparentWithBorder
                          ? transparentWithBorderColor ?? AppColors.color243F62
                          : isTransparent
                              ? AppColors.colorF3F3F3
                              : AppColors.primaryPalette,
                      width: isTransparentWithBorder ? 1.5 : 0),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              color: buttonColor ??
                  (isTransparentWithBorder
                      ? null
                      : isTransparent
                          ? AppColors.colorF3F3F3
                          : AppColors.colorE88923),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.colorShadow,
                    offset: Offset(
                      0,
                      3,
                    ),
                    blurRadius: 6,
                    spreadRadius: 6),
              ]),
          height: height ?? 50.h,
          width: isExpanded ? double.infinity : null,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: innerVerticalPadding, horizontal: innerHorizontalPadding),
          child: isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: isTransparentWithBorder || isTransparent ? AppColors.primaryPalette : AppColors.colorWhite,
                    strokeWidth: 2.5,
                  ),
                )
              : icon != null && text != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          icon ?? '',
                          height: 16,
                          color: iconColor,
                        ),
                        SizedBox(width: 8.w),
                        Text(text ?? '',
                            style: textStyle ??
                                GoogleFonts.roboto(
                                    fontSize: fontSize17,
                                    fontWeight: AppFontWeight.semiBold,
                                    color: isTransparentWithBorder
                                        ? AppColors.color243F62
                                        : isTransparent
                                            ? AppColors.color333333
                                            : AppColors.colorWhite))
                      ],
                    )
                  : icon != null
                      ? Image.asset(
                          icon ?? '',
                          color: iconColor ?? AppColors.colorWhite,
                          height: 24.h,
                        )
                      : Text(text ?? '',
                          style: textStyle ??
                              GoogleFonts.roboto(
                                  fontSize: fontSize17,
                                  fontWeight: AppFontWeight.semiBold,
                                  color: isTransparentWithBorder
                                      ? AppColors.color243F62
                                      : isTransparent
                                          ? AppColors.color333333
                                          : AppColors.colorWhite)),
        ),
      ),
    );
  }
}
