import 'dart:io';

import 'package:contact_diary/utils/Back_Button.dart';
import 'package:contact_diary/utils/utils_routes_page.dart';
import 'package:contact_diary/views/component/snackbar_com.dart';
import 'package:contact_diary/views/modals/Global_varibles.dart';
import 'package:contact_diary/views/modals/modals.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactAddPage extends StatefulWidget {
  const ContactAddPage({Key? key}) : super(key: key);

  @override
  State<ContactAddPage> createState() => _ContactAddPageState();
}

class _ContactAddPageState extends State<ContactAddPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ImagePicker imagepic = ImagePicker();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const backbutton(),
        title: const Text(
          "Add",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                allroutes.homepage,
              );
              contacts(
                firstname: allGlobalvar.Fname!,
                lastname: allGlobalvar.Lname!,
                Contact: allGlobalvar.Pnumber!,
                email: allGlobalvar.Email!,
              );

              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  errorsnackBar(
                    text: "Successfully Add Contact",
                    color: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  errorsnackBar(text: "Sum thing Error !!", color: Colors.redAccent),
                );
              }
              setState(() {});
            },
            child: const Icon(
              Icons.check_rounded,
              size: 30,
            ),
          ),
          const Icon(
            Icons.check_rounded,
            size: 10,
            color: Colors.transparent,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagr add
                Container(
                  height: s.height * 0.2,
                  width: s.width,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: s.height * 0.07,
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.grey,
                        foregroundImage: (allGlobalvar.image != null) ? FileImage(allGlobalvar.image!) : null,
                        child: const Text(
                          "ADD",
                        ),
                      ),
                      Container(
                        height: s.height * 0.04,
                        width: s.width * 0.08,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: FloatingActionButton(
                          elevation: 3,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                alignment: Alignment.center,
                                shadowColor: Colors.black,
                                shape: UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                title: const Text(
                                  "Select For Add Image",
                                ),
                                icon: const Icon(Icons.add_photo_alternate_outlined),
                                elevation: 4,
                                buttonPadding: const EdgeInsets.all(12),
                                content: Container(
                                  height: s.height * 0.1,
                                  alignment: Alignment.center,
                                  child: const Text("Click Camera 📷 Button For Add Live Photo.\n"
                                      "Click Gallery 🌌 Button For Add all ready Clicked Photo.\n"),
                                ),
                                actions: [
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      XFile? img = await imagepic.pickImage(source: ImageSource.camera);
                                      if (img != null) {
                                        setState(() {
                                          allGlobalvar.image = File(img.path);
                                        });
                                      }
                                    },
                                    label: const Text("Camera"),
                                    icon: const Icon(Icons.camera_alt_outlined),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      XFile? img = await imagepic.pickImage(source: ImageSource.gallery);
                                      if (img != null) {
                                        setState(() {
                                          allGlobalvar.image = File(img.path);
                                        });
                                      }
                                    },
                                    label: const Text("Gallery"),
                                    icon: const Icon(Icons.photo_library),
                                  ),
                                ],
                              ),
                            );
                          },
                          backgroundColor: Colors.blue,
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                // first name
                const Text(
                  "First Name",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  initialValue: allGlobalvar.Fname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter First Name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    allGlobalvar.Fname = newValue;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                    errorBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: s.height * 0.02),
                // last name
                const Text(
                  "Last Name",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  initialValue: allGlobalvar.Lname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Last name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    allGlobalvar.Lname = newValue;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                    errorBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: s.height * 0.02),
                // phone number
                const Text(
                  "Phone number",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  maxLength: 10,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  initialValue: (allGlobalvar.Pnumber == null) ? null : allGlobalvar.Pnumber.toString(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Contect Number";
                    } else if (value.length < 10) {
                      return "Enter 10 Digits...";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    allGlobalvar.Pnumber = int.parse(newValue!);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "+91 9093839249",
                    errorBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: s.height * 0.02),
                // Email
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "",
                    errorBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: s.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
