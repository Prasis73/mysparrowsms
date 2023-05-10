// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sparrowsms/getStorage.dart';

import 'Email.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isLoading = false;
  bool tokenEmpty = false;
  String responseMessage = "";
  String credits_available = "";
  String credits_consumed = "";
  String last_balance_added = "";
  String minimum_credit = "";

  final _formKey = GlobalKey<FormState>();
  TextEditingController tokenController = TextEditingController();

  @override
  void initState() {
    super.initState();
    GetSetStorage.getAPI() == ""
        ? setState(() {
            tokenEmpty = true;
          })
        : smsToken();
  }

//fetch remaining sms using token
  smsToken() async {
    if (GetSetStorage.getAPI() == "") {
      setState(() {
        tokenEmpty = true;
      });
    } else {
      setState(() {
        tokenEmpty = false;
      });
      String sparrowsmsToken = GetSetStorage.getAPI();
      final url =
          Uri.parse("https://cylinder.eachut.com/smsCount/$sparrowsmsToken");
// v2_wbHmPaUlRGhmhkTMeY1tztQhsY3.BoR5
      final response = await http.get(
        url,
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
      );

      var data = jsonDecode(response.body);
      if (data["data"]["response_code"] == 200) {
        setState(() {
          _isLoading = false;
          credits_available = data["data"]["credits_available"].toString();
          credits_consumed = data["data"]["credits_consumed"].toString();
          last_balance_added = data["data"]["last_balance_added"].toString();
          minimum_credit = data["data"]["minimum_credit"].toString();
        });
      } else {
        setState(() {
          _isLoading = false;
          tokenEmpty = true;
          responseMessage = data["data"]["response"].toString();
          tokenController.clear();
        });
        GetSetStorage.setAPI("");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 230, 196),
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
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "./assets/sms_banner.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "./assets/sms_banner.jpg",
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
                                      child: Text("Token",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.comfortaa(
                                            textStyle: const TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w900,
                                              color:
                                                  Color.fromARGB(255, 37, 0, 0),
                                            ),
                                          )),
                                    )),
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          tokenEmpty
                                              ? "Provide token and see details"
                                              : "See credit information",
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
                                          child: Form(
                                            key: _formKey,
                                            child: Center(
                                              child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 40,
                                                    vertical: 10,
                                                  ),
                                                  child: _isLoading
                                                      ? LoadingAnimationWidget
                                                          .hexagonDots(
                                                          color: Colors.white
                                                              .withOpacity(0.7),
                                                          size: 25,
                                                        )
                                                      : tokenEmpty
                                                          ? ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              children: <
                                                                  Widget>[
                                                                TextFormField(
                                                                  controller:
                                                                      tokenController,
                                                                  validator:
                                                                      (value) {
                                                                    if (value!
                                                                            .isEmpty ||
                                                                        value.length <=
                                                                            10) {
                                                                      return 'Please enter your sparrow sms token.';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.black),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.black),
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .token,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    hintStyle:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    fillColor:
                                                                        Colors
                                                                            .black,
                                                                    focusColor:
                                                                        Colors
                                                                            .black,
                                                                    labelStyle:
                                                                        TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                    hintText:
                                                                        'Enter your sparrow sms token',
                                                                    labelText:
                                                                        'Sparrow sms token',
                                                                  ),
                                                                ),
                                                                responseMessage ==
                                                                        ""
                                                                    ? const SizedBox()
                                                                    : Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8),
                                                                        child:
                                                                            Text(
                                                                          responseMessage,
                                                                          style:
                                                                              GoogleFonts.comfortaa(
                                                                            textStyle:
                                                                                const TextStyle(color: Colors.redAccent),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Colors
                                                                            .white
                                                                            .withOpacity(0.8),
                                                                        Colors
                                                                            .white
                                                                            .withOpacity(0.7),
                                                                      ],
                                                                      begin: AlignmentDirectional
                                                                          .topStart,
                                                                      end: AlignmentDirectional
                                                                          .bottomEnd,
                                                                    ),
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width:
                                                                          1.5,
                                                                      color: Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.5),
                                                                    ),
                                                                  ),
                                                                  height: 50,
                                                                  width: 150,
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        responseMessage =
                                                                            "";
                                                                      });
                                                                      if (_formKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        String
                                                                            tokenInput =
                                                                            tokenController.text;
                                                                        GetSetStorage.setAPI(
                                                                            tokenInput);
                                                                        smsToken();
                                                                        setState(
                                                                            () {
                                                                          _isLoading =
                                                                              true;
                                                                          tokenEmpty =
                                                                              false;
                                                                        });
                                                                      }
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          "Add Token",
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          style:
                                                                              GoogleFonts.comfortaa(
                                                                            textStyle: const TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w900,
                                                                                color: Color.fromARGB(255, 37, 0, 0)),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Center(
                                                                    child: RichText(
                                                                        text: TextSpan(children: [
                                                                  TextSpan(
                                                                      text:
                                                                          "dont have Token?",
                                                                      style: GoogleFonts
                                                                          .comfortaa(
                                                                        textStyle: const TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight: FontWeight
                                                                                .w900,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                37,
                                                                                0,
                                                                                0)),
                                                                      )),
                                                                  WidgetSpan(
                                                                      child:
                                                                          InkWell(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => const EmailScreen()));
                                                                    },
                                                                    child: Text(
                                                                        " Request here",
                                                                        style: GoogleFonts
                                                                            .comfortaa(
                                                                          textStyle: const TextStyle(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w900,
                                                                              color: Colors.redAccent),
                                                                        )),
                                                                  ))
                                                                ]))),
                                                              ],
                                                            )
                                                          : Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "Credits available : $credits_available",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: GoogleFonts
                                                                      .comfortaa(
                                                                    textStyle: const TextStyle(
                                                                        fontFamily:
                                                                            "Sofia_pro",
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Text(
                                                                  "Credits consumed : $credits_consumed",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: GoogleFonts
                                                                      .comfortaa(
                                                                    textStyle: const TextStyle(
                                                                        fontFamily:
                                                                            "Sofia_pro",
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                    "last balance added : $last_balance_added",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: GoogleFonts
                                                                        .comfortaa(
                                                                      textStyle: const TextStyle(
                                                                          fontFamily:
                                                                              "Sofia_pro",
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    )),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  "minimum credit : $minimum_credit",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: GoogleFonts
                                                                      .comfortaa(
                                                                    textStyle: const TextStyle(
                                                                        fontFamily:
                                                                            "Sofia_pro",
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 25,
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Colors
                                                                            .white
                                                                            .withOpacity(0.8),
                                                                        Colors
                                                                            .white
                                                                            .withOpacity(0.7),
                                                                      ],
                                                                      begin: AlignmentDirectional
                                                                          .topStart,
                                                                      end: AlignmentDirectional
                                                                          .bottomEnd,
                                                                    ),
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width:
                                                                          1.5,
                                                                      color: Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.5),
                                                                    ),
                                                                  ),
                                                                  height: 50,
                                                                  width: 150,
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      GetSetStorage
                                                                          .setAPI(
                                                                              "");

                                                                      setState(
                                                                          () {
                                                                        tokenEmpty =
                                                                            true;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          "Remove Token",
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          style:
                                                                              GoogleFonts.comfortaa(
                                                                            textStyle: const TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w900,
                                                                                color: Color.fromARGB(255, 37, 0, 0)),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )),
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
            left: 30,
            top: 50,
            child: IconButton(
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 50,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmailScreen()));
              },
              icon: const Icon(
                Icons.card_giftcard_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
