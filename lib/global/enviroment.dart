import 'dart:io';

class Enviroment {
  static String apiurl =
      Platform.isAndroid ? 'http://192.168.100.9:3002' : 'http://localhost:3002';
  static String socketUrl = Platform.isAndroid
      ? 'http://192.168.100.9:3002'
      : 'http://localhost:3002';
}
