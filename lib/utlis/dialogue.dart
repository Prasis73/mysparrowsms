import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogueUtils {
  static dialogue(BuildContext context, _apiMessage) async {
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
                    "ALERT",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: "IMPACT",
                        fontSize: 38),
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
                      fontSize: 24),
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
                      child: Icon(Icons.cancel_sharp),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
