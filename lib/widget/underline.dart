import 'package:flutter/material.dart';

import '../utils/utils.dart';

class Underline extends StatelessWidget {
  final double? width, thickness;
  final Color? color;
  const Underline({super.key, this.width, this.thickness, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 150.0,
      child: Divider(
        color: color ?? AppColors.black,
        thickness: thickness ?? 2.0,
      ),
    );
  }
}
