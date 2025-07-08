import 'package:flutter/material.dart';

import '../utils/app_style.dart';
import 'widget.dart';

enum ButtonStyleType { filled, outlined }

class AppButton extends StatelessWidget {
  const AppButton.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyleType.filled,
    this.color = AppColors.salmon,
    this.width = double.infinity,
    this.height = 42.0,
    this.borderRadius = 50.0,
    this.icon,
    this.suffixIcon,
    this.disabled = false,
    this.fontSize = 18.0,
    this.textStyle,
    this.sideColor,
  });

  const AppButton.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyleType.outlined,
    this.color = Colors.transparent,
    this.width = double.infinity,
    this.height = 42.0,
    this.borderRadius = 50.0,
    this.icon,
    this.suffixIcon,
    this.disabled = false,
    this.fontSize = 18.0,
    this.textStyle,
    this.sideColor,
  });

  final Function() onPressed;
  final String label;
  final ButtonStyleType style;
  final Color color;
  final double? width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final Widget? suffixIcon;
  final bool disabled;
  final double fontSize;
  final TextStyle? textStyle;
  final Color? sideColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyleType.filled
          ? ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                overlayColor: AppColors.black,
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null && label.isNotEmpty)
                    const SizedBox(width: 10.0),
                  AppText(
                    text: label,
                    textStyle:
                        textStyle ??
                        AppTextStyle.h2.copyWith(color: AppColors.terracotta),
                  ),
                  if (suffixIcon != null && label.isNotEmpty)
                    const SizedBox(width: 10.0),
                  suffixIcon ?? const SizedBox.shrink(),
                ],
              ),
            )
          : OutlinedButton(
              onPressed: disabled ? null : onPressed,
              style: OutlinedButton.styleFrom(
                overlayColor: AppColors.black,
                backgroundColor: color,
                side: BorderSide(color: sideColor ?? Colors.grey, width: 2.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null && label.isNotEmpty)
                    const SizedBox(width: 10.0),
                  AppText(
                    text: label,
                    textStyle:
                        textStyle ??
                        AppTextStyle.h2.copyWith(color: AppColors.terracotta),
                  ),

                  if (suffixIcon != null && label.isNotEmpty)
                    const SizedBox(width: 10.0),
                  suffixIcon ?? const SizedBox.shrink(),
                ],
              ),
            ),
    );
  }
}
