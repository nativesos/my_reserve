import 'package:flutter/material.dart';
import 'package:my_reserve/src/dashboard/ui/widget/custom_dialog_widget.dart';
import 'package:my_reserve/src/dashboard/viewmodel/dashboard_model.dart';
import 'package:my_reserve/src/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:my_reserve/src/device_info.dart';
import 'package:provider/provider.dart';

class CustomGridView extends StatefulWidget {
  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {

  late List<DasboardModel> cradsData = [];

  @override
  void initState() {

    DashboardViewModel model =
    Provider.of<DashboardViewModel>(context, listen: false);

    model.getServices(context).then((value) => {
      setState(() {
        cradsData = model.dasboardModel;
      })
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    DashboardViewModel model =
    Provider.of<DashboardViewModel>(context);

    return cradsData.isEmpty? Container(
      
      color: Colors.black26,
      height: double.infinity,
      width: double.infinity,
      child: const Center(
        child: CircularProgressIndicator.adaptive(strokeWidth: 1),
      ),
    ) : GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 2 / 2,
            mainAxisSpacing: 20),
        itemCount: cradsData.length,
        itemBuilder: (BuildContext ctx, index) {

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: _colorProperty(model, index)),
                  onPressed: () {

                    showDialog(context: context, builder: (_){
                      return CustomDialog(
                        tittle: cradsData[index].hour,
                        msm: "Date: ${cradsData[index].date}\n"
                               "Product: ${cradsData[index].product}\n"
                               "Phone Id: ${DeviceInfo.phoneId == cradsData[index].phoneId ? cradsData[index].phoneId : ""}\n\n"
                               "Status: ${cradsData[index].status}",
                        status: cradsData[index].status,
                        id: cradsData[index].id,
                      );
                    });

                  },
                  child: _dialogData(index)),
            ),
          );
        });
  }


  MaterialStateProperty<Color>?  _colorProperty(DashboardViewModel model, int index){
    return MaterialStateProperty.all<Color>(
        model.dasboardModel[index].status == "Taked"?
        Colors.red :
        Colors.green);
  }

  Widget _dialogData(int index){
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(cradsData[index].id),
            Text(cradsData[index].hour),
            Text(cradsData[index].date),
            Text(cradsData[index].product),
            Text(cradsData[index].status),

          ],
        )
    );
  }
}
