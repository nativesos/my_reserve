import 'package:flutter/material.dart';
import 'package:my_reserve/src/device_info.dart';

import '../widget/custom_gridview_widget.dart';

/// Principal view of context
class Dashboard extends StatefulWidget {

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Motorcycle Rental')),

          leading: Center(child: Text(DeviceInfo.phoneId.toString())),

        ),
        body: CustomGridView(),
      )
    );
  }
}
