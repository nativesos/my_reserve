import 'package:flutter/material.dart';
import 'package:my_reserve/src/dashboard/viewmodel/dashboard_viewmodel.dart';

import '../view/custom_text_button.dart';

class CustomResponseDialog extends StatelessWidget {

  late String tittle;
  late String msm;

  CustomResponseDialog({Key? key, required this.tittle, required this.msm}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SimpleDialog(
      title: Text(tittle),
      elevation: 10,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('$msm'),
        ),



        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            CustomTextButton(
              msm:"Ok !",
              function: () => DashboardViewModel.closeDialog(context),

            ),
          ],
        )
      ],

    );



  }

}
