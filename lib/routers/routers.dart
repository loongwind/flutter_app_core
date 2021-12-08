import 'package:flutter_app_core/pages/counter/view.dart';
import 'package:get/get.dart';
 
class RouteGet { 
  ///root page 
  static const String main = "/"; 
 
  ///pages map 
  static final List<GetPage> getPages = [ 
    GetPage(name: main, page: () => CounterPage()),
  ]; 
}