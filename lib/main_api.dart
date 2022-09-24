

///Some constants used by enums to make them more readable and -
///understandable when checking the information
enum MainApi {
  url,
}

extension ValueConstant on MainApi {
  static final values = {
    MainApi.url : "https://nativesos.com/server/services",
  };

  String? get value => values[this];
}


/// Error network constant
/// is posiblle agree more messages or errors
/// 404, 303, etc
enum ErrorConnection {
  internet,
}

extension ErrorConnectionValues on ErrorConnection{
  static final values ={
    ErrorConnection.internet: "Network Error",
  };

  String? get value=> values[this];
}