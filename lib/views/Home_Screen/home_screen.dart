import 'package:e_commerce_app/Widget_Common/home_buttons.dart';
import 'package:e_commerce_app/consts/colors.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/list.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: context.screenWidth,
      height: context.screenHeight,
      color: lightGrey,
      child: SafeArea(
        child:Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchanything,
                  hintStyle: TextStyle(color: textfieldGrey),

                ),
              ),
            ),
           
           VxSwiper.builder(
            aspectRatio: 16 / 9,
            autoPlay: true,
            height: 150,
            enlargeCenterPage: true,
            
            itemCount: sliderList.length, itemBuilder: (context, index){
            return Image.asset(
                sliderList[index],
                fit: BoxFit.fill,
            ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
           }),


           10.heightBox,
           Row(
            children: List.generate(2, (index) => homeButtons(
              height: context.screenHeight*0.2,
              width: context.screenWidth/2.5,
              iCon: index==0? icTodaysDeal:icFlashDeal,
              title: index == 0? todaydeal:flashsale,
            )),
           )

          
          ],
          )
         ),
    );
  }
}