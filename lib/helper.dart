// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Helper {
  static DialogueHelper(BuildContext context, message) {
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
                borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                      child: Text(message,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.comfortaa(
                            textStyle: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 37, 0, 0)),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
