import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataPage(
      {super.key,
      required this.text,
      this.imgPath = "assets/Images/EmptyCart1.png"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(imgPath,
            height: MediaQuery.of(context).size.height *
                0.22, // According to screen height
            width: MediaQuery.of(context).size.width *
                0.22 // According to screen width
            ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.0175,
              // Media query is used to make application responsive by using Dynamic screen sizes
              color: Theme.of(context).disabledColor),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
