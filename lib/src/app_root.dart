import 'package:company/utils/binding.dart';
import 'package:company/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
     return  GetMaterialApp(
    initialBinding: Binding(), 
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
    
    );
      
    
  }

  
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

