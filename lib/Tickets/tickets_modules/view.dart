import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:gallery_saver/gallery_saver.dart';
import 'package:my_app/Tickets/tickets_modules/controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'add_page.dart';
import 'add_tickets.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class TicketsScreen extends GetView<TicketsController> {
  const TicketsScreen({Key? key}) : super(key: key);

  // Future downloadFile(Reference ref) async{
  //   /* Not Visible to user
  //   final dir = await getApplicationDocumentsDirectory();
  //   final file = File('${dir.path}/${ref.name}');
  //   await ref.writeToFile(file);
  //   */
  //
  //   // Visible to User inside gallery
  //   final url = await ref.getDownloadURL();
  //   final tempDir = await getTemporaryDirectory();
  //   final path = '${tempDir.path}/${ref.name}';
  //
  //  await Dio().download(url, path);
  //
  //  if(url.contains('.mp4')){
  //    await GallerySaver.saveVideo(path,toDcim: true);
  //  }else if(url.contains('.jpg')){
  //    await GallerySaver.saveImage(path,toDcim: true);
  //  }
  //
  //   //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloaded ${ref.name}")));
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.black,
          title: const Text("Tickets"),
          actions: [
          IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTicketsPage()),
                );
              },
              icon: const Icon(Icons.add_circle_outline,color: Colors.white,)),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: controller.ticketsReference.snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              var docs = snapshot.data!.docs;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: docs.length,
                  itemBuilder: (context, index){
                    return Container(
                      height: 150,
                      margin: const EdgeInsets.only( bottom: 05,top: 05,left:05,right: 05),
                      child: Card(
                        color: Colors.white70,
                        child:  Container(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 05),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(docs[index]['problemTitle'].toString(), style: const TextStyle(
                                    color: Colors.indigo, fontSize: 19,fontWeight: FontWeight.bold),),
                                Text(docs[index]['problemDescription'].toString(), style: const TextStyle(
                                    color: Colors.black, fontSize: 17,overflow: TextOverflow.clip),),
                                Text(docs[index]['location'].toString(), style: const TextStyle(
                                    color: Colors.deepOrangeAccent, fontSize: 16,fontStyle: FontStyle.italic),),
                                InkWell(
                                  onTap: () async {
                                    print("${docs[index]['attachmentUrl']}");
                                    final url = Uri.parse(docs[index]['attachmentUrl']);
                                    if (!await launchUrl(
                                      url,
                                      mode: LaunchMode.externalApplication,
                                    )) {
                                      throw Exception('Could not launch $url');
                                    }
                                    //await controller.launchUrl(url);
                                    print("$url");
                                  },
                                  child: Text('File : ${docs[index]['fileName'].toString()}', style: const TextStyle(overflow: TextOverflow.clip,
                                      color: Colors.black, fontSize: 13),),
                                ),
                              ],
                            ),
                        ),
                          ),
                        );
                  }
              );
            }else {
              return const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Text("No Tickets Available",style: TextStyle(
                      color: Colors.white, fontSize: 18),),
                ),
              );
            }
          }
      ),
    );
  }
}
