import 'package:flutter/material.dart';
import 'package:ocr/MainPage/Home.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key, required String title}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

// ignore: camel_case_types
class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: //Stack(
            // children: <Widget>[
            //  Container(
            //    height: 1000,
            //    width: MediaQuery.of(context).size.width,
            //    color: Colors.green.withOpacity(0.2),
            //image
            //    child: Image.network(
            //      'https://cdn.pixabay.com/photo/2020/06/13/17/50/milky-way-5295153_960_720.jpg',
            //      fit: BoxFit.cover,
            //    ),
            //  ),
            Stack(
      children: <Widget>[
        // Container(
        //   decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('assets/welcomepage.png'),
        //           fit: BoxFit.cover)),
        // ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Welcome!',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.lightBlue),
              ),
              Container(
                color: Colors.lightBlue,
              ),
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 16),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 9, 187, 83),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                width: 200,
                child: TextButton(
                  child: const Text("Let's Go",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onPressed: () {
                    //navigate to add todo page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const home(
                                  title: '',
                                )));
                  },
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 0, bottom: 12),
              //   decoration: BoxDecoration(
              //     color: Colors.lightBlue,
              //     border: Border.all(color: Colors.lightBlue),
              //     shape: BoxShape.rectangle,
              //     borderRadius: const BorderRadius.all(Radius.circular(50)),
              //   ),
              //   width: 200,
              //   child: FlatButton(
              //     child: const Text('Sign Up',
              //         style: TextStyle(fontSize: 20, color: Colors.white)),
              //     onPressed: () {
              //       // Navigator.push(
              //       //    context,
              //       //    MaterialPageRoute(
              //       //        builder: (context) => const home(
              //       //              title: '',
              //       //            )));
              //     },
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Language : ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'English',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        )
      ],
    ));
    //);
    // return const MaterialApp(
    //   home: Homepage(),
    // );
  }
}
