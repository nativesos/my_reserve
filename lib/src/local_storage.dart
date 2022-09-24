import 'package:shared_preferences/shared_preferences.dart';

/// class with static function that allows to initialize the preferences,
/// this helps to call the saved information at the moment of initializing it
class LocalStorage{

  static late SharedPreferences preferences;

  static Future<void> configurePreferences()async{
    preferences = await SharedPreferences.getInstance();
  }


}