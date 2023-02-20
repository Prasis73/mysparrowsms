// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mysparrowsms/getStorage.dart';
import 'dart:convert';

import 'helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  sendSms() async {
    final response = await http.get(
        Uri.parse("https://cylinder.eachut.com/sendmessage/" +
            "${LoginGetStorage.getAPI()}/" +
            "${fromController.text}/" +
            "${toController.text}/" +
            "${messageController.text}"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          /* 'Authorization': 'Bearer $token', */
        });
    var value = json.decode(response.body);
    print(value["success"]);
    if (value["success"] = true) {
      Helper.DialogueHelper(context, value["message"]);
      messageController.clear();
      toController.clear();
      fromController.clear();
      setState(() {
        isLoading = false;
      });
    } else {
      Helper.DialogueHelper(context, value["message"]);
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController apiController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Sms"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
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
                              "Add Custom API KEY here",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: "IMPACT",
                                  fontSize: 28),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 40),
                            child: SizedBox(
                              width: 165,
                              child: TextFormField(
                                controller: apiController,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  fillColor: Theme.of(context).primaryColor,
                                  hintText: "API KEY",
                                  hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5)),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                GetStorage().write('API', apiController.text);
                                print(LoginGetStorage.getAPI());
                                setState(() {
                                  
                                });
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.done))
                        ],
                      ),
                    );
                  }).then((value) {
                    apiController.clear();
                    setState(() {
                      
                    });
                  });
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 40),
            child: SizedBox(
              width: 165,
              child: TextFormField(
                controller: fromController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).primaryColor),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  fillColor: Theme.of(context).primaryColor,
                  hintText: "From (Name)",
                  hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.5)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 40),
            child: SizedBox(
                width: 165,
                child: TextFormField(
                  controller: toController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18, color: Theme.of(context).primaryColor),
                      keyboardType:TextInputType.phone ,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    fillColor: Theme.of(context).primaryColor,
                    hintText: "Phone NUmber",
                    hintStyle: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.5)),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 40),
            child: SizedBox(
                width: 165,
                child: TextFormField(
                  controller: messageController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18, color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    fillColor: Theme.of(context).primaryColor,
                    hintText: "Write a Message",
                    hintStyle: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.5)),
                  ),
                )),
          ),
          ElevatedButton(
              onPressed: LoginGetStorage.getAPI().toString() == ""
                  ? () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              contentPadding: const EdgeInsets.all(30),
                              backgroundColor:
                                  Theme.of(context).secondaryHeaderColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Add Custom API KEY Here First",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontFamily: "IMPACT",
                                          fontSize: 28),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 40),
                                    child: SizedBox(
                                      width: 165,
                                      child: TextFormField(
                                        controller: apiController,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                Theme.of(context).primaryColor),
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                          fillColor:
                                              Theme.of(context).primaryColor,
                                          hintText: "API KEY",
                                          hintStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.5)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        GetStorage()
                                            .write('API', apiController.text);
                                            setState(() {
                                              
                                            });
                                           
                                            
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.done))
                                ],
                              ),
                            );
                          }).then((value) {
                            apiController.clear();
                            setState(() {
                              
                            });
                          });
                    }
                  : () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        sendSms();
                      }
                    },
              child: isLoading
                  ? const SizedBox(
                    height: 20,width: 20,
                    child: CircularProgressIndicator(color: Colors.white,))
                  : const Text("Send Sms"))
        ]),
      ),
    );
  }
}
