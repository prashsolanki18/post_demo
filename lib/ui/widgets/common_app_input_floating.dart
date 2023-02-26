import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunflower_lab_test/app/app_colors.dart';
import 'package:sunflower_lab_test/app/app_font_weight.dart';
import 'package:sunflower_lab_test/app/app_fonts_size.dart';

/// Common app input used in whole app
class CommonAppInputFloating extends StatelessWidget {
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
  final VoidCallback? onSuffixClick;
  final TextInputAction textInputAction;
  final RegExp? regExp;
  final RegExp? blackListRegExp;
  final int maxLength;
  final Function(String)? onChange;
  final Function(String)? onInputSubmit;
  final Function()? onTap;
  final bool isSearchBox;
  final bool isEnableInputBox;
  final bool isDescBox;
  final bool isFocused;
  final int? minLine;
  final int? maxLine;
  final bool alignLabelWithHint;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;

  const CommonAppInputFloating({
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
    this.onSuffixClick,
    this.textInputAction = TextInputAction.done,
    this.regExp,
    this.blackListRegExp,
    this.maxLength = 500,
    this.onChange,
    this.onInputSubmit,
    this.onTap,
    this.isSearchBox = false,
    this.isEnableInputBox = true,
    this.isDescBox = false,
    required this.isFocused,
    this.minLine,
    this.maxLine,
    this.alignLabelWithHint = false,
    this.currentFocusNode,
    this.nextFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isSearchBox ? AppColors.colorF2F3F5 : null,
          border: Border.all(color: isFocused ? AppColors.primaryPalette : AppColors.colorE5E5E5)),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      height: maxLine == null ? 44 : null,
      child: TextField(
        focusNode: currentFocusNode,
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: isPassword,
        maxLength: maxLength,
        textInputAction: textInputAction,
        textCapitalization: TextCapitalization.sentences,
        enableSuggestions: false,
        onSubmitted: (String text) {
          onInputSubmit?.call(text);
          nextFocusNode?.requestFocus();
        },
        onChanged: onChange,
        onTap: onTap,
        enabled: isEnableInputBox,
        maxLines: maxLine ?? (isDescBox ? 8 : 1),
        minLines: minLine ?? (isDescBox ? 3 : 1),
        decoration: InputDecoration(
          fillColor: isSearchBox ? AppColors.colorF2F3F5 : null,
          filled: isSearchBox,
          prefixIconConstraints: const BoxConstraints(maxWidth: 38, maxHeight: 38),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 5, right: 7),
                  child: Image.asset(prefixIcon!, color: AppColors.color999999, width: 18),
                )
              : null,
          suffixIconConstraints: suffixIcon != null ? const BoxConstraints(maxWidth: 38, maxHeight: 38) : null,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: InkResponse(
                    radius: 15,
                    onTap: onSuffixClick,
                    child: Image.asset(suffixIcon!, color: suffixIconColor ?? AppColors.color999999, width: 18),
                  ),
                )
              : null,
          hintText: hintText,
          isDense: true,
          labelStyle: labelStyle ??
              GoogleFonts.montserrat(fontSize: fontSize17, color: AppColors.color757575, fontWeight: AppFontWeight.regular),
          hintStyle: hintStyle ??
              GoogleFonts.montserrat(fontSize: fontSize17, color: AppColors.color757575, fontWeight: AppFontWeight.regular),
          floatingLabelStyle: hintStyle ??
              GoogleFonts.montserrat(
                  fontSize: fontSize14, color: AppColors.primaryPalette, fontWeight: AppFontWeight.regular),
          contentPadding: const EdgeInsets.only(bottom: -5, top: -5),
          labelText: hintText,
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: alignLabelWithHint,
          counter: const Offstage(),
        ),
        inputFormatters: [
          if (regExp != null) FilteringTextInputFormatter.allow(regExp!),
          if (textInputType == TextInputType.emailAddress) FilteringTextInputFormatter.deny(RegExp('[ ]')),
          if (blackListRegExp != null) FilteringTextInputFormatter.deny(blackListRegExp!),
        ],
      ),
    );
  }
}
