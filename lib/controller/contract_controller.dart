import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company/model/property_model.dart';
import 'package:company/services/posted_firestore_properties.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ContractController extends GetxController{
  String? sellerEmail, buyerEmail;
  List? contractPic;
  CollectionReference conracts = FirebaseFirestore.instance.collection('Contracts');
  Future<void> addContract(){
    return conracts.add({
    'seller email': sellerEmail,
    'buyer email': buyerEmail,
    'contract picture': contractPic
    }
    ) .then((value) => print("Contact Added"))
          .catchError((error) => print("Failed to add user: $error"));
  }

  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<PropertyModel> get postedPropertyModel => _postedPropertyModel;

  List<PropertyModel> _postedPropertyModel = [];

  getProperties() async{
    _loading.value = true;
    PostedFireStoreProperty().getPropertiess().then((value){
      for(int i = 0; i < value.length; i++){
        _postedPropertyModel.add(PropertyModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      update();
    });
    }

    ContractController(){
      getProperties();
    }

  List<XFile> imageList = [];

  final imagePicker = ImagePicker();

  Future<void> uploadImage() async{
    File file;

    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    
    imageList.addAll(selectedImages!);
    
    update();
  }
}