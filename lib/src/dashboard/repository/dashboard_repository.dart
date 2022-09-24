import 'dart:convert';

import 'package:my_reserve/src/dashboard/service/dashboard_service.dart';
import 'package:my_reserve/src/dashboard/viewmodel/dashboard_model.dart';


class DashboardRepository{

  static Future<List<DasboardModel>> getServices() async{

    var response  = await DashboardService.get(path:'.json');

    var data = jsonDecode(response.body);

    List<DasboardModel> services = <DasboardModel>[];

    for(data in data){
      services.add(DasboardModel.fromJson(data));
    }

    return services;
  }



}