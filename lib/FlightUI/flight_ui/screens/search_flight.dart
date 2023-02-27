import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../common/routes.dart';

class SearchFlightScreen extends StatefulWidget {
  const SearchFlightScreen({Key? key}) : super(key: key);

  @override
  State<SearchFlightScreen> createState() => _SearchFlightScreenState();
}

class _SearchFlightScreenState extends State<SearchFlightScreen> {
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
          Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 20),
            child: searchBar(),
          ),
          flightsList(),
        ],
      ),
    );
  }

  Widget searchBar(){
    return Container(
      height:60,
      padding: const EdgeInsets.only(top:15,left: 20, right: 20,),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(color: Colors.green),
        borderRadius: const BorderRadius.all( Radius.circular(20),),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.search,color: Colors.white,size: 30,),
          SizedBox(width: 20,),
          Text("Search Flights", style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.normal),),
        ],
      ),
    );
  }

  Widget flightsList(){
    return Container(
      margin: const EdgeInsets.only(top: 110, left: 15, right: 15, bottom: 20),
      padding: const EdgeInsets.only(top:15,left:10, right: 10,bottom: 15),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Get.toNamed(Routes.TICKETSDETAILS);
                print("Recent Flights");
              },
              child: Container(
                height: 120,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(vertical: 05,),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border.all(color: Colors.grey.shade50,),
                  borderRadius: const BorderRadius.all( Radius.circular(20),),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15,),
                      child: const Text(
                        "Vacation in Maldives",
                        style: TextStyle(color: Colors.black87, fontSize: 15),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
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
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
