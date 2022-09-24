import 'package:flutter/material.dart';
import 'package:my_reserve/src/dashboard/repository/dashboard_repository.dart';
import 'package:my_reserve/src/dashboard/ui/widget/custom_response_dialog_widget.dart';
import 'package:my_reserve/src/dashboard/viewmodel/dashboard_model.dart';
import 'package:my_reserve/src/local_storage.dart';
import 'package:provider/provider.dart';

class DashboardViewModel with ChangeNotifier {


  late String _id;
  late String _hour;
  late String _date;
  late String _product;
  late String _phoneId;
  late String _status;



  late List<DasboardModel> _dasboardModel = [];

  Future<void> getServices(BuildContext context) async {
    try {
      _dasboardModel = await DashboardRepository.getServices();
    } catch (e) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) {
            return CustomResponseDialog(
              tittle: "Error:",
              msm: "Error de red",
            );
          });
    }

    notifyListeners();
  }

  static closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  List<DasboardModel> get dasboardModel => _dasboardModel;

  set dasboardModel(List<DasboardModel> value) {
    _dasboardModel = value;

    notifyListeners();
  }

  static updateTaked(BuildContext context, String idProduct, bool leaveMotorcycle) {
    String chages = 'Done';

    String localPhoneId = LocalStorage.preferences.getString('deviceId').toString();

    DashboardViewModel model = Provider.of<DashboardViewModel>(context, listen: false);

    late List<DasboardModel> _updateDasboardModel = model.dasboardModel;

    _updateDasboardModel.forEach((element) {

      if (element.id == idProduct ) {

        if(element.phoneId.isEmpty || element.phoneId == localPhoneId) {
          element.status = leaveMotorcycle ? "Available" : "Taked";
          element.phoneId = leaveMotorcycle ? "" : localPhoneId;
        }else{
          chages = 'You cannot change the reservations of other clients';
        }
      }


    });

    model.dasboardModel = _updateDasboardModel;
    DashboardViewModel.closeDialog(context);



    final snackBar = SnackBar(
      content: Text(chages),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: (){},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);


  }

  String get status => _status;

  set status(String value) {
    _status = value;
    notifyListeners();
  }

  String get phoneId => _phoneId;

  set phoneId(String value) {
    _phoneId = value;
    notifyListeners();
  }

  String get product => _product;

  set product(String value) {
    _product = value;
    notifyListeners();
  }

  String get date => _date;

  set date(String value) {
    _date = value;
    notifyListeners();
  }

  String get hour => _hour;

  set hour(String value) {
    _hour = value;
    notifyListeners();
  }

  String get id => _id;

  set id(String value) {
    _id = value;
    notifyListeners();
  }

/*

  Fecha en Appbar

  Hora
  Producto

  estado

  => AL abrir el dialog pregunta

  Decea separar el producto *** para el dia *** a las *** ?

  cancel   yes please



  */

}
