import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunflower_lab_test/app/app_colors.dart';
import 'package:sunflower_lab_test/app/app_font_weight.dart';
import 'package:sunflower_lab_test/app/app_fonts_size.dart';

/// Common app bar used in whole app
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final bool isShowActionButton;
  final VoidCallback? onActionTap;
  final bool isShowBackButton;

  @override
  final Size preferredSize; // default is 56.0

  const CommonAppBar({
    Key? key,
    required this.label,
    this.isShowActionButton = false,
    this.onActionTap,
    this.isShowBackButton = true,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorWhite,
      elevation: 5,
      automaticallyImplyLeading: isShowBackButton,
      title: Text(label,
          style: GoogleFonts.roboto(fontSize: fontSize17, fontWeight: AppFontWeight.bold, color: AppColors.color1D1D1F)),
      actions: [
        if (isShowActionButton)
          IconButton(
            onPressed: onActionTap,
            icon: const Icon(Icons.add, color: AppColors.color1D1D1F),
          )
      ],
    );
  }
}
