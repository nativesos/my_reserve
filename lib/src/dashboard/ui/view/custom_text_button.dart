import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  late String msm;
  late Function function;
  CustomTextButton({Key? key, required this.msm, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: TextButton(
        onPressed: ()=> function(),

        child: Text(msm),
      ),
    );
  }
}
