// ignore_for_file: file_names, camel_case_types, unnecessary_string_escapes

import 'dart:ui';

import 'package:codeview/codeview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sparrowsms/utlis/tabSwitch.dart';

class documentationPage extends StatefulWidget {
  const documentationPage({super.key});

  @override
  State<documentationPage> createState() => _documentationPageState();
}

class _documentationPageState extends State<documentationPage> {
  List<String> head = ["Send SMS", "Check Credit"];

  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  }

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
                            "./assets/sms_banner.jpg",
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
                                      child: Text("Documentation",
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
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 40,
                                                vertical: 0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TabSwitch(
                                                      values: head,
                                                      width: 1100,
                                                      onToggleCallback:
                                                          (value) {
                                                        value == 1
                                                            ? _pageController.nextPage(
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            50),
                                                                curve: Curves
                                                                    .easeIn)
                                                            : _pageController.previousPage(
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            50),
                                                                curve: Curves
                                                                    .easeIn);
                                                      },
                                                      boxShape:
                                                          BoxShape.rectangle,
                                                      buttonColor: const Color(
                                                          0xFF0A3157),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFB5C1CC),
                                                      textColor: const Color(
                                                          0xFFFFFFFF),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: PageView(
                                                        controller:
                                                            _pageController,
                                                        // scrollDirection: Axis.horizontal,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        reverse: false,
                                                        onPageChanged:
                                                            (index) {},
                                                        children: <Widget>[
                                                          ListView(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            children: const [
                                                              CodeView(
                                                                code: """
var sparrowsmsToken = "PASTE_YOUR_TOKEN_HERE";
var phoneNumber = "PASTE_YOUR_PHONENUMBER_HERE"; //for bulk use comma eg: "98xxxxxxxx,97xxxxxxxx";
var message = "PASTE_YOUR_MESSAGE_HERE";

let body = {
            token: sparrowsmsToken,
            from: "TheAlert",
            to: phoneNumber.toString(),
            text:message.toString(),
          };
          
          fetch("http://api.sparrowsms.com/v2/sms/", {
            method: "POST",
            body: JSON.stringify(body),
            headers: { "Content-Type": "application/json" },
          })
            .then((res) => res.json())
            .then(function (data) {
              res.status(200).json({
                success: true,
                message:
                  "Message queued and will be delivered shortly",
              });
            });
""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title:
                                                                    'Node JS',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              CodeView(
                                                                code: """
var sparrowsmsToken = "PASTE_YOUR_TOKEN_HERE";
var phoneNumber = "PASTE_YOUR_PHONENUMBER_HERE"; //for bulk use comma eg: "98xxxxxxxx,97xxxxxxxx";
var message = "PASTE_YOUR_MESSAGE_HERE";

final url = Uri.parse('http://api.sparrowsms.com/v2/sms/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'token': sparrowsmsToken,
        'from': "TheAlert",
        'to': phoneNumber.toString(),
        'text':message.toString()
      }),
    );

    print(response.body);

""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title:
                                                                    'Flutter Dart',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              CodeView(
                                                                code: """
\$args = http_build_query(array(
        'token' => '<token-provided>',
        'from'  => '<Identity>',
        'to'    => '<comma_separated 10-digit mobile numbers>',
        'text'  => 'SMS Message to be sent'));

    \$url = "http://api.sparrowsms.com/v2/sms/";

    # Make the call using API.
    \$ch = curl_init();
    curl_setopt(\$ch, CURLOPT_URL, \$url);
    curl_setopt(\$ch, CURLOPT_POST, 1);
    curl_setopt(\$ch, CURLOPT_POSTFIELDS,\$args);
    curl_setopt(\$ch, CURLOPT_RETURNTRANSFER, 1);

    // Response
    \$response = curl_exec(\$ch);
    \$status_code = curl_getinfo(\$ch, CURLINFO_HTTP_CODE);
    curl_close(\$ch);
""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title: 'Php',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              CodeView(
                                                                code: """
import requests

    r = requests.post(
            "http://api.sparrowsms.com/v2/sms/",
            data={'token' : '<token-provided>',
                  'from'  : '<Identity>',
                  'to'    : '<comma_separated 10-digit mobile numbers>',
                  'text'  : 'SMS Message to be sent'})

    status_code = r.status_code
    response = r.text
    response_json = r.json()
""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title: 'Python',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              CodeView(
                                                                code: """
using System.Collections.Specialized;
    using System.Net;
    using System.Text;

    namespace SparrowSMSTest{
        class Program{
            static void Main(string[] args){
                var responseTest = PostSendSMS('<Identity>', '<token-provided>', '<comma_separated 10-digit mobile numbers>', 'SMS Message to be sent');
            }

            private static string PostSendSMS(string from, string token, string to, string text){
                using (var client = new WebClient()){
                    var values = new NameValueCollection();
                    values["from"] = from;
                    values["token"] = token;
                    values["to"] = to;
                    values["text"] = text;
                    var response = client.UploadValues("http://api.sparrowsms.com/v2/sms/", "Post", values);
                    var responseString = Encoding.Default.GetString(response);
                    return responseString;
                }
            }
        }
    }
""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title: 'C#',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              CodeView(
                                                                code:
                                                                    """curl -s http://api.sparrowsms.com/v2/sms/ \
        -F token='<token-provided>' \
        -F from='<Identity>' \
        -F to='<comma_separated 10-digit mobile numbers>' \
        -F text='SMS Message to be sent'
""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title: 'Curl',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              )
                                                            ],
                                                          ),
                                                          ListView(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            children: const [
                                                              CodeView(
                                                                code: """
String sparrowsmsToken = "PASTE_YOUR_TOKEN_HERE";

final url = Uri.parse("http://api.sparrowsms.com/v2/credit/?token="+sparrowsmsToken);

final response = await http.get(
  url,
  headers: {'Content-Type': 'application/json'},
);

print(response.body);
""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title:
                                                                    'Flutter Dart',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              CodeView(
                                                                code: """
\$api_url = "http://api.sparrowsms.com/v2/credit/?".
        http_build_query(array(
            'token' => '<token-provided>',

\$response = file_get_contents(\$api_url);
""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title: 'Php',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              CodeView(
                                                                code: """
 import requests

    r = requests.get(
            "http://api.sparrowsms.com/v2/credit/",
            params={'token' : '<token-provided>'})

    status_code = r.status_code
    response = r.text
    response_json = r.json()
""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title: 'Python',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              CodeView(
                                                                code: """
using System.Collections.Specialized;
    using System.IO;
    using System.Net;
    using System.Text;

    namespace SparrowSMSTest{

    class Program{
        static void Main(string[] args)
        {
            var getResponseTest = GetCredits('<token-provided>');
        }

        private static string GetCredits(string token)
        {
            using (var client = new WebClient())
            {
                string parameters = "?";
                parameters += "token=" + token;
                var responseString = client.DownloadString("http://api.sparrowsms.com/v2/credit/" + parameters);
                return responseString;
            }
        }
    }
""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title: 'C#',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              CodeView(
                                                                code: """
curl -s http://api.sparrowsms.com/v2/credit/ \
        -F token='<token-provided>' \
""",
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                title: 'Curl',
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
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
    );
  }
}
