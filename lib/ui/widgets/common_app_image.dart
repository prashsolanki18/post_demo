import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sunflower_lab_test/ui/widgets/common_app_shimmer.dart';

/// Common app image which handles network, assets and local file paths
class CommonAppImage extends StatelessWidget {
  final String imagePath;
  final BorderRadius radius;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;

  const CommonAppImage({
    Key? key,
    required this.imagePath,
    this.height,
    this.width,
    this.radius = BorderRadius.zero,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: radius),
      child: imagePath.startsWith('http')
          ? CachedNetworkImage(
              placeholder: (context, string) =>
                  CommonAppShimmer.rectangular(height: height ?? double.infinity, width: width ?? double.infinity),
              imageUrl: imagePath,
              height: height,
              width: width,
              fit: fit,
            )
          : imagePath.contains('assets')
              ? Image.asset(
                  imagePath,
                  height: height,
                  width: width,
                  fit: fit,
                  color: color,
                )
              : Image.file(
                  File(imagePath),
                  height: height,
                  width: width,
                  fit: fit,
                ),
    );
  }
}
