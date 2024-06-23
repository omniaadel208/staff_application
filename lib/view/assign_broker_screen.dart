import 'package:company/controller/animation_controller.dart';
import 'package:company/controller/get_property_controller.dart';
import 'package:company/model/property_model.dart';
import 'package:company/view/assign_details_screen.dart';
import 'package:company/view/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignBrokerScreen extends StatefulWidget {
  const AssignBrokerScreen({super.key});

  @override
  State<AssignBrokerScreen> createState() => _AssignBrokerScreenState();
}

class _AssignBrokerScreenState extends State<AssignBrokerScreen> {
  Color primaryColor = const Color(0xff446FAF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
backgroundColor: primaryColor,
        title: const Text('assign a broker'),
      ),
      body:SafeArea(
        child:SingleChildScrollView(
          child: GetBuilder<AnimationControl>(
            init: AnimationControl(),
            builder: (controllerr) => Container(
                            color:
                                HouseAppTheme.buildLightTheme().backgroundColor,
                            child: GetBuilder<GetPropertyController>(
                              init: GetPropertyController(),
                              builder: (controller) => ListView.builder(
                                itemCount: controller.propertyModel.length,
                                padding: const EdgeInsets.only(top: 8),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  final int count =
                                      controller.propertyModel.length > 10 ? 10 : controller.propertyModel.length;
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
                  onTap: (){
                    Get.to(AssignDetailsScreen(model: controller.propertyModel[index]));
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
                                  controller.propertyModel[index].pic.toString(),
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
                                                  controller.propertyModel[index].city.toString(),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                              ),
                                              // Text(
                                              //   '${propertyData.dist.toStringAsFixed(1)} km to city',
                                              //   overflow: TextOverflow.ellipsis,
                                              //   style: TextStyle(
                                              //     fontSize: 14,
                                              //     color: Colors.grey
                                              //         .withOpacity(0.8),
                                              //   ),
                                              // ),
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
                                          Text(' ${controller.propertyModel[index].noOfRooms.toString()} Beds'),
                                          SizedBox(width: 10),
                                          Icon(Icons.bathtub, color: primaryColor),
                                          Text(' ${controller.propertyModel[index].noOfBaths.toString()} Baths'),
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
                                          // Action Icons
                                          // Row(
                                          //   children: <Widget>[
                                          //     IconButton(
                                          //       icon: Icon(Icons.phone),
                                          //       onPressed: () {
                                          //         // Implement call action
                                          //       },
                                          //     ),
                                          //     IconButton(
                                          //       icon: Icon(Icons.message),
                                          //       onPressed: () {
                                          //         // Implement message action
                                          //       },
                                          //     ),
                                          //     IconButton(
                                          //       icon: Icon(Icons.whatshot),
                                          //       onPressed: () {
                                          //         // Implement WhatsApp action
                                          //       },
                                          //     ),
                                          //   ],
                                          // ),
                                          // Cost Display
                                          Text(
                                            '\$${controller.propertyModel[index].price.toString()}',
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
                          // Positioned(
                          //   top: 8,
                          //   right: 8,
                          //   child: Material(
                          //     color: Colors.transparent,
                          //     child: InkWell(
                          //       borderRadius: const BorderRadius.all(
                          //         Radius.circular(32.0),
                          //       ),
                          //       onTap: () {},
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: GestureDetector(
                          //           onTap: (){
                          //            //controller.toggleFavourites(controller.propertyModel[index]);
                          //            setState(() {
                          //              controller.propertyModel.remove(controller.propertyModel[index]);
                          //            });
                          //           },
                          //   child: Icon(Icons.check_outlined)                                      ),
                          //       ),
                          //     ),
                          //   ),
                          // )
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