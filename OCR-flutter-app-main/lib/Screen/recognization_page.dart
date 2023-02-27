import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter/material.dart';

class RecognizePage extends StatefulWidget {
  final String? path;
  const RecognizePage({Key? key, this.path}) : super(key: key);

  @override
  State<RecognizePage> createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  bool _isBusy = false;

  TextEditingController controller = TextEditingController();

  //get Clipboard => null;

  @override
  void initState() {
    super.initState();

    final InputImage inputImage = InputImage.fromFilePath(widget.path!);

    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("recognized page"),
        actions: [
          IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: controller.text))
                  .then((Value) {
                return ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Text Copied")));
              });
            },
          )
        ],
      ),
      body: _isBusy == true
          ? SingleChildScrollView(
              child: Column(
                  //child: CircularProgressIndicator(),
                  ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    TextField(
                      //expands: true,
                      maxLines: null,
                      //obscureText: true,
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Default TextField',
                      ),
                    ),

                    Row(children: [
                      ElevatedButton(
                          onPressed: () {
                            //controller: controller,
                            Clipboard.setData(
                                    ClipboardData(text: controller.text))
                                .then((Value) {
                              return ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Text Copied")));
                            });
                          },
                          child: const Text("Copy Text")),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 140),
                      //   child: ElevatedButton(
                      //       onPressed: () async {
                      //         // Clipboard.getData(Clipboard.kTextPlain)
                      //         //     .then((value) {
                      //         //   //var mytext;
                      //         //   controller.text = value!.text!;
                      //         // });
                      //       },
                      //       child: Text("Save")),
                      // )
                    ]),
                    // RaisedButton(
                    //   color: Colors.red,
                    //   onPressed: () {},
                    //   child: const Text("Press !!"),
                    // ),
                    const SizedBox(
                      height: 22,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void processImage(InputImage image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    setState(() {
      _isBusy = true;
    });

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    controller.text = recognizedText.text;

    ///End busy state
    setState(() {
      _isBusy = false;
    });
  }
}
