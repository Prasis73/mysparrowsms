// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:io';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'model/tokenRequest_model.dart';
import 'utlis/apiServices.dart';
import 'utlis/imageFileView.dart';
import 'utlis/image_utils.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({
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

//using pub for ios and android only
  /* sendEmail() async {
    // Note that using a username and password for gmail only works if
    // you have two-factor authentication enabled and created an App password.
    // Search for "gmail app password 2fa"
    // The alternative is to use oauth.
    String username = 'roshansah729@gmail.com';
    String password = 'eohdnghabjcahzyt';

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Sparrow SMS')
      ..recipients.add('admin@eachut.com')
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>"
      ..attachments = [
        if (photo != null)
          FileAttachment(photo!)
            ..location = Location.inline
            ..cid = '<CitizenFront@3.141>',
        if (photo1 != null)
          FileAttachment(photo1!)
            ..location = Location.inline
            ..cid = '<CitizenBack@3.141>',
        if (photo2 != null)
          FileAttachment(photo2!)
            ..location = Location.inline
            ..cid = '<CompanyRegistration@3.141>',
        if (photo3 != null)
          FileAttachment(photo3!)
            ..location = Location.inline
            ..cid = '<CompanyPANvat@3.141>'
      ];

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    // DONE
  }
 */

//sending mail using api
  sendMailApi() async {
    setState(() {
      _isLoading = true;
    });
    TokenRequestModal tokenRequestModal = TokenRequestModal(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      companyName: companyNameController.text,
      websiteApplication: websiteApplicationController.text,
      requirement: requirementController.text,
      citizenImageFront: photo,
      citizenImageBack: photo1,
      companyRegistration: photo2,
      companyPanVat: photo3,
    );
    ApiService.addTokenRequest(tokenRequestModal).then((value) {
      if (value["success"] == true) {
        setState(() {
          _isLoading = false;
          nameController.clear();
          phoneController.clear();
          emailController.clear();
          companyNameController.clear();
          websiteApplicationController.clear();
          requirementController.clear();
          photo = null;
          photo1 = null;
          photo2 = null;
          photo3 = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Center(
              child: Text(
            "Mail Send Success. We will contact you soon",
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: "IMPACT",
                            fontSize: 48),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _apiMessage,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: "Sofia Pro",
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
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
        setState(() {
          _isLoading = false;
        });
      }
    });
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
                                "./assets/sms_banner.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 100, bottom: 30),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  const SizedBox(
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
                                        children: const [
                                          Text(
                                            "RS 1300",
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "1000 Credit",
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
                                  const SizedBox(
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
                                        children: const [
                                          Text(
                                            "RS 6000",
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "5000 Credit",
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
                                  const SizedBox(
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
                                        children: const [
                                          Text(
                                            "RS 11000",
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "10000 Credit",
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
                                  const SizedBox(
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
                                                      style: const TextStyle(
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
                                                        icon: Icon(
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
                                                      style: const TextStyle(
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
                                                        icon: Icon(
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
                                                      style: const TextStyle(
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
                                                        icon: Icon(
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
                                                      style: const TextStyle(
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
                                                        icon: Icon(
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
                                                      style: const TextStyle(
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
                                                        icon: Icon(
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
                                                      style: const TextStyle(
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
                                                        icon: Icon(
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
                                                                                    child: const ListTile(
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
                                                                                    child: const ListTile(
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
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                        child: kIsWeb
                                                                            ? Image.network(
                                                                                photo!.path,
                                                                                fit: BoxFit.cover,
                                                                                height: 100,
                                                                                width: 300,
                                                                              )
                                                                            : Image.file(
                                                                                photo!,
                                                                                fit: BoxFit.cover,
                                                                                height: 100,
                                                                                width: 300,
                                                                              ),
                                                                      ),
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
                                                                    children: const [
                                                                      Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left:
                                                                                  40),
                                                                          child:
                                                                              Icon(Icons.upload)),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsets.only(
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
                                                                                        child: const ListTile(
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
                                                                                        child: const ListTile(
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
                                                                            borderRadius:
                                                                                BorderRadius.circular(30),
                                                                            child: kIsWeb
                                                                                ? Image.network(
                                                                                    photo1!.path,
                                                                                    fit: BoxFit.cover,
                                                                                    height: 100,
                                                                                    width: 300,
                                                                                  )
                                                                                : Image.file(
                                                                                    photo1!,
                                                                                    fit: BoxFit.cover,
                                                                                    height: 100,
                                                                                    width: 300,
                                                                                  ),
                                                                          ),
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
                                                                        children: const [
                                                                          Padding(
                                                                              padding: EdgeInsets.only(left: 40),
                                                                              child: Icon(Icons.upload)),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(left: 30, right: 30),
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
                                                                                        child: const ListTile(
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
                                                                                        child: const ListTile(
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
                                                                            borderRadius:
                                                                                BorderRadius.circular(30),
                                                                            child: kIsWeb
                                                                                ? Image.network(
                                                                                    photo2!.path,
                                                                                    fit: BoxFit.cover,
                                                                                    height: 100,
                                                                                    width: 300,
                                                                                  )
                                                                                : Image.file(
                                                                                    photo2!,
                                                                                    fit: BoxFit.cover,
                                                                                    height: 100,
                                                                                    width: 300,
                                                                                  ),
                                                                          ),
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
                                                                        children: const [
                                                                          Padding(
                                                                              padding: EdgeInsets.only(left: 40),
                                                                              child: Icon(Icons.upload)),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(left: 30, right: 30),
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
                                                                                        child: const ListTile(
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
                                                                                        child: const ListTile(
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
                                                                            borderRadius:
                                                                                BorderRadius.circular(30),
                                                                            child: kIsWeb
                                                                                ? Image.network(
                                                                                    photo3!.path,
                                                                                    fit: BoxFit.cover,
                                                                                    height: 100,
                                                                                    width: 300,
                                                                                  )
                                                                                : Image.file(
                                                                                    photo3!,
                                                                                    fit: BoxFit.cover,
                                                                                    height: 100,
                                                                                    width: 300,
                                                                                  ),
                                                                          ),
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
                                                                        children: const [
                                                                          Padding(
                                                                              padding: EdgeInsets.only(left: 40),
                                                                              child: Icon(Icons.upload)),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(left: 30, right: 30),
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
                                                    const SizedBox(
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
                                                                  sendMailApi();
                                                                } else {
                                                                  // ignore: avoid_print
                                                                  print(
                                                                      "No Internet Connection");
                                                                  // ignore: unused_local_variable
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
                                                          color: const Color
                                                                  .fromARGB(
                                                              255, 63, 86, 98),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      63,
                                                                      86,
                                                                      98)
                                                                  .withOpacity(
                                                                      0.2),
                                                              spreadRadius: 1,
                                                              blurRadius: 2,
                                                              offset: const Offset(
                                                                  0,
                                                                  1), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child: Center(
                                                          child: _isLoading
                                                              ? LoadingAnimationWidget
                                                                  .hexagonDots(
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.7),
                                                                  size: 25,
                                                                )
                                                              : Text(
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
                                                                              .grey[
                                                                          50]),
                                                                ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    )
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
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
