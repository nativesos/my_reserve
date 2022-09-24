
import 'dart:convert';

List<DasboardModel> dasboardModelFromJson(String str) => List<DasboardModel>.from(json.decode(str).map((x) => DasboardModel.fromJson(x)));

String dasboardModelToJson(List<DasboardModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DasboardModel {
  DasboardModel({
    required this.id,
    required this.hour,
    required this.date,
    required this.product,
    required this.phoneId,
    required this.status,
  });

  String id;
  String hour;
  String date;
  String product;
  String phoneId;
  String status;

  factory DasboardModel.fromJson(Map<String, dynamic> json) => DasboardModel(
    id : json["id"],
    hour: json["hour"],
    date: json["date"],
    product: json["product"],
    phoneId: json["phoneId"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hour": hour,
    "date": date,
    "product": product,
    "phoneId": phoneId,
    "status": status,
  };
}
