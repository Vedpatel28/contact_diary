import 'package:contact_diary/utils/Back_Button.dart';
import 'package:contact_diary/utils/utils_routes_page.dart';
import 'package:contact_diary/views/modals/Global_varibles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailPage extends StatefulWidget {
  const ContactDetailPage({Key? key}) : super(key: key);

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const backbutton(),
        title: const Text(
          "Contacts",
          style: TextStyle(
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
                SizedBox(width: s.width * 0.2, height: s.height * 0.2),
                CircleAvatar(
                  radius: 60,
                  foregroundImage: FileImage(allGlobalvar.allContact[index].image!),
                ),
                // SizedBox(width: s.width * 0.1),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      allGlobalvar.allContact.removeAt(index);
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                    size: s.height * 0.03,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(allroutes.coneditpage, arguments: index);
                  },
                  icon: Icon(
                    Icons.edit,
                    size: s.height * 0.028,
                  ),
                ),
              ],
            ),
            SizedBox(height: s.height * 0.05),
            Text(
              "${allGlobalvar.allContact[index].firstname} ${allGlobalvar.allContact[index].lastname}",
              style: TextStyle(
                wordSpacing: 2,
                fontSize: s.height * 0.04,
              ),
            ),
            SizedBox(height: s.height * 0.01),
            Row(
              children: [
                SizedBox(width: s.width * 0.05),
                Text(
                  "+91 ${allGlobalvar.allContact[index].Contact}",
                  style: TextStyle(
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
                GestureDetector(
                  onTap: () {
                    Uri call = Uri(
                      scheme: 'tel',
                      path: allGlobalvar.allContact[index].Contact,
                    );
                    launchUrl(call);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: s.height * 0.03,
                    child: const Icon(Icons.phone, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Uri sms = Uri(
                      scheme: 'sms',
                      path: allGlobalvar.allContact[index].Contact,
                    );
                    launchUrl(sms);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: s.height * 0.03,
                    child: const Icon(Icons.message, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Uri mail = Uri(
                      scheme: 'mailto',
                      query: "subject=Contact us=Dear ${allGlobalvar.allContact[index].firstname}",
                      path: allGlobalvar.allContact[index].email,
                    );
                    launchUrl(mail);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blue.shade300,
                    radius: s.height * 0.03,
                    child: const Icon(Icons.email_rounded, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Share.share(
                        "${allGlobalvar.allContact[index].firstname} ${allGlobalvar.allContact[index].lastname} \n ${allGlobalvar.allContact[index].Contact}");
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: s.height * 0.03,
                    child: const Icon(Icons.share, color: Colors.white),
                  ),
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
