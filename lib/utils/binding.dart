import 'package:company/controller/add_property_controller.dart';
import 'package:company/controller/get_property_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddPropertyController(), fenix: true);
    Get.lazyPut(() => GetPropertyController(), fenix: true);
  }

}