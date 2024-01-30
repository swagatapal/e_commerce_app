import 'package:e_commerce_app/consts/colors.dart';
import 'package:flutter/material.dart';

Widget LoadingIndicator(){
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(redColor),
  );
}