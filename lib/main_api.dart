enum MainApi {
  url,
}

extension ValueConstant on MainApi {
  static final values = {
    MainApi.url : "https://nativesos.com/server/services",
  };

  String? get value => values[this];
}



enum ErrorConnection {
  internet,
}

extension ErrorConnectionValues on ErrorConnection{
  static final values ={
    ErrorConnection.internet: "Network Error",
  };

  String? get value=> values[this];
}