import 'package:ecart/utils/dimensions.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color BackGroundcolor;
  final Color iconColor;
  final double size;

  const AppIcon(
      {super.key,
      required this.icon,
      this.BackGroundcolor = const Color(0xFFfc4e4),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: BackGroundcolor),
      child: Icon(icon, color: iconColor, size: Dimensions.iconsize16),
    );
  }
}
