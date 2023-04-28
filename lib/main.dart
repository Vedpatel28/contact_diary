import 'package:contact_diary/utils/Back_Button.dart';
import 'package:contact_diary/utils/utils_routes_page.dart';
import 'package:contact_diary/views/screen/contact_add_page.dart';
import 'package:contact_diary/views/screen/contact_detail_page.dart';
import 'package:contact_diary/views/screen/contact_edit_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      routes: {
        allroutes.conaddpage: (context) => const ContactAddPage(),
        allroutes.coneditpage: (context) => const ContactEditpage(),
        allroutes.condetailpage: (context) => const ContactDetailPage(),
        allroutes.homepage: (context) => Scaffold(
              appBar: AppBar(
                title: const Text("Contact Page"),
                centerTitle: true,
                elevation: 0,
              ),
              body: ListView(
                padding: EdgeInsets.zero,
                children: List.generate(
                  20,
                  (index) => Scrollbar(
                    controller: PageController(),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.account_circle_outlined),
                      ),
                      title: Text("Index ${index + 1}"),
                      subtitle: const Text("mobile No."),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.phone),
                      ),
                    ),
                  ),
                ),
              ),
            ),
      },
    );
  }
}
