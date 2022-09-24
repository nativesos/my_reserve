import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import 'local_storage.dart';


/// It allows extracting the unique identifier per cell phone
/// to serve as a reservation id in this case.

class DeviceInfo{

  static late String _phoneId = '';


  static Future<void> configureID()async{

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;


    if(LocalStorage.preferences.getBool('isDeviceIdActive') == null){

      LocalStorage.preferences.setString('deviceId', shortHash(androidInfo.id
          .toString()).toUpperCase()
      ).whenComplete(() => {

        _phoneId =  shortHash(androidInfo.id.toString()).toUpperCase(),

        LocalStorage.preferences.setBool('isDeviceIdActive', true),

      });

    }else{
      _phoneId = await LocalStorage.preferences.getString("deviceId").toString();
    }

  }

  static String get phoneId => _phoneId;

  static set phoneId(String value) {
    _phoneId = value;
  }
}