import 'package:flutter/material.dart';
import 'package:mysparrowsms/Onboard.dart';

import 'getStorage.dart';
import 'homePage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  _navigateto() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    if (LoginGetStorage.getOnboard() == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Onboard()));
    }
  }

  @override
  void initState() {
    super.initState();
    _navigateto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFFFCD85),
                  Color(0xFFFFECAF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Center(
              child: Image.asset(
            "./assets/logo.png",
          ))),
    );
  }
}
