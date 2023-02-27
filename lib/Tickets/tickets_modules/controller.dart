import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;

class TicketsController extends GetxController{

  TicketsController();

  CollectionReference ticketsReference = FirebaseFirestore.instance.collection('problems');

  Position? currentPosition;
  String currentAddress = "";
  String fileName="";

  bool submitted = false;

  UploadTask? uploadTask;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');


  @override
  void onInit() async{
    super.onInit();
    Position position = await getLocation();
    getAddressFromLatLong(position);
    // Local Notification
    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);


    submitted == true?
    await flutterLocalNotificationsPlugin.show(
        0, 'Tickets', 'Request has been created',
        const NotificationDetails(android:  AndroidNotificationDetails(
            'your channel id',
            'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker')),
        payload: 'item x'):null;
  }



  /* Getting Location And Address*/
  Future<Position> getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('', 'Location Permission Denied');
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (kDebugMode) {
      print(placemarks);
    }
    Placemark place = placemarks[0];
    currentAddress = '${place.locality}';
  }



  // Creating Ticket , Adding to firebase
  void submitForm(String? attachment, String problemTitle, String problemDescription) async {
    try {
      // Upload the attachment to Firebase Storage (if there is one)
      String? attachmentUrl;

      if (attachment != null) {
        fileName = attachment;
        final storageRef = FirebaseStorage.instance.ref().child('uploads/$attachment');
        final uploadTask = storageRef.putString(attachment);
        final snapshot = await uploadTask.whenComplete(() {});
        // Download the attached URl
        attachmentUrl = await snapshot.ref.getDownloadURL();
      }

      // Save the form data to Firestore
      final problem = {
        'problemTitle': problemTitle.trim(),
        'problemDescription': problemDescription.trim(),
        'location': currentAddress.toString().trim(),
        'reportedDate': DateTime.now(),
        'attachmentUrl': attachmentUrl,
        'fileName':fileName,
      };
      await ticketsReference.add(problem);

      // Schedule a notification to be sent
      submitted = true;
      onInit();

      // Navigate back to the problem list
      Get.back();

    }catch(e){
          print("Error $e");
    }
  }

  Future<void> _zonedScheduleNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }


  // Launch Url
  launchUrl(Uri url) async {
    if (await launchUrl(url)) {
        await launchUrl(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  Future fileSubmitForm(PlatformFile pickedFile,String problemTitle, String problemDescription) async {
    try {

      // Upload the attachment to Firebase Storage (if there is one)

      UploadTask? uploadTask;

      // Upload the attachment to Firebase Storage (if there is one)
      fileName = pickedFile.name;
      final path = 'files/${pickedFile.name}';
      final file = File(pickedFile.path!);

      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask =ref.putFile(file);

      // Download the attached URl
      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      print("Download Url=====$urlDownload");


      // Save the form data to Firestore

      final Map<String, dynamic> problem = <String, dynamic> {
        'problemTitle': problemTitle.trim(),
        'problemDescription': problemDescription.trim(),
        'location': currentAddress.toString().trim(),
        'reportedDate': DateTime.now(),
        'attachmentUrl': urlDownload,
        'fileName':fileName,
      };
      await ticketsReference.add(problem);

      // Schedule a notification to be sent
      submitted = true;
      onInit();

      // Navigate back to the problem list
      Get.back();

    }catch(e){
      print("Error $e");
    }
  }

}