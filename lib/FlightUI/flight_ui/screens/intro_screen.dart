import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/info.dart';
import '../../common/routes.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/5.jpg"),
                    fit: BoxFit.fill)),
            child: Container(
              margin: const EdgeInsets.only(top: 60,left: 40,right: 40,bottom: 20),
              padding: const EdgeInsets.all(05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Find and Book\nA Great Experience",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height:30,),
                  const Text(
                    "Going forward after a pandemic that \ndevasted the airline industry",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    onPressed:(){
                      Get.toNamed(Routes.bookFlight);
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),),
                  const SizedBox(height: 10,),
                  // Container(
                  //   height: 500,
                  //   width: 320,
                  //   decoration: const BoxDecoration(
                  //     image:DecorationImage(
                  //       fit: BoxFit.fill,
                  //       image: AssetImage("assets/images/bags.png"),
                  //     ),
                  //   )
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
