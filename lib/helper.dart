// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Helper{
  static DialogueHelper(BuildContext context,message){
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
                   message,
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
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.done))
                
              ],
            ),
          );
        });
    
  }
}