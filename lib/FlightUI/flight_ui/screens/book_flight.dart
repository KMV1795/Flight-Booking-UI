import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/routes.dart';

class BookFlightPage extends StatefulWidget {
  const BookFlightPage({Key? key}) : super(key: key);

  @override
  State<BookFlightPage> createState() => _BookFlightPageState();
}

class _BookFlightPageState extends State<BookFlightPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  );

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg1.jpg"),
                    fit: BoxFit.fill)),
          ),
          titleBox(),
          firstBox(tabController),
          sortBox(),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
                top: 460, left: 20, right: 20, bottom: 20),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.only(top: 10, left: 05, right: 05, bottom: 05),
                      child: flightList());
                }),
          ),
        ],
      ),
    );
  }

  Widget titleBox() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Let's Book your \nFlight",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: ClipOval(
              child: Image.asset(
                "assets/images/profile.png",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget firstBox(TabController tabController) {
    return Container(
      height: 270,
      margin: const EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 10, left: 07, right: 07, bottom: 05),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TabBar(
              controller: tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'One Way',
                ),
                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Round Trip',
                ),
                Tab(
                  text: 'Multi City',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              tripBox(),
              tripBox(),
              tripBox(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget tripBox() {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
        left: 07,
        right: 07,
      ),
      child: Stack(
        children: [
          Container(
            height: 70,
            padding: const EdgeInsets.only(
              top: 10,
              left: 07,
              right: 07,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 07,
                      right: 07,
                      bottom: 10,
                    ),
                    child: const Icon(
                      Icons.flight_takeoff_rounded,
                      color: Colors.deepOrangeAccent,
                      size: 30,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "From",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "London, NCD",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 70,
            margin: const EdgeInsets.only(
              top: 90,
              bottom: 10,
            ),
            padding: const EdgeInsets.only(top: 10,),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 07,
                      right: 07,
                      bottom: 10,
                    ),
                    child: const Icon(
                      Icons.flight_takeoff_rounded,
                      color: Colors.blue,
                      size: 30,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "To",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Barstow, BSW",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(
                top: 60,
                right: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.loop,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sortBox() {
    List<String> priceList = ["Highest Price", "Lowest Price", "Average Price"];
    String selectedPrice = "Highest Price";

    return Container(
      margin: const EdgeInsets.only(top: 400, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Sort by",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 50,
            width: 135,
            padding: const EdgeInsets.all(03),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: DropdownButtonFormField<String>(
              value: selectedPrice,
              items: priceList
                  .map((price) => DropdownMenuItem(
                      value: price,
                      child: Text(
                        price,
                        style: const TextStyle(fontSize: 15),
                      )))
                  .toList(),
              onChanged: (value) {
                selectedPrice = value!;
              },
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.FLIGHTSEARCH);
              print("Search Flight");
            },
            child: Container(
              height: 50,
              width: 80,
              padding: const EdgeInsets.all(03),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Center(
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget flightList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 270,
                  margin: const EdgeInsets.only(
                      top: 05, left: 10, right: 10, bottom:05),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/flight4.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  height: 30,
                  width: 60,
                  margin: const EdgeInsets.only(
                      top: 20, left: 20, right: 10, bottom: 10),
                  padding: const EdgeInsets.all(01),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "* 150",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 270,
              margin: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Flight Yogyakarta",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "HJB-JKM",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: 270,
              margin: const EdgeInsets.only(
                  top: 05, left: 10, right: 10, bottom: 05),
              child: const Divider(
                height: 20,
                thickness: 0.5,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 270,
              margin: const EdgeInsets.only(
                  top: 05, left: 10, right: 05, bottom: 05),
              child: Row(
                children: [
                  const Icon(
                    Icons.av_timer_outlined,
                    color: Colors.green,
                    size: 20,
                  ),
                  const Expanded(
                    child: Text(
                      "10.00 AM - 12.00 PM",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Text(
                          "Book Now",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.orange,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
