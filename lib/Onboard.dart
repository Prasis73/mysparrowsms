// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sparrowsms/homePage.dart';
import 'package:onboarding/onboarding.dart';

import 'getStorage.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: SvgPicture.asset(
                  'assets/onboarda.svg',
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sparrow SMS',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sparrow SMS is a leading VAS Provider based in Nepal. It currently provides SMS Gateway connectivity with the telecom operators of Nepal, currently supporting the following operators',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '1. Nepal Telecom (GSM + CDMA).',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '2. Ncell',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '3. United Telecom',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '4. Smart Telecom',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: SvgPicture.asset(
                  'assets/onboardb.svg',
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Send SMS',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Outgoing or Push or MT (Mobile Terminated) messages are sent from Sparrow SMS Gateway server to the intended recipients mobile phone.',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: SvgPicture.asset(
                  'assets/onboardc.svg',
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SMS Gateway & API',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sparrow SMS provides you with an extremely comprehensive API. All the features of our web interface can be accessed via API.',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          GetSetStorage.setOnboard(false);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const HomePage()));
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Home',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: background,
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  width: 0.0,
                  color: background,
                ),
              ),
              child: ColoredBox(
                color: background,
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          indicatorDesign: IndicatorDesign.line(
                            lineDesign: LineDesign(
                              lineType: DesignType.line_uniform,
                            ),
                          ),
                        ),
                      ),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
