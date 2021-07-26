import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeUser extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {

    bool value = false;
    int val = -1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Adm"),
          leading: Radio(
            value: 1,
            groupValue: val,
            onChanged: (value) {

            },
            activeColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text("User"),
          leading: Radio(
            value: 2,
            groupValue: val,
            onChanged: (value) {

            },
            activeColor: Colors.green,
          ),
        ),
      ],
    );
  }

  ChangeUser();
}