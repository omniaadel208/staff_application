import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company/controller/animation_controller.dart';
import 'package:company/controller/contract_controller.dart';
import 'package:company/controller/get_property_controller.dart';
import 'package:company/model/property_model.dart';
import 'package:company/view/assign_details_screen.dart';
import 'package:company/view/contract_details_screen.dart';
import 'package:company/view/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContractScreen extends StatefulWidget {
  const AddContractScreen({super.key});

  @override
  State<AddContractScreen> createState() => _AddContractScreenState();
}

class _AddContractScreenState extends State<AddContractScreen> {
  List<QueryDocumentSnapshot> datap = [];
  List ids = [];
  Color primaryColor = const Color(0xff446FAF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Add a Contract', style: TextStyle(fontStyle: FontStyle.italic),),
      ),
      body:SafeArea(
        child:SingleChildScrollView(
          child: GetBuilder<AnimationControl>(
            init: AnimationControl(),
            builder: (controllerr) => Container(
                            color:
                                HouseAppTheme.buildLightTheme().backgroundColor,
                            child: GetBuilder<ContractController>(
                              init: ContractController(),
                              builder: (controller) => ListView.builder(
                                itemCount: controller.postedPropertyModel.length,
                                padding: const EdgeInsets.only(top: 8),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  final int count =
                                      controller.postedPropertyModel.length > 10 ? 10 : controller.postedPropertyModel.length;
                                  final Animation<double> animation =
                                      Tween<double>(begin: 0.0, end: 1.0).animate(
                                          CurvedAnimation(
                                              parent: controllerr.animationController!,
                                              curve: Interval(
                                                  (1 / count) * index, 1.0,
                                                  curve: Curves.fastOutSlowIn)));
                                  controllerr.animationController?.forward();
                                  return AnimatedBuilder(
                animation: controllerr.animationController!,
                builder: (BuildContext context, Widget? child) {
                  return FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(
                0.0,
                50 * (1.0 - animation.value),
                0.0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 8,
                  bottom: 16,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () async{
                    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Properties').get();
                                          datap.addAll(querySnapshot.docs);
                                          for(int i = 0; i< datap.length; i++){
                                            ids.add(datap[i].id);
                                          }
                    Get.to(ContactDetailsScreen(propid: ids[index],));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          offset: const Offset(4, 4),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 2,
                                child: Image.network(
                                  controller.postedPropertyModel[index].pic.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'House',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 22,
                                              color: primaryColor
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                  controller.postedPropertyModel[index].city.toString(),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        children: [
                                          Icon(Icons.bed, color: primaryColor),
                                          Text(' ${controller.postedPropertyModel[index].noOfRooms.toString()} Beds'),
                                          SizedBox(width: 10),
                                          Icon(Icons.bathtub, color: primaryColor),
                                          Text(' ${controller.postedPropertyModel[index].noOfBaths.toString()} Baths'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${controller.postedPropertyModel[index].price.toString()}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                     //controller.toggleFavourites(controller.propertyModel[index]);
                                     setState(() {
                                       controller.postedPropertyModel.remove(controller.postedPropertyModel[index]);
                                     });
                                    },
                            child: Icon(Icons.check_outlined)                                      ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
                  );
                },
              );
                                },
                              ),
                            ),
                          ),
          ),
                    
            )
         ),
    );
  }
}