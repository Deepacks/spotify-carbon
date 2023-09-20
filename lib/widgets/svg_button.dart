import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  final String assetName;
  final VoidCallback onPressed;

  final double size;
  final Color color;
  final Color backgroundColor;
  final double leftPadding;

  const SvgButton({
    super.key,
    required this.assetName,
    required this.onPressed,
    this.size = 20,
    this.color = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.leftPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.only(left: leftPadding),
        fixedSize: const Size(45, 45),
      ),
      onPressed: onPressed,
      child: Center(
        child: SvgPicture.asset(
          assetName,
          height: size,
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
