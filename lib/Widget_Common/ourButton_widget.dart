

import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ourButton({onPress, color, textColor,title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: const EdgeInsets.all(12),
    ),
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontFamily: bold,

        ),
      ),
  );
}