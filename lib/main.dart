import 'package:contact_diary/utils/image_utils.dart';
import 'package:contact_diary/utils/utils_routes_page.dart';
import 'package:contact_diary/views/modals/Global_varibles.dart';
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
  int n = 1;
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
        allroutes.homepage: (context) =>
            Scaffold(
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
                      themechange
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        viewchange = !viewchange;
                      });
                    },
                    icon: viewchange
                        ? const Icon(Icons.grid_view)
                        : const Icon(Icons.list),
                  ),
                ],
              ),
              body: viewchange
              // ListView
                  ? ListView(
                padding: EdgeInsets.zero,
                children: List.generate(
                  n,
                      (index) =>
                      Scrollbar(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 50,
                            foregroundImage: NetworkImage(
                                imagenet[index % imagenet.length]),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(allroutes.condetailpage);
                          },
                          title: Text(
                            "${allGlobalvar.listofFname[allGlobalvar.listofFname
                                .length - 1]} ${allGlobalvar
                                .listofLname[allGlobalvar.listofLname.length -
                                1]}",
                          ),
                          subtitle: Text(
                            "${allGlobalvar.listofPnumber[allGlobalvar
                                .listofPnumber.length - 1]}",
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
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 2 / 3,
                    crossAxisCount: 3,
                  ),
                  itemCount: n,
                  itemBuilder: (context, index) =>
                      Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(allroutes.condetailpage);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                  Colors.primaries[index % 18].shade100,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imagenet[index % imagenet.length],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              // decoration: BoxDecoration(
                              //   // color: Colors.primaries[index % 18].shade500,
                              //   color: Colors.transparent.withOpacity(0.1),
                              // ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Text(
                                    "${allGlobalvar.listofFname[allGlobalvar
                                        .listofFname.length - 1]} ${allGlobalvar
                                        .listofLname[allGlobalvar.listofLname
                                        .length - 1]}\n${allGlobalvar
                                        .listofPnumber[allGlobalvar
                                        .listofPnumber.length - 1]}",
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
                  setState(() {
                    n++;
                    Navigator.of(context).pushNamed(allroutes.conaddpage);
                  });
                },
                child: const Icon(Icons.add),
              ),
            ),
      },
    );
  }
}
