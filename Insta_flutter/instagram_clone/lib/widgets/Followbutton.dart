import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Followbutton extends StatelessWidget {
  final Function()? function;
  final Color backgroundColor;
  final Color bordercolor;
  final String text;
  final Color txtclr;

  const Followbutton({super.key, this.function, required this.backgroundColor, required this.bordercolor, required this.text, required this.txtclr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: InkWell(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor, border: Border.all(color: bordercolor),
              borderRadius: BorderRadius.circular(5)),
              alignment: Alignment.center,
              child: Text(
                text ,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: txtclr
                ),
              ),
              width: 250,
              height: 27,
        ),
      ),
    );
  }
}
