//Reusable text widget can be used with doffrent inouts

import 'package:ecart/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText(
      {super.key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 20,
      this.overFlow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: size == 0 ? Dimensions.font20 : size),
    );
  }
}
