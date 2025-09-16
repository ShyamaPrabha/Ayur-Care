import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  final String assetName;
  final Color? color;
  final double? width, height;
  final void Function()? onPressed;

  const AppSvg({
    super.key,
    required this.assetName,
    this.color,
    this.width,
    this.height,
    this.onPressed,
  });

  const AppSvg.clickable({
    super.key,
    required this.assetName,
    this.color,
    this.width,
    this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => onPressed == null
      ? buildSvgPicture()
      : IconButton(
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: buildSvgPicture(),
        );

  SvgPicture buildSvgPicture() => SvgPicture.asset(
    "assets/images/$assetName.svg",
    fit: BoxFit.contain,
    width: width,
    height: height,
    colorFilter: color != null
        ? ColorFilter.mode(color!, BlendMode.srcIn)
        : null,
  );
}
