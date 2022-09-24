import 'package:flutter/material.dart';

import 'src/device_info.dart';
import 'package:provider/provider.dart';

import 'package:my_reserve/src/dashboard/ui/view/dashboard.dart';
import 'package:my_reserve/src/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:my_reserve/src/local_storage.dart';

void main() {

  /// Correcccion error de inicio para desktop
  WidgetsFlutterBinding.ensureInitialized();

  /// Shared preferences Started Point
  LocalStorage.configurePreferences();


  runApp( const MainApp() );


}


/// First Run Application and charger Providers
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => DashboardViewModel(), lazy: false)
      ],

      child: const MyApp(),
    );
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {

    /// Device Info initial configuration
    DeviceInfo.configureID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Reservations',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Dashboard(),
    );
  }
}

