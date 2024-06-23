import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddPropertyController extends GetxController{

  String? id, locationn, area, type, paymentType, amenty, noOfRooms, noOfBaths, price, downPayment, installmentValue, description, brokerPhone, brokerEmail, userEmail, pic;
  List? picList;
CollectionReference properties = FirebaseFirestore.instance.collection('Properties');

  Future<void> addProperty() {
      return properties
          .add({
            'Location': locationn, 
            'area': area, 
            'type': type ,
            'price': price,
            'number of rooms':noOfRooms,
            'number of baths': noOfBaths,
            'Amenties': amenty,
            'payment type': paymentType,
            'down payment': downPayment,
            'installment value': installmentValue,
            'description': description,
            'broker phone': brokerPhone,
            'broker email': brokerEmail,
            'user email': userEmail,
            'pic': pic,
            'picList': picList
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }


}