// ignore_for_file: camel_case_types

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sparrowsms/model/tokenRequestWeb_model.dart';

import 'utlis/apiServices.dart';

class testPage extends StatefulWidget {
  const testPage({super.key});

  @override
  State<testPage> createState() => _testPageState();
}

class _testPageState extends State<testPage> {
  FilePickerResult? result;
  late List<int> result1;
  String? extension1;

  senddddd() {
    TokenRequestModalWeb tokenRequestModalWeb = TokenRequestModalWeb(
      name: "tdyhrt",
      phone: "fdgdfg",
      email: "dfsgsdfds",
      companyName: "companyNameController.text",
      websiteApplication: "websiteApplicationController.text",
      requirement: "requirementController.text",
      citizenImageFront: result1,
      citizenImageBack: result1,
      companyRegistration: result1,
      companyPanVat: result1,
      citizenImageFrontExt: extension1,
      citizenImageBackExt: extension1,
      companyRegistrationExt: extension1,
      companyPanVatExt: extension1,
    );
    ApiService.addTokenRequestWeb(tokenRequestModalWeb).then((value) {
      if (value["success"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
              child: Text(
            "Mail Send Success. We will contact you soon",
            style: GoogleFonts.comfortaa(
              textStyle: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )),
        ));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(30),
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Theme.of(context).primaryColor),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email NOT SENT",
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: "IMPACT",
                              fontSize: 48),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "_apiMessage",
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: "Sofia Pro",
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            width: 85,
                            height: 85,
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Icon(
                              Icons.cancel,
                              color: Theme.of(context).secondaryHeaderColor,
                            )),
                      ),
                    ),
                  ],
                ),
              );
            });
      }
    });
  }

// if (result != null) {
//   File file = File(result.files.single.path);
// } else {
//   // User canceled the picker
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Text(
        //   result1.toString(),
        //   style: TextStyle(color: Colors.white),
        // ),
        const SizedBox(
          height: 50,
        ),
        Center(
            child: TextButton(
                onPressed: () async {
                  result = await FilePicker.platform.pickFiles();
                  setState(() {
                    result1 = result!.files[0].bytes as List<int>;
                    extension1 = result!.files[0].extension;
                  });
                },
                child: const Text("UPLOAD"))),
        Center(
            child: TextButton(
                onPressed: () async {
                  senddddd();
                },
                child: const Text("hitAPI")))
      ]),
    );
  }
}
