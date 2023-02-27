import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'package:file_picker/file_picker.dart';

class AddTickets extends GetView<TicketsController> {
  AddTickets({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _problemTitleController = TextEditingController();
  final _problemDescriptionController = TextEditingController();

  // Attachment
  String fileName = '';

  PlatformFile? pickedFile;

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
          margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _problemTitleController,
                style:const TextStyle(
               color: Colors.black, fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'Enter Title',
                  labelStyle:  TextStyle(
                      color: Colors.black, fontSize: 15),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a problem title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40,),
              TextFormField(
                controller: _problemDescriptionController,
                maxLines: null,
                style: const TextStyle(
                    color: Colors.black, fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'Enter Description',
                  labelStyle:  TextStyle(
                      color: Colors.black, fontSize: 15),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a problem description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40,),
              Row(
                children: [
                  const Text("Attachment",style: TextStyle(
                      color: Colors.black, fontSize: 18),),
                  const SizedBox(width: 20,),
                  IconButton(
                   // onPressed: selectFile,
                      onPressed: () {
                        // File Picker
                        //fileName = await pickFile();
                        pickedFile =  selectFile() as PlatformFile?;
                       Future.delayed(const Duration(seconds: 2));
                       print ("Result======${pickedFile!.name}");
                      },
                      icon: const Icon(Icons.attach_file)),
                ],
              ),
              const SizedBox(height: 20,),

              pickedFile != null ?
              Container(
                height: 100,
                width: 200,
                child: Text("File: ${pickedFile?.name}",style: const TextStyle(
                    color: Colors.orange, fontSize: 25),),
              )
                 : Container(
                       height: 100,
                       width: 100,
                       child: Text("File: ${pickedFile?.name}",style: const TextStyle(
                           color: Colors.orange, fontSize: 25),),
                    ),
              const SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () async {
                    // Submitting Ticket

                    controller.submitForm(
                        fileName,
                        _problemTitleController.text,
                        _problemDescriptionController.text,
                    );

                  },
                  child: const Text('Submit',style: TextStyle(
                      color: Colors.white, fontSize: 23),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Select File

  Future selectFile() async{
      final result = await FilePicker.platform.pickFiles();
      if(result == null){
        return null;
      }else{
        pickedFile = result.files.first;
        print("PickedFile========${pickedFile!.name}");
        await Future.delayed(const Duration(seconds: 2));
        return pickedFile;
      }
  }

  // upload File

  Future uploadFile() async{

  }


  // File Pick Function
  // pickFile() async {
  //
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   String? fileData;
  //
  //   if (result != null && result.files.single.path != null) {
  //     /// Load result and file details
  //     PlatformFile file = result.files.first;
  //     print(file.name);
  //     print(file.bytes);
  //     print(file.size);
  //     print(file.extension);
  //     print(file.path);
  //
  //     /// normal file
  //     File _file = File(result.files.single.path!);
  //     fileData = _file.path;
  //     return fileData;
  //   } else {
  //     return null;
  //     /// User canceled the picker
  //   }
  //
  // }


}
