import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

// ignore: camel_case_types
class translator extends StatefulWidget {
  const translator({Key? key}) : super(key: key);

  @override
  State<translator> createState() => _translatorState();
}

// ignore: camel_case_types
class _translatorState extends State<translator> {
  GoogleTranslator translator = GoogleTranslator();

  String? out;
  final lang = TextEditingController(); //getting text

  void trans() {
    translator
        .translate(lang.text, to: 'hi') //translating to hi = hindi
        .then((output) {
      setState(() {
        out = output
            as String; //placing the translated text to the String to be used
      });
      print(out);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.lightBlue.shade100,

          // ignore: prefer_const_constructors
          child: Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: lang,
                  ),
                  ElevatedButton(
                    //child: Colors.red,
                    child: Text(
                        "Press !!"), //on press to translate the language using function
                    onPressed: () {
                      trans();
                    },
                  ),
                  Text(out.toString()) //translated string
                ],
              )),

          // child: Text(
          //   'translator',
          //   style: TextStyle(
          //       fontSize: 32,
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold),
          // ),
          //   children: <Widget>[
          //     TextField(
          //       controller: lang,
          //     ),
          //     RaisedButton(
          //       color: Colors.blue,
          //       child: const Text(
          //           "Press !!"), //on press to translate the language using function
          //       onPressed: () {
          //         trans();
          //       },
          //     ),
          //     Text(out.toString()) //translated string
          //   ],
          // )
          //  ),
          // ),
          // floatingActionButton: FloatingActionButton(
          //   child: const Icon(Icons.g_translate_sharp, size: 32),
          //   onPressed: () {},
        ),
      );
}
