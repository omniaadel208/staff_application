import 'package:company/view/ContractItem.dart';
import 'package:company/view/add_contract.dart';
import 'package:company/view/add_contract_screen.dart';
import 'package:company/view/assign_broker_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('company stuff'),
        backgroundColor: const Color(0xff446FAF),
      ),
      body: Center(
        child:Column(
          children: [
            SizedBox(height: 222,),
          GestureDetector(
       onTap: (){
        Get.to(AssignBrokerScreen());
       },
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                    color:const Color(0xff446FAF)
                    ),
                    child:const Center(
                      child: Text(
                        'assign a broker',
                        style: TextStyle(
                        //fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white
                      ),
                      ),
                    ),
                    ),
                   
                ),

              const  SizedBox(height: 30,),

              GestureDetector(
       onTap: (){
        Get.to(AddContractScreen());
       },
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                    color:const Color(0xff446FAF)
                    ),
                    child:const Center(
                      child: Text(
                        'make a contract',
                        style: TextStyle(
                        //fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white
                      ),
                      ),
                    ),
                    ),
                   
                )

        ],)
         ),
    );
  }
}