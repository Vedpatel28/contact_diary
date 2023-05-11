import 'dart:io';
import 'package:contact_diary/utils/Back_Button.dart';
import 'package:contact_diary/views/modals/Global_varibles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactEditpage extends StatefulWidget {
  const ContactEditpage({Key? key}) : super(key: key);

  @override
  State<ContactEditpage> createState() => _ContactEditpageState();
}

class _ContactEditpageState extends State<ContactEditpage> {
  ImagePicker imagepic = ImagePicker();

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const backbutton(),
        title: const Text(
          "Edit Contact",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.check_rounded,
              size: 40,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagr add
                Container(
                  height: s.height * 0.2,
                  width: s.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: s.height * 0.07,
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.grey,
                        foregroundImage:
                            (allGlobalvar.allContact[index].image != null)
                                ? FileImage(allGlobalvar.allContact[index].image!)
                                : null,
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
                                shape: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: const Text(
                                  "Select For Add Image",
                                ),
                                icon:
                                    const Icon(Icons.add_photo_alternate_outlined),
                                elevation: 4,
                                buttonPadding: const EdgeInsets.all(12),
                                content: Container(
                                  height: s.height * 0.1,
                                  alignment: Alignment.center,
                                  child: const Text(
                                      "Click Camera 📷 Button For Add Live Photo.\n"
                                      "Click Gallery 🌌 Button For Add all ready Clicked Photo.\n"),
                                ),
                                actions: [
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      XFile? img = await imagepic.pickImage(
                                          source: ImageSource.camera);
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
                                      XFile? img = await imagepic.pickImage(
                                          source: ImageSource.gallery);
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
                  initialValue: allGlobalvar.allContact[index].firstname,
                  onSaved: (newValue) {
                    allGlobalvar.allContact[index].firstname = newValue!;
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
                  initialValue: allGlobalvar.allContact[index].lastname,
                  onSaved: (newValue) {
                    allGlobalvar.allContact[index].lastname = newValue!;
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
                  initialValue: allGlobalvar.allContact[index].Contact,
                  onSaved: (newValue) {
                    allGlobalvar.allContact[index].Contact = newValue!;
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
                  initialValue: allGlobalvar.allContact[index].email,
                  onSaved: (newValue) {
                    allGlobalvar.allContact[index].email = newValue!;
                  },
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
