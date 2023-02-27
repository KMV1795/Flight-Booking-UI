import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../common/routes.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(170.0),
          child: Container(
            padding: const EdgeInsets.only(top: 40, bottom: 30, left: 20, right: 20),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg1.jpg"),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Lets Book your \nFlight",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipOval(
                        child: Image.asset("assets/images/profile.png",),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const TabBar(
                  indicatorColor: Colors.amber,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                  labelPadding: EdgeInsets.all(05),
                  tabs: [
                    Tab(
                      text: "One Way",
                    ),
                    Tab(
                      text: "Round Trip",
                    ),
                  ],
                  labelColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(color: Colors.white70),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: Colors.white70),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Vacation in Maldives",
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                        const SizedBox(height: 20),
                        Row(
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
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 05, horizontal: 20),
                    margin: const EdgeInsets.symmetric(
                        vertical: 05, horizontal:0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Departure",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Adults",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 05, horizontal: 0),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            width: 130,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              border: Border.all(color: Colors.white70),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(Icons.calendar_today_outlined,
                                    color: Colors.deepOrangeAccent),
                                Text(
                                  "21 May 23",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(color: Colors.white70),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.remove_circle,
                                color: Colors.deepOrangeAccent,
                                size: 30,
                              ),
                              Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 30,
                              ),
                              Icon(
                                Icons.add_circle,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 05, horizontal: 20),
                    margin: const EdgeInsets.symmetric(
                        vertical: 05, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Child",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 100),
                        Text(
                          "Infants",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 05, horizontal: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            width: 150,
                            padding: const EdgeInsets.all(02),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              border: Border.all(color: Colors.white70),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.remove_circle,
                                  color: Colors.deepOrangeAccent,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.add_circle,
                                  color: Colors.green,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          padding: const EdgeInsets.all(02),
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(color: Colors.white70),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.remove_circle,
                                color: Colors.deepOrangeAccent,
                                size: 30,
                              ),
                              Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 30,
                              ),
                              Icon(
                                Icons.add_circle,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 05, horizontal: 20),
                    margin: const EdgeInsets.symmetric(
                        vertical: 05, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Cabin",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                     height: 100,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.green),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Economy",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left:10),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(color: Colors.white70),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text("Business",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left:10),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(color: Colors.white70),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text("First Class",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left:10),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(color: Colors.white70),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text("Second Class",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),),
                          ),
                        ),
                      ],
                    ),),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(100, 50),
                      ),
                      onPressed: () {
                        // Get.toNamed(Routes.FLIGHTSEARCH);
                        // print("Search Flight");
                      },
                      child: const Center(child:Text(
                        "Search Flight",style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),)),
                    ),
                  ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );

  }
}
