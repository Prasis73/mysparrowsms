import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:get_storage/get_storage.dart';
import 'package:mysparrowsms/utlis/imageView.dart';

import 'utlis/dialogue.dart';
import 'utlis/imageFileView.dart';
import 'utlis/image_utils.dart';

class EmailScreen extends StatefulWidget {
  EmailScreen({
    super.key,
  });

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  bool _isLoading = false;
  String _apiMessage = "";

  File? photo;
  File? photo1;
  File? photo2;
  File? photo3;

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController websiteApplicationController = TextEditingController();
  TextEditingController requirementController = TextEditingController();

  sendMail() async {
    setState(() {
      _apiMessage = "";
      _isLoading = true;
    });

//send mail
    final serviceId = 'service_y519dl3';
    final templateId = 'template_hjk1rij';
    final userId = 'fkSUEudS6hQLPn0tK';
    final accessToken = 'TByGNE7zMmLTxGnMseDTg';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'accessToken': accessToken,
        'user_id': userId,
        'template_params': {
          'reply_to': 'admin@eachut.com',
          'from_name': nameController.text,
          'message':
              "Name:${nameController.text} \nPhone:${phoneController.text} \nNote:${requirementController.text}  \n",
        },
      }),
    );

    print(response.body);

    if (response.body == "OK") {
//set storage
      // final box = GetStorage();

      // String receipt = ReciptDataGetStorage.getReciptData();
      // print(receipt);
      // String addToList =
      //     "Name:${nameController.text} ^^Phone:${phoneController.text} ^^Note:${noteController.text} ^^${widget.image}.png//";
      // String ReciptData = receipt + addToList;
      // // String ReciptData = "";
      // print(ReciptData);

      // ReciptDataGetStorage.setReciptData(ReciptData);

//snackbar
      const snackBar = SnackBar(
        content: Center(
            child: Text(
          'We will contact you soon!!!',
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        )),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pop(context);
    } else {
      setState(() {
        _apiMessage = "";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
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
                                                      fontWeight:
                                                          FontWeight.w900,
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
                                                      fontWeight:
                                                          FontWeight.w900,
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
                                                      fontWeight:
                                                          FontWeight.w900,
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
                                "./assets/sms.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 100, bottom: 30),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 200,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Theme.of(context)
                                            .secondaryHeaderColor
                                            .withOpacity(0.7),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "RS 500",
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "500 Credit",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Sofia_pro",
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 200,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Theme.of(context)
                                            .secondaryHeaderColor
                                            .withOpacity(0.7),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "RS 500",
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "500 Credit",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Sofia_pro",
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 200,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Theme.of(context)
                                            .secondaryHeaderColor
                                            .withOpacity(0.7),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "RS 500",
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "500 Credit",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Sofia_pro",
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                            )
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
                                        child: Text("Purchase Token",
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
                                            "Email us with all required document",
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
                                                begin: AlignmentDirectional
                                                    .topStart,
                                                end: AlignmentDirectional
                                                    .bottomEnd,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              border: Border.all(
                                                width: 1.5,
                                                color: Colors.white
                                                    .withOpacity(0.5),
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
                                                  vertical: 10,
                                                ),
                                                child: ListView(
                                                  padding: EdgeInsets.zero,
                                                  children: <Widget>[
                                                    TextFormField(
                                                      controller:
                                                          nameController,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter your name.';
                                                        }
                                                        return null;
                                                      },
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      keyboardType:
                                                          TextInputType.name,
                                                      decoration:
                                                          const InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.person,
                                                          color: Colors.black,
                                                        ),
                                                        hintStyle: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                        fillColor: Colors.black,
                                                        focusColor:
                                                            Colors.black,
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        hintText:
                                                            'Enter your name',
                                                        labelText: 'Name',
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller:
                                                          phoneController,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter a valid phone number.';
                                                        }
                                                        return null;
                                                      },
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      decoration:
                                                          const InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.phone,
                                                          color: Colors.black,
                                                        ),
                                                        hintStyle: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                        fillColor: Colors.black,
                                                        focusColor:
                                                            Colors.black,
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        hintText:
                                                            'Enter a phone number',
                                                        labelText: 'Phone',
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller:
                                                          emailController,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter a valid email address.';
                                                        }
                                                        return null;
                                                      },
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      decoration:
                                                          const InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.email,
                                                          color: Colors.black,
                                                        ),
                                                        hintStyle: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                        fillColor: Colors.black,
                                                        focusColor:
                                                            Colors.black,
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        hintText:
                                                            'Enter a email address',
                                                        labelText: 'Email',
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller:
                                                          companyNameController,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter a valid company name.';
                                                        }
                                                        return null;
                                                      },
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      decoration:
                                                          const InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.location_city,
                                                          color: Colors.black,
                                                        ),
                                                        hintStyle: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                        fillColor: Colors.black,
                                                        focusColor:
                                                            Colors.black,
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        hintText:
                                                            'Enter your name of company',
                                                        labelText:
                                                            'Company Name',
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller:
                                                          websiteApplicationController,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please provide name or link.';
                                                        }
                                                        return null;
                                                      },
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      decoration:
                                                          const InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.web,
                                                          color: Colors.black,
                                                        ),
                                                        hintStyle: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                        fillColor: Colors.black,
                                                        focusColor:
                                                            Colors.black,
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        hintText:
                                                            'Enter your website or app',
                                                        labelText:
                                                            'Website / Application',
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller:
                                                          requirementController,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter your requirements or note';
                                                        }
                                                        return null;
                                                      },
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.note,
                                                          color: Colors.black,
                                                        ),
                                                        hintStyle: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                        fillColor: Colors.black,
                                                        focusColor:
                                                            Colors.black,
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        hintText:
                                                            'Mention your requirements or write your concern here',
                                                        labelText:
                                                            'Requirement',
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                    const Text(
                                                      "Documents are required",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    ListView(
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      padding: EdgeInsets.zero,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: Theme.of(
                                                                    context)
                                                                .secondaryHeaderColor
                                                                .withOpacity(
                                                                    0.7),
                                                          ),
                                                          child: InkWell(
                                                            onTap: photo != null
                                                                ? () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                ImageFileView(data: photo!)));
                                                                  }
                                                                : () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                            backgroundColor:
                                                                                Theme.of(context).secondaryHeaderColor,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            content:
                                                                                SizedBox(
                                                                              height: 120,
                                                                              child: Column(
                                                                                children: [
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      Navigator.pop(context);
                                                                                      final _res = await ImageUtils.getImageFromCamera(context);
                                                                                      if (_res != null) {
                                                                                        setState(() {
                                                                                          photo = _res;
                                                                                        });
                                                                                      }
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: ListTile(
                                                                                      leading: Icon(
                                                                                        Icons.camera,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                      title: Text(
                                                                                        "Camera",
                                                                                        style: TextStyle(
                                                                                          color: Colors.black,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),

                                                                                  //galleryyy
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      Navigator.pop(context);
                                                                                      final _res = await GalleryUtils.getImageFromGallery(context);
                                                                                      if (_res != null) {
                                                                                        setState(() {
                                                                                          photo = _res;
                                                                                        });
                                                                                      }
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: ListTile(
                                                                                      leading: Icon(
                                                                                        Icons.photo_album,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                      title: Text("Gallery", style: TextStyle(color: Colors.black)),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  },
                                                            child: photo != null
                                                                ? Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                          borderRadius: BorderRadius.circular(
                                                                              30),
                                                                          child:
                                                                              Image.file(
                                                                            photo!,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            height:
                                                                                100,
                                                                            width:
                                                                                300,
                                                                          )),
                                                                      Positioned(
                                                                          right:
                                                                              5,
                                                                          child:
                                                                              IconButton(
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.clear,
                                                                              color: Colors.red,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              setState(() {
                                                                                photo = null;
                                                                              });
                                                                            },
                                                                          ))
                                                                    ],
                                                                  )
                                                                : Row(
                                                                    children: [
                                                                      Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left:
                                                                                  40),
                                                                          child:
                                                                              Icon(Icons.upload)),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 30,
                                                                              right: 30),
                                                                          child:
                                                                              Text(
                                                                            "Add Citizenship Front Image",
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style: TextStyle(
                                                                                fontFamily: "Sofia_pro",
                                                                                color: Colors.black,
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          width: 150,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: Theme.of(
                                                                    context)
                                                                .secondaryHeaderColor
                                                                .withOpacity(
                                                                    0.7),
                                                          ),
                                                          child: InkWell(
                                                            onTap:
                                                                photo1 != null
                                                                    ? () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => ImageFileView(data: photo1!)));
                                                                      }
                                                                    : () {
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return AlertDialog(
                                                                                backgroundColor: Theme.of(context).secondaryHeaderColor,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                ),
                                                                                content: SizedBox(
                                                                                  height: 120,
                                                                                  child: Column(
                                                                                    children: [
                                                                                      InkWell(
                                                                                        onTap: () async {
                                                                                          Navigator.pop(context);
                                                                                          final _res = await ImageUtils.getImageFromCamera(context);
                                                                                          if (_res != null) {
                                                                                            setState(() {
                                                                                              photo1 = _res;
                                                                                            });
                                                                                          }
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: ListTile(
                                                                                          leading: Icon(
                                                                                            Icons.camera,
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                          title: Text(
                                                                                            "Camera",
                                                                                            style: TextStyle(
                                                                                              color: Colors.black,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),

                                                                                      //galleryyy
                                                                                      InkWell(
                                                                                        onTap: () async {
                                                                                          Navigator.pop(context);
                                                                                          final _res = await GalleryUtils.getImageFromGallery(context);
                                                                                          if (_res != null) {
                                                                                            setState(() {
                                                                                              photo1 = _res;
                                                                                            });
                                                                                          }
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: ListTile(
                                                                                          leading: Icon(
                                                                                            Icons.photo_album,
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                          title: Text("Gallery", style: TextStyle(color: Colors.black)),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            });
                                                                      },
                                                            child:
                                                                photo1 != null
                                                                    ? Stack(
                                                                        children: [
                                                                          ClipRRect(
                                                                              borderRadius: BorderRadius.circular(30),
                                                                              child: Image.file(
                                                                                photo1!,
                                                                                fit: BoxFit.cover,
                                                                                height: 100,
                                                                                width: 300,
                                                                              )),
                                                                          Positioned(
                                                                              right: 5,
                                                                              child: IconButton(
                                                                                icon: const Icon(
                                                                                  Icons.clear,
                                                                                  color: Colors.red,
                                                                                ),
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    photo1 = null;
                                                                                  });
                                                                                },
                                                                              ))
                                                                        ],
                                                                      )
                                                                    : Row(
                                                                        children: [
                                                                          Padding(
                                                                              padding: const EdgeInsets.only(left: 40),
                                                                              child: Icon(Icons.upload)),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(left: 30, right: 30),
                                                                              child: Text(
                                                                                "Add Citizenship Back Image",
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(fontFamily: "Sofia_pro", color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          width: 150,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: Theme.of(
                                                                    context)
                                                                .secondaryHeaderColor
                                                                .withOpacity(
                                                                    0.7),
                                                          ),
                                                          child: InkWell(
                                                            onTap:
                                                                photo2 != null
                                                                    ? () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => ImageFileView(data: photo2!)));
                                                                      }
                                                                    : () {
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return AlertDialog(
                                                                                backgroundColor: Theme.of(context).secondaryHeaderColor,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                ),
                                                                                content: SizedBox(
                                                                                  height: 120,
                                                                                  child: Column(
                                                                                    children: [
                                                                                      InkWell(
                                                                                        onTap: () async {
                                                                                          Navigator.pop(context);
                                                                                          final _res = await ImageUtils.getImageFromCamera(context);
                                                                                          if (_res != null) {
                                                                                            setState(() {
                                                                                              photo2 = _res;
                                                                                            });
                                                                                          }
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: ListTile(
                                                                                          leading: Icon(
                                                                                            Icons.camera,
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                          title: Text(
                                                                                            "Camera",
                                                                                            style: TextStyle(
                                                                                              color: Colors.black,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),

                                                                                      //galleryyy
                                                                                      InkWell(
                                                                                        onTap: () async {
                                                                                          Navigator.pop(context);
                                                                                          final _res = await GalleryUtils.getImageFromGallery(context);
                                                                                          if (_res != null) {
                                                                                            setState(() {
                                                                                              photo2 = _res;
                                                                                            });
                                                                                          }
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: ListTile(
                                                                                          leading: Icon(
                                                                                            Icons.photo_album,
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                          title: Text("Gallery", style: TextStyle(color: Colors.black)),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            });
                                                                      },
                                                            child:
                                                                photo2 != null
                                                                    ? Stack(
                                                                        children: [
                                                                          ClipRRect(
                                                                              borderRadius: BorderRadius.circular(30),
                                                                              child: Image.file(
                                                                                photo2!,
                                                                                fit: BoxFit.cover,
                                                                                height: 100,
                                                                                width: 300,
                                                                              )),
                                                                          Positioned(
                                                                              right: 5,
                                                                              child: IconButton(
                                                                                icon: const Icon(
                                                                                  Icons.clear,
                                                                                  color: Colors.red,
                                                                                ),
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    photo2 = null;
                                                                                  });
                                                                                },
                                                                              ))
                                                                        ],
                                                                      )
                                                                    : Row(
                                                                        children: [
                                                                          Padding(
                                                                              padding: const EdgeInsets.only(left: 40),
                                                                              child: Icon(Icons.upload)),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(left: 30, right: 30),
                                                                              child: Text(
                                                                                "Add Company Registration Image",
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(fontFamily: "Sofia_pro", color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          width: 150,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: Theme.of(
                                                                    context)
                                                                .secondaryHeaderColor
                                                                .withOpacity(
                                                                    0.7),
                                                          ),
                                                          child: InkWell(
                                                            onTap:
                                                                photo3 != null
                                                                    ? () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => ImageFileView(data: photo3!)));
                                                                      }
                                                                    : () {
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return AlertDialog(
                                                                                backgroundColor: Theme.of(context).secondaryHeaderColor,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                ),
                                                                                content: SizedBox(
                                                                                  height: 120,
                                                                                  child: Column(
                                                                                    children: [
                                                                                      InkWell(
                                                                                        onTap: () async {
                                                                                          Navigator.pop(context);
                                                                                          final _res = await ImageUtils.getImageFromCamera(context);
                                                                                          if (_res != null) {
                                                                                            setState(() {
                                                                                              photo3 = _res;
                                                                                            });
                                                                                          }
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: ListTile(
                                                                                          leading: Icon(
                                                                                            Icons.camera,
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                          title: Text(
                                                                                            "Camera",
                                                                                            style: TextStyle(
                                                                                              color: Colors.black,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),

                                                                                      //galleryyy
                                                                                      InkWell(
                                                                                        onTap: () async {
                                                                                          Navigator.pop(context);
                                                                                          final _res = await GalleryUtils.getImageFromGallery(context);
                                                                                          if (_res != null) {
                                                                                            setState(() {
                                                                                              photo3 = _res;
                                                                                            });
                                                                                          }
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: ListTile(
                                                                                          leading: Icon(
                                                                                            Icons.photo_album,
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                          title: Text("Gallery", style: TextStyle(color: Colors.black)),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            });
                                                                      },
                                                            child:
                                                                photo3 != null
                                                                    ? Stack(
                                                                        children: [
                                                                          ClipRRect(
                                                                              borderRadius: BorderRadius.circular(30),
                                                                              child: Image.file(
                                                                                photo3!,
                                                                                fit: BoxFit.cover,
                                                                                height: 100,
                                                                                width: 300,
                                                                              )),
                                                                          Positioned(
                                                                              right: 5,
                                                                              child: IconButton(
                                                                                icon: const Icon(
                                                                                  Icons.clear,
                                                                                  color: Colors.red,
                                                                                ),
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    photo3 = null;
                                                                                  });
                                                                                },
                                                                              ))
                                                                        ],
                                                                      )
                                                                    : Row(
                                                                        children: [
                                                                          Padding(
                                                                              padding: const EdgeInsets.only(left: 40),
                                                                              child: Icon(Icons.upload)),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(left: 30, right: 30),
                                                                              child: Text(
                                                                                "Add Company PAN/VAT Image",
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(fontFamily: "Sofia_pro", color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: _isLoading
                                                          ? () {}
                                                          : () async {
                                                              print("object2");
                                                              setState(() {
                                                                _apiMessage =
                                                                    "";
                                                              });
                                                              if (_formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                var connectivityResult =
                                                                    await (Connectivity()
                                                                        .checkConnectivity());
                                                                if (connectivityResult ==
                                                                        ConnectivityResult
                                                                            .mobile ||
                                                                    connectivityResult ==
                                                                        ConnectivityResult
                                                                            .wifi) {
                                                                  sendMail();
                                                                } else {
                                                                  print(
                                                                      "no wifi");
                                                                  const snackBar =
                                                                      SnackBar(
                                                                    content:
                                                                        Center(
                                                                            child:
                                                                                Text(
                                                                      "No Internet Connection",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blueGrey,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )),
                                                                  );
                                                                }
                                                              }
                                                            },
                                                      child: Container(
                                                        height: 50,
                                                        width: 180,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255, 63, 86, 98),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          63,
                                                                          86,
                                                                          98)
                                                                  .withOpacity(
                                                                      0.2),
                                                              spreadRadius: 1,
                                                              blurRadius: 2,
                                                              offset: Offset(0,
                                                                  1), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "Send"
                                                                .toUpperCase(),
                                                            style: GoogleFonts.lato(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headlineSmall,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .grey[50]),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
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
              left: 30,
              top: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFFFECAF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}