import 'package:flutter/material.dart';
import 'package:ocr/MainPage/RecognitionPage/recognition.dart';

class home extends StatefulWidget {
  const home({Key? key, required String title}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                enabled: true,
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text('Share'),
                        //           child: InkWell(
                        //               onTap: () {
                        //                 Navigator.of(context);
                        //                 Navigator.push(
                        //                     context,
                        //                     // MaterialPageRoute(
                        //                     //     builder: (context) => const Setting()));
                        //               },
                        //               child: const Text('Setting'))
                      ),
                    ])
          ],

          title: const Text(
            "Home",
          ),
          //controller: controller,
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Recognizer', icon: Icon(Icons.scanner_sharp)),
              //Tab(text: 'Translator', icon: Icon(Icons.translate_sharp)),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 220, 237, 246),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("Bapi Mandal"),
                accountEmail: Text(" bapimandal12340@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blue.shade300,
                  child: const Text("BM"),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
        ),

        body: const TabBarView(
          //controller: controller,
          children: [
            recognition(),
            //translator(),
            //Center(child: Text('Recognition'),),
            //Center(child: Text('Translate'),),
          ],
        ),
        //floatingActionButton: FloatingActionButton(
        //  child: const Icon(Icons.add, size: 32),
        //  onPressed: () {
        //    Navigator.push(
        //       context,
        //        MaterialPageRoute(
        //            builder: (context) => const MyHomePage(
        //                  title: '',
        //                )));
        //    controller.animateTo(1);
        //  },
      ),
    );
    //);
  }
}
