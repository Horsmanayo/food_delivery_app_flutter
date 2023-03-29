import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText(
      {Key? key,
      this.color,
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: "Roboto", color: color, fontWeight: FontWeight.w400),
    );
  }
}
