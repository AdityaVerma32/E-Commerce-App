import 'package:ecart/utils/dimensions.dart';
import 'package:ecart/widgets/small_text.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double space;
  final Color iconColor;

  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor,
      this.space = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconsize24,
        ),
        SizedBox(width: space),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
