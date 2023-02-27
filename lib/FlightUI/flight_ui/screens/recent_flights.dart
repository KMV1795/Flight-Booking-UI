import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentFlights extends StatefulWidget {
  const RecentFlights({Key? key}) : super(key: key);

  @override
  State<RecentFlights> createState() => _RecentFlightsState();
}

class _RecentFlightsState extends State<RecentFlights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          firstBox(),
          sortBox(),
        ],
      ),
    );
  }

  Widget firstBox(){
    return  Container(
      height: 230,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          image: DecorationImage(
              image: AssetImage("assets/images/bg1.jpg"),
              fit: BoxFit.fill)),
      child: Container(
        padding: const EdgeInsets.only(top:40,left: 20, right: 20,bottom:40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back,color: Colors.white,size: 30,),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text(
                        "CHLD",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Cerritos",
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
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
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text(
                        "DNY",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Downy",
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sortBox() {
    List<String> priceList = ["Highest Price", "Lowest Price", "Average Price"];
    String selectedPrice = "Highest Price";

    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20,bottom: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Recent Flights",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          const Spacer(),
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
        ],
      ),
    );
  }



}
