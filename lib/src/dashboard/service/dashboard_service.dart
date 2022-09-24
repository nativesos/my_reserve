import 'package:http/http.dart' as http;

import 'package:my_reserve/main_api.dart';


/// rest services for crud
class DashboardService{

  static Future<dynamic> get({required String path}) async
  => await http.get(Uri.parse(MainApi.url.value.toString() + path));

}