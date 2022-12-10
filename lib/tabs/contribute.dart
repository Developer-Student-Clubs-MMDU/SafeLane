import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:safelane/authentication/components/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class contribute extends StatefulWidget {
  const contribute({super.key});

  @override
  State<contribute> createState() => _contributeState();
}

class _contributeState extends State<contribute> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // getting the user location

  String locationMessage = 'Click image to get location';
  late String lat;
  late String long;

  Future _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Contribute",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            alignment: Alignment.topLeft,
            // color: Colors.pink,
            width: size.width * 0.8,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: size.width,
                      child: Text("Select obstacle type"),
                    ),
                    DropDownButton(),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: size.width,
                        child: Text("Location"),
                        margin: EdgeInsets.only(bottom: 10.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Text(
                            locationMessage,
                          ),
                          width: size.width * 0.5,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xfff2f2f2),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: (() {
                              _getCurrentLocation().then((value) {
                                lat = '${value.latitude}';
                                long = '${value.longitude}';
                                setState(() {
                                  locationMessage =
                                      'Latitude : $lat, Longitude: $long';
                                });
                              });
                            }),
                            child: Text('Locate')),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: size.width,
                      child: Text("Upload images"),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                    // InkWell(
                    //   onTap: () => pickImage(),
                    //   child: image != null
                    //       ? Image.file(
                    //           image!,
                    //           width: 200,
                    //           height: 160,
                    //           fit: BoxFit.cover,
                    //         )
                    //       : Container(
                    //           child: Center(
                    //             child: Text("Tap to upload image"),
                    //           ),
                    //           width: size.width,
                    //           height: 100,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             color: Color(0xfff2f2f2),
                    //           ),
                    //         ),
                    // ),
                    InkWell(
                      onTap: (() {
                        pickImage();
                      }),
                      child: image != null
                          ? Image.file(
                              image!,
                              width: 200,
                              height: 160,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              child: Center(
                                child: Text("Tap to upload image"),
                              ),
                              width: size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xfff2f2f2),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: size.width,
                        child: Text("Details"),
                        margin: EdgeInsets.only(bottom: 10.0)),
                    Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xfff2f2f2),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: "Fill the description here...",
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          elevation: 0,
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {},
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text("Post"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton<String>(
        elevation: 3,
        isExpanded: true,
        value: dropdownValue,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
        style: TextStyle(color: Colors.black),
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
      ),
    );
  }
}
