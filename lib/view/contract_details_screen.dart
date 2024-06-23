import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company/controller/contract_controller.dart';
import 'package:company/model/property_model.dart';
import 'package:company/view/add_contract.dart';
import 'package:company/view/add_contract_screen.dart';
import 'package:company/view/components/add_property_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class ContactDetailsScreen extends StatefulWidget {
  //late PropertyModel model;
  var propid;
  ContactDetailsScreen({super.key, required this.propid});

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  List urlconract = [];
  Color primaryColor = const Color(0xff446FAF);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contract Details', style: TextStyle(fontStyle: FontStyle.italic),),
       backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView
        (child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Column(children: [
                  GetBuilder<ContractController>(
                              init: ContractController(),
                              builder: (controller) => AddPropertyData('seller email', 'seller email', Icons.email,
                              (value){
                                if(value == null || value.isEmpty){return 'Please enter some text';
                                  }
                                },
                               (newvalue){
                                controller.sellerEmail = newvalue;
                                }
                                ),
                            ),
                            SizedBox(height: 20,),
                            GetBuilder<ContractController>(
                              builder: (controller) => AddPropertyData('buyer email', 'buyer email', Icons.email,
                              (value){
                                if(value == null || value.isEmpty){return 'Please enter some text';
                                  }
                                },
                               (newvalue){
                                controller.buyerEmail = newvalue;
                                }
                                ),
                            ),
                        
                ]),
              ),
              SizedBox(height: 20,),
                            GetBuilder<ContractController>(
                          builder:(controller) =>ElevatedButton(onPressed:(){
                  controller.uploadImage();
                          },
                   child: Text('upload photo',
                   style: TextStyle(color: Colors.white),),
                   style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                   ),
                   ),
                        ),
                         SizedBox(height: 20,),
            
                   GetBuilder<ContractController>(
                      builder: (controller) => Container(
              height: 200,
              child: ListView.separated(
              scrollDirection: Axis.horizontal,
               itemCount: controller.imageList.length,
               itemBuilder: (context, index){
                  return controller.imageList.isEmpty? Text('no choosen images'): Image.file(File(controller.imageList[index].path),width: 100, height: 100,);
                  //Future.delayed(Duration(seconds: 2));
              },
                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 20,),
               ),
                      ),
                    ),
SizedBox(height: 20,),
GetBuilder<ContractController>(
                    builder: (controller) =>ElevatedButton(
                      onPressed: () async {
                        Get.to(AddContractScreen());
                        File file;
                        var url;
                        _formkey.currentState!.save();
                        if(_formkey.currentState!.validate()){
                          for(int i = 0; i < controller.imageList.length; i++){
                                if(controller.imageList[i] != null){
                                  file = File(controller.imageList[i].path);
                                  var imagename = basename(controller.imageList[i].path);
                                  var refStorage = FirebaseStorage.instance.ref('Property Contract/${imagename}');
                                  await refStorage.putFile(file);
                                  url = await refStorage.getDownloadURL();
                                  urlconract.add(url);
                                }
                              }
                              //QuerySnapshot docref = await FirebaseFirestore.instance.collection('Properties').get();
                              // Get.to(AddContractScreen());
                          controller.contractPic = urlconract;
                          controller.addContract();
                          //controller.imageList.clear();
                          await FirebaseFirestore.instance.collection('Properties').doc(widget.propid).delete();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: Size(300, 50),
                        ),
                      child: const Text('Add',
                      style: TextStyle(
                        fontSize: 20
                      ),
                      ),
                    ),
                  ),
            ],
          ),
          ) ,
        )
         ),
    );
  }
}