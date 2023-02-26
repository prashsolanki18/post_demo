import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunflower_lab_test/app/app_colors.dart';
import 'package:sunflower_lab_test/app/app_font_weight.dart';
import 'package:sunflower_lab_test/app/app_fonts_size.dart';

/// Common app input used in whole app
class CommonAppInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool isPassword;
  final double borderRadius;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? suffixIconColor;
  final bool isSuffixIconPadding;
  final VoidCallback? onSuffixClick;
  final TextInputAction textInputAction;
  final RegExp? regExp;
  final RegExp? blackListRegExp;
  final int maxLength;
  final Function(String)? onChange;
  final Function(String)? onInputSubmit;
  final bool isSearchBox;
  final bool isEnableInputBox;
  final bool isDescBox;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final double? prefixIconSize;
  final double? suffixIconSize;
  final bool autoFocus;
  final bool isLoading;

  const CommonAppInput({
    Key? key,
    required this.textEditingController,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.borderRadius = 100,
    this.hintText = '',
    this.hintStyle,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconColor,
    this.isSuffixIconPadding = true,
    this.onSuffixClick,
    this.textInputAction = TextInputAction.done,
    this.regExp,
    this.blackListRegExp,
    this.maxLength = 500,
    this.onChange,
    this.onInputSubmit,
    this.isSearchBox = false,
    this.isEnableInputBox = true,
    this.isDescBox = false,
    this.contentPadding,
    this.fillColor,
    this.currentFocusNode,
    this.nextFocusNode,
    this.prefixIconSize,
    this.suffixIconSize,
    this.autoFocus = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      focusNode: currentFocusNode,
      keyboardType: textInputType,
      obscureText: isPassword,
      maxLength: maxLength,
      autocorrect: false,
      textInputAction: textInputAction,
      textCapitalization:
          textInputType == TextInputType.emailAddress ? TextCapitalization.none : TextCapitalization.sentences,
      enableSuggestions: false,
      autofocus: autoFocus,
      onSubmitted: (String text) {
        onInputSubmit?.call(text);
        nextFocusNode?.requestFocus();
      },
      onChanged: (value) => onChange?.call(value),
      enabled: isEnableInputBox,
      maxLines: isDescBox ? 8 : 1,
      minLines: isDescBox ? 3 : 1,
      decoration: InputDecoration(
        fillColor: fillColor ?? (isSearchBox ? AppColors.colorF2F3F5 : null),
        filled: isSearchBox || fillColor != null,
        prefixIconConstraints: BoxConstraints(maxWidth: prefixIconSize ?? 38, maxHeight: prefixIconSize ?? 38),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 15, right: 7),
                child: Image.asset(prefixIcon!, color: AppColors.color999999, width: 18),
              )
            : null,
        suffixIconConstraints:
            suffixIcon != null ? BoxConstraints(maxWidth: suffixIconSize ?? 42, maxHeight: suffixIconSize ?? 42) : null,
        suffixIcon: suffixIcon != null
            ? isLoading
                ? CircularProgressIndicator(color: AppColors.primaryPalette, strokeWidth: 2.5)
                    .paddingOnly(right: 15, top: 8, bottom: 8)
                : InkResponse(
                    radius: 15,
                    onTap: onSuffixClick,
                    child: Image.asset(suffixIcon!, color: suffixIconColor ?? AppColors.color999999, width: 18).paddingOnly(
                        left: isSuffixIconPadding ? 15 : 7,
                        right: 15,
                        top: isSuffixIconPadding ? 15 : 0,
                        bottom: isSuffixIconPadding ? 15 : 0),
                  )
            : null,
        hintText: hintText,
        isDense: true,
        labelStyle: labelStyle ??
            GoogleFonts.montserrat(fontSize: fontSize14, color: AppColors.color1D1D1F, fontWeight: AppFontWeight.regular),
        hintStyle: hintStyle ??
            GoogleFonts.montserrat(fontSize: fontSize17, color: AppColors.color999999, fontWeight: AppFontWeight.regular),
        contentPadding: contentPadding ??
            (isSearchBox ? const EdgeInsets.symmetric(horizontal: 15, vertical: 7) : EdgeInsets.all(isDescBox ? 0 : 14)),
        border: !isDescBox
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: fillColor ?? AppColors.colorE5E5E5,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : InputBorder.none,
        enabledBorder: !isDescBox
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: fillColor ?? AppColors.colorE5E5E5,
                  style: BorderStyle.solid,
                  width: isSearchBox ? 0 : 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : InputBorder.none,
        disabledBorder: !isDescBox
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: fillColor ?? AppColors.colorE5E5E5,
                  style: BorderStyle.solid,
                  width: isSearchBox ? 0 : 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : InputBorder.none,
        focusedBorder: !isDescBox
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: fillColor ?? AppColors.colorE5E5E5,
                  style: BorderStyle.solid,
                  width: isSearchBox ? 0 : 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : InputBorder.none,
        counter: const Offstage(),
      ),
      inputFormatters: [
        if (regExp != null) FilteringTextInputFormatter.allow(regExp!),
        if (textInputType == TextInputType.emailAddress) FilteringTextInputFormatter.deny(RegExp('[ ]')),
        if (blackListRegExp != null) FilteringTextInputFormatter.deny(blackListRegExp!),
      ],
    );
  }
}
