import 'package:contact_diary/utils/utils_routes_page.dart';
import 'package:contact_diary/views/modals/Global_varibles.dart';
import 'package:contact_diary/views/screen/contact_add_page.dart';
import 'package:contact_diary/views/screen/contact_detail_page.dart';
import 'package:contact_diary/views/screen/contact_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
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
    const MyApp(),
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
                  "Contact",
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
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: allGlobalvar.allContact.length,
                      itemBuilder: (context, index) => Scrollbar(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 50,
                            foregroundImage: FileImage(
                                allGlobalvar.allContact[index].image!),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                allroutes.condetailpage,
                                arguments: index);
                          },
                          title: Text(
                            "${allGlobalvar.allContact[index].firstname} ${allGlobalvar.allContact[index].lastname}",
                          ),
                          subtitle: Text(
                            "+91 ${allGlobalvar.allContact[index].Contact}",
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Uri call = Uri(
                                scheme: 'tel',
                                path: allGlobalvar.allContact[index].Contact,
                              );
                              launchUrl(call);
                            },
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.green,
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
                          childAspectRatio: 2 / 4,
                          crossAxisCount: 2,
                        ),
                        itemCount: allGlobalvar.allContact.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      allroutes.condetailpage,
                                      arguments: index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.primaries[index % 18].shade100,
                                    image: DecorationImage(
                                      image: FileImage(allGlobalvar
                                          .allContact[index].image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Spacer(),
                                        Text(
                                          allGlobalvar
                                              .allContact[index].firstname,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                    Text(
                                      "+91 ${allGlobalvar.allContact[index].Contact}",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  await Navigator.of(context).pushNamed(allroutes.conaddpage);
                  setState(() {});
                },
                child: const Icon(Icons.add),
              ),
            ),
      },
    );
  }
}
