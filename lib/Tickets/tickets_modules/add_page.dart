import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'controller.dart';
import 'package:get/get.dart';


class FirebaseApi {
  static UploadTask? uploadTask(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } catch (e) {
      return null;
    }
  }
}

class AddTicketsPage extends StatefulWidget {
  const AddTicketsPage({Key? key}) : super(key: key);

  @override
  State<AddTicketsPage> createState() => _AddTicketsPageState();
}

class _AddTicketsPageState extends State<AddTicketsPage> {

  final _formKey = GlobalKey<FormState>();
  final _problemTitleController = TextEditingController();
  final _problemDescriptionController = TextEditingController();
  final TicketsController controller = Get.put(TicketsController());

  PlatformFile? pickedFile;
  File? file;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    final path = result.files.single.path!;
    file = File(path);
      setState(() {
        pickedFile = result.files.first;
      });
    }


  // upload File
  // Future uploadFile() async {
  //  if(file == null)return;
  //  // final fileName = basename(file!.path);
  //  final fileName =pickedFile!.name;
  //   final destination = 'files/$fileName';
  //
  //   // FirebaseApi.uploadFile(destination,file!);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Create Tickets'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _problemTitleController,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Enter Title',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a problem title';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _problemDescriptionController,
                  maxLines: null,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Enter Description',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a problem description';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const Text(
                      "Attachment",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: selectFile,
                        //onPressed: () {
                        // File Picker
                        //fileName = await pickFile();
                        // },
                        icon: const Icon(Icons.attach_file)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if(pickedFile != null)
                   Text(
                     "File: ${pickedFile!.name}",
                     style:
                         const TextStyle(color: Colors.orange, fontSize: 15),
                   ),
                const SizedBox(
                  height: 10,
                ),
                // if(pickedFile != null)
                //   SizedBox(
                //         height: 100,
                //         width: 200,
                //         child: Image.file(File(pickedFile!.path!),fit: BoxFit.cover,),
                //       ),
                const SizedBox(
                  height: 20,
                ),

                Center(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () async {

                      // Submitting Ticket
                      controller.fileSubmitForm(
                         pickedFile!,
                        _problemTitleController.text,
                        _problemDescriptionController.text,
                      );
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: controller.uploadTask?.snapshotEvents,
      builder:(context,snapshot){
        if(snapshot.hasData){
          final data = snapshot.data;
          double progress = data!.bytesTransferred/data.totalBytes;
          return SizedBox(
            height: 50,
            width: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                ),
                Center(
                  child: Text("${(100*progress).roundToDouble()}%",style: const TextStyle(color: Colors.white),),
                ),
              ],
            ),
          );
        }else{
          return const SizedBox(height: 50,);
        }
      }
  );



}
