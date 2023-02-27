import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../common/routes.dart';

class TicketFinalScreen extends StatefulWidget {
  const TicketFinalScreen({Key? key}) : super(key: key);

  @override
  State<TicketFinalScreen> createState() => _TicketFinalScreenState();
}

class _TicketFinalScreenState extends State<TicketFinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Container(
        height: 100,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom:20,),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0)),
            minimumSize: const Size(100, 50),
          ),
          onPressed: () {
            Get.toNamed(Routes.INITIAL);
            print("Search Flight");
          },
          child: const Center(child:Text(
            "Download Ticket",style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg1.jpg"),
                    fit: BoxFit.fill)),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 170),
            decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(color: Colors.white70),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50,left: 30,right: 30,),
            child: const Center(child: Text("Boarding Pass",),),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 100,left: 30,right: 30),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/ticket_card.png"),
                    fit: BoxFit.fill),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  margin: const EdgeInsets.only(top:05,),
                  child: const Image(
                    image: AssetImage("assets/images/flight1.jpg"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                  child: Text(
                    "American Airlines Flight ML-1852",
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                ),
                Container(margin: const EdgeInsets.only(left:10,right: 10),child: const Divider(height: 10,thickness: 3,color: Colors.black54,)),
                SizedBox(
                  height: 80,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "CHLD",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Cerritos",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.flight_takeoff_rounded,
                            color: Colors.indigo,
                            size: 25,
                          ),
                          Text(
                            "1h 30min",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "DNY",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Downy",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  margin: const EdgeInsets.only(left:40,right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 80,
                        padding:const EdgeInsets.all(05),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          border: Border.all(color: Colors.green),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.timer,color: Colors.deepOrangeAccent,size: 25,
                            ),
                            Spacer(),
                            Text(
                              "Time",
                              style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "10.00 - 12.00",
                              style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        padding:const EdgeInsets.all(05),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          border: Border.all(color: Colors.green),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.calendar_today,color: Colors.deepOrangeAccent,size: 25,
                            ),
                            Spacer(),
                            Text(
                              "Date",
                              style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "12 Mar 2023",
                              style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top:10,left:40,right: 40,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                        Text(
                            "Gate",
                            style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "03",
                            style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Seat",
                            style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "A1",
                            style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Flight",
                            style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "ZCVD",
                            style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Class",
                            style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Business",
                            style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  margin: const EdgeInsets.only(top:10,),
                  child: const Image(
                    image: AssetImage("assets/images/barcode.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
