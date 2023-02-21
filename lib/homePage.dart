// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mysparrowsms/getStorage.dart';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  sendSms() async {
    final response = await http.get(
        // ignore: prefer_interpolation_to_compose_strings
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
    print("dajkgsfuyadsbivfuydsavf");
    print(value);
    if (value["success"] = true) {
      Helper.DialogueHelper(context, value["message"]);
      messageController.clear();
      // toController.clear();
      // fromController.clear();
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onDoubleTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                content: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white.withOpacity(0.8),
                                        Colors.white.withOpacity(0.7),
                                      ],
                                      begin: AlignmentDirectional.topStart,
                                      end: AlignmentDirectional.bottomEnd,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                      width: 1.5,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(38.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("Developer",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.comfortaa(
                                                textStyle: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromARGB(
                                                        255, 37, 0, 0)),
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: Text("Roshan Sah",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.comfortaa(
                                                textStyle: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromARGB(
                                                        255, 37, 0, 0)),
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                          child: Text("Prasis Rijal",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.comfortaa(
                                                textStyle: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromARGB(
                                                        255, 37, 0, 0)),
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).then((value) {
                          setState(() {});
                        });
                      },
                      child: SizedBox(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "./assets/sms.png",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Image.asset(
                              "./assets/sms.png",
                              fit: BoxFit.cover,
                            )),
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 20),
                            child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withOpacity(0.2),
                                      Colors.white.withOpacity(0.4),
                                    ],
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                ),
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Sparrow sms",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.comfortaa(
                                            textStyle: const TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.w900,
                                                color: Color.fromARGB(
                                                    255, 37, 0, 0)),
                                          )),
                                    )),
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "Send message using sparrow message api",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.comfortaa(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Color.fromARGB(
                                                    255, 37, 0, 0)),
                                          )),
                                    )),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 15, sigmaY: 20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.white.withOpacity(0.2),
                                                Colors.white.withOpacity(0.4),
                                              ],
                                              begin:
                                                  AlignmentDirectional.topStart,
                                              end: AlignmentDirectional
                                                  .bottomEnd,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            border: Border.all(
                                              width: 1.5,
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                            ),
                                          ),
                                          height: 355,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 0),
                                              child: Form(
                                                key: _formKey,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextFormField(
                                                        controller:
                                                            fromController,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Required';
                                                          }
                                                          return null;
                                                        },
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: GoogleFonts
                                                            .comfortaa(
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        maxLength: 50,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          enabledBorder:
                                                              const UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                          focusedBorder:
                                                              const UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                          fillColor:
                                                              Colors.black,
                                                          prefixIconColor:
                                                              Colors.black,
                                                          prefixIcon:
                                                              const Icon(Icons
                                                                  .contacts),
                                                          labelText: 'From',
                                                          labelStyle:
                                                              GoogleFonts
                                                                  .comfortaa(
                                                            textStyle:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                          hintText: "Name",
                                                          focusColor:
                                                              Colors.black,
                                                          hintStyle: GoogleFonts
                                                              .comfortaa(
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5)),
                                                          ),
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        maxLength: 10,
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          // for below version 2 use this
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                          // for version 2 and greater youcan also use this
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        controller:
                                                            toController,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Required';
                                                          }
                                                          return null;
                                                        },
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: GoogleFonts
                                                            .comfortaa(
                                                          textStyle:
                                                              const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        keyboardType:
                                                            TextInputType.phone,
                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder:
                                                              const UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                          counterText: "",
                                                          focusedBorder:
                                                              const UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                          fillColor:
                                                              Colors.black,
                                                          labelText: 'To',
                                                          labelStyle:
                                                              GoogleFonts
                                                                  .comfortaa(
                                                            textStyle:
                                                                GoogleFonts
                                                                    .comfortaa(
                                                              textStyle:
                                                                  const TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                            ),
                                                          ),
                                                          hintText:
                                                              "Phone Number",
                                                          prefixIconColor:
                                                              Colors.black,
                                                          prefixIcon:
                                                              const Icon(
                                                                  Icons.phone),
                                                          hintStyle: GoogleFonts
                                                              .comfortaa(
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5)),
                                                          ),
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            messageController,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Required';
                                                          }
                                                          return null;
                                                        },
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: GoogleFonts
                                                            .comfortaa(
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        maxLength: 500,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          enabledBorder:
                                                              const UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                          focusedBorder:
                                                              const UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                          fillColor:
                                                              Colors.black,
                                                          labelText: 'SMS',
                                                          labelStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                          hintText: "Message",
                                                          prefixIconColor:
                                                              Colors.black,
                                                          prefixIcon:
                                                              const Icon(
                                                                  Icons.sms),
                                                          hintStyle: GoogleFonts
                                                              .comfortaa(
                                                            textStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      InkWell(
                                                          onTap: LoginGetStorage
                                                                          .getAPI()
                                                                      .toString() ==
                                                                  ""
                                                              ? () {
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          content:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Colors.white.withOpacity(0.8),
                                                                                  Colors.white.withOpacity(0.7),
                                                                                ],
                                                                                begin: AlignmentDirectional.topStart,
                                                                                end: AlignmentDirectional.bottomEnd,
                                                                              ),
                                                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                              border: Border.all(
                                                                                width: 1.5,
                                                                                color: Colors.white.withOpacity(0.8),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(30.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: Alignment.topLeft,
                                                                                    child: Text("Add Custom API KEY provided by sparrow sms",
                                                                                        textAlign: TextAlign.left,
                                                                                        style: GoogleFonts.comfortaa(
                                                                                          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 37, 0, 0)),
                                                                                        )),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 20,
                                                                                  ),
                                                                                  TextFormField(
                                                                                    controller: apiController,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: GoogleFonts.comfortaa(
                                                                                      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 37, 0, 0)),
                                                                                    ),
                                                                                    decoration: InputDecoration(
                                                                                      enabledBorder: const UnderlineInputBorder(
                                                                                        borderSide: BorderSide(color: Colors.black),
                                                                                      ),
                                                                                      focusedBorder: const UnderlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.black,
                                                                                        ),
                                                                                      ),
                                                                                      fillColor: Colors.black,
                                                                                      hintText: "Token",
                                                                                      hintStyle: GoogleFonts.comfortaa(textStyle: TextStyle(color: Colors.black.withOpacity(0.5))),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 19,
                                                                                  ),
                                                                                  IconButton(
                                                                                      onPressed: () {
                                                                                        GetStorage().write('API', apiController.text);

                                                                                        setState(() {});
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      icon: const Icon(Icons.done_rounded))
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }).then((value) {
                                                                    apiController
                                                                        .clear();
                                                                    setState(
                                                                        () {});
                                                                  });
                                                                }
                                                              : () async {
                                                                  if (_formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    setState(
                                                                        () {
                                                                      isLoading =
                                                                          true;
                                                                    });
                                                                    var connectivityResult =
                                                                        await (Connectivity()
                                                                            .checkConnectivity());
                                                                    if (connectivityResult ==
                                                                            ConnectivityResult
                                                                                .mobile ||
                                                                        connectivityResult ==
                                                                            ConnectivityResult.wifi) {
                                                                      sendSms();
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        isLoading =
                                                                            false;
                                                                      });
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              SnackBar(
                                                                        content:
                                                                            Text("No Internet Connection"),
                                                                      ));
                                                                    }
                                                                  }
                                                                },
                                                          child: ClipRRect(
                                                              child:
                                                                  BackdropFilter(
                                                                      filter: ImageFilter.blur(
                                                                          sigmaX:
                                                                              15,
                                                                          sigmaY:
                                                                              20),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Colors.white.withOpacity(0.8),
                                                                              Colors.white.withOpacity(0.7),
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional.topStart,
                                                                            end:
                                                                                AlignmentDirectional.bottomEnd,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.all(Radius.circular(10)),
                                                                          border:
                                                                              Border.all(
                                                                            width:
                                                                                1.5,
                                                                            color:
                                                                                Colors.white.withOpacity(0.5),
                                                                          ),
                                                                        ),
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            150,
                                                                        child:
                                                                            Center(
                                                                          child: isLoading
                                                                              ? LoadingAnimationWidget.hexagonDots(
                                                                                  color: Colors.black.withOpacity(0.7),
                                                                                  size: 30,
                                                                                )
                                                                              : Text("Send SMS",
                                                                                  textAlign: TextAlign.center,
                                                                                  style: GoogleFonts.comfortaa(
                                                                                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 37, 0, 0)),
                                                                                  )),
                                                                        ),
                                                                      )))),
                                                      const SizedBox(
                                                        height: 15,
                                                      )
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 50,
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.8),
                                Colors.white.withOpacity(0.7),
                              ],
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 1.5,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "Add Custom API KEY provided by sparrow sms",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                            color:
                                                Color.fromARGB(255, 37, 0, 0)),
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: apiController,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.comfortaa(
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromARGB(255, 37, 0, 0)),
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    fillColor: Colors.black,
                                    hintText: "Token",
                                    hintStyle: GoogleFonts.comfortaa(
                                        textStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                IconButton(
                                    onPressed: () {
                                      GetStorage()
                                          .write('API', apiController.text);

                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.done_rounded))
                              ],
                            ),
                          ),
                        ),
                      );
                    }).then((value) {
                  apiController.clear();
                  setState(() {});
                });
              },
              icon: const Icon(
                Icons.api,
                color: Color(0xFFFFECAF),
              ),
            ),
          )
        ],
      ),
    );
  }
}
