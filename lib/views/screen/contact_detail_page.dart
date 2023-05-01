import 'package:contact_diary/utils/Back_Button.dart';
import 'package:contact_diary/utils/utils_routes_page.dart';
import 'package:contact_diary/views/modals/Global_varibles.dart';
import 'package:flutter/material.dart';

class ContactDetailPage extends StatefulWidget {
  const ContactDetailPage({Key? key}) : super(key: key);

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const backbutton(),
        title: const Text(
          "Contacts",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: s.width * 0.32, height: s.height * 0.2),
                 CircleAvatar(
                  radius: 60,
                  foregroundImage: FileImage(allGlobalvar.image!),
                ),
                SizedBox(width: s.width * 0.1),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: s.height * 0.03,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(allroutes.coneditpage);
                  },
                  icon: Icon(
                    Icons.edit,
                    size: s.height * 0.028,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: s.height * 0.05),
            Text(
              "${allGlobalvar.Fname} ${allGlobalvar.Lname}",
              style: TextStyle(
                color: Colors.black,
                wordSpacing: 2,
                fontSize: s.height * 0.04,
              ),
            ),
            SizedBox(height: s.height * 0.01),
            Row(
              children: [
                SizedBox(width: s.width * 0.05),
                Text(
                  "+91 ${allGlobalvar.Pnumber}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: s.height * 0.028,
                  ),
                ),
              ],
            ),
            SizedBox(height: s.height * 0.01),
            Container(
              height: 2,
              width: 360,
              color: Colors.grey,
            ),
            SizedBox(height: s.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: s.height*0.03,
                  child: const Icon(Icons.phone, color: Colors.white),
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: s.height*0.03,
                  child: const Icon(Icons.message, color: Colors.white),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue.shade300,
                  radius: s.height*0.03,
                  child: const Icon(Icons.email_rounded, color: Colors.white),
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: s.height*0.03,
                  child: const Icon(Icons.share,color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: s.height * 0.02),
            Container(
              height: 2,
              width: 360,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
