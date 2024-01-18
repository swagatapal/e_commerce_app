
import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget homeButtons({width, height, iCon, title, onPress}){
  return Column(
        children: [
          Image.asset(icTodaysDeal, width: 26,),
          5.heightBox,
          todaydeal.text.fontFamily(semibold).color(darkFontGrey).make(),
        ],
  ).box.rounded.white.size(width, height).make();

}