import 'package:contact_diary/utils/image_utils.dart';
import 'package:contact_diary/utils/utils_routes_page.dart';
import 'package:contact_diary/views/modals/Global_varibles.dart';
import 'package:contact_diary/views/modals/modals.dart';
import 'package:contact_diary/views/screen/contact_add_page.dart';
import 'package:contact_diary/views/screen/contact_detail_page.dart';
import 'package:contact_diary/views/screen/contact_edit_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'views/screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool viewchange = true;
  bool themechange = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      themeMode: themechange ? ThemeMode.dark : ThemeMode.light,
      initialRoute: allroutes.splashscreen,
      routes: {
        allroutes.conaddpage: (context) => const ContactAddPage(),
        allroutes.coneditpage: (context) => const ContactEditpage(),
        allroutes.splashscreen: (context) => const splasescreen(),
        allroutes.condetailpage: (context) => const ContactDetailPage(),
        allroutes.homepage: (context) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Contacts",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        themechange = !themechange;
                      });
                    },
                    icon: Icon(
                      themechange ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        viewchange = !viewchange;
                      });
                    },
                    icon: viewchange ? const Icon(Icons.grid_view) : const Icon(Icons.list),
                  ),
                ],
              ),
              body: viewchange
                  // ListView
                  ? ListView(
                      padding: EdgeInsets.zero,
                      children: List.generate(
                        contacts.allContact.length,
                        (index) => Scrollbar(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 50,
                              foregroundImage: FileImage(contacts.allContact[index].image!),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(allroutes.condetailpage);
                            },
                            title: Text(
                              "${contacts.allContact[index].firstname} ${contacts.allContact[index].lastname}",
                            ),
                            subtitle: Text(
                              "${contacts.allContact[index].Contact}",
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  // GridView
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 2 / 3,
                          crossAxisCount: 3,
                        ),
                        itemCount: contacts.allContact.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(allroutes.condetailpage);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.primaries[index % 18].shade100,
                                    image: DecorationImage(
                                      image: FileImage(contacts.allContact[index].image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "${contacts.allContact[index].firstname}",
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(allroutes.conaddpage);
                  contacts.allContact.length++;
                  setState(() {});
                },
                child: const Icon(Icons.add),
              ),
            ),
      },
    );
  }
}
