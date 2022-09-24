import 'package:flutter/material.dart';
import 'package:my_reserve/src/dashboard/viewmodel/dashboard_model.dart';
import 'package:my_reserve/src/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';

import '../view/custom_text_button.dart';

class CustomDialog extends StatelessWidget {

  late String tittle;
  late String msm;
  late String? id;
  late String? status;


  CustomDialog({Key? key, required this.tittle, required this.msm, this.status, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isAvailable = status == "Available";
    return SimpleDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(tittle),
          Text(id!)
        ],
      ),
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
                msm: isAvailable ? "Cancel" : "Leave !",
              function: () {

                if (!isAvailable) {
                  DashboardViewModel.updateTaked(context, id!, true);
                }else{
                  DashboardViewModel.closeDialog(context);
                }


              }

            ),
            const SizedBox(
              width: 30,
            ),
            CustomTextButton(
                msm: isAvailable ? "Take !" : "Ok !",
              function: ()=> (isAvailable) ?
              DashboardViewModel.updateTaked(context, id!, false) : DashboardViewModel.closeDialog(context),
            )
          ],
        )
      ],

    );



  }




}
