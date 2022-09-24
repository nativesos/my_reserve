import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

  static late SharedPreferences preferences;

  static Future<void> configurePreferences()async{
    preferences = await SharedPreferences.getInstance();
  }


}