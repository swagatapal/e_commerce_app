import 'package:e_commerce_app/Widget_Common/home_buttons.dart';
import 'package:e_commerce_app/consts/colors.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/list.dart';
import 'package:e_commerce_app/views/Home_Screen/components/featured_button.dart';
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
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchanything,
                  hintStyle: TextStyle(color: textfieldGrey),

                ),
              ),
            ),
           
           Expanded(
             child: SingleChildScrollView(
               physics: const BouncingScrollPhysics(),
               child: Column(
                 children: [
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
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: List.generate(2, (index) => homeButtons(
                       height: context.screenHeight*0.15,
                       width: context.screenWidth/2.5,
                       icon: index==0? icTodaysDeal:icFlashDeal,
                       title: index == 0? todaydeal:flashsale,
                     )),
                   ),
             
                   10.heightBox,
                   VxSwiper.builder(
                       aspectRatio: 16 / 9,
                       autoPlay: true,
                       height: 150,
                       enlargeCenterPage: true,
             
                       itemCount: secondSliderList.length, itemBuilder: (context, index){
                     return Image.asset(
                       secondSliderList[index],
                       fit: BoxFit.fill,
                     ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
                   }),
             
                   10.heightBox,
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: List.generate(3, (index) => homeButtons(
                       height: context.screenHeight*0.15,
                       width: context.screenWidth/3.5,
                       icon: index==0? icCategories :index==1? icBrands: icTopSeller,
                       title: index == 0? topCategories : index==1 ? brand:topSellers,
             
                     )),
                   ),
             
             
                   20.heightBox,
                   Align(
                       alignment: Alignment.centerLeft,
                       child: feautureCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make()
                   ),

                   20.heightBox,
                   SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       children: List.generate(3, (index) => Column(
                         children: [
                           featuredButton(icon: featuredImagesList1[index],title: featuredTitles1[index]),
                           10.heightBox,
                           featuredButton(icon: featuredImagesList2[index], title: featuredTitles2[index]),
                         ],
                       )
                       ).toList(),
                     ),
                   ),

                   20.heightBox,
                   Container(
                     padding: EdgeInsets.all(12),
                     width: double.infinity,
                     decoration: const BoxDecoration(color: redColor),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         feauturedProducts.text.white.fontFamily(bold).size(18).make(),
                         10.heightBox,
                         SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                             children: List.generate(6, (index) => Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Image.asset(imgP1, width: 150, fit: BoxFit.cover,),
                                 10.heightBox,
                                 "Laptop 4gb/64gb Ram".text.fontFamily(semibold).color(darkFontGrey).make(),
                                 10.heightBox,
                                 "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                               ],
                             ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make()),
                           ),
                         )
                       ],
                     ),
                   ),

                   20.heightBox,
                   VxSwiper.builder(
                       aspectRatio: 16 / 9,
                       autoPlay: true,
                       height: 150,
                       enlargeCenterPage: true,

                       itemCount: secondSliderList.length, itemBuilder: (context, index){
                     return Image.asset(
                       secondSliderList[index],
                       fit: BoxFit.fill,
                     ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
                   }),

                   20.heightBox,
                   Align(
                       alignment: Alignment.centerLeft,
                       child: allProducts.text.color(darkFontGrey).size(18).fontFamily(semibold).make()
                   ),


                   20.heightBox,
                   GridView.builder(
                     physics: const NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       itemCount: 6,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 300),
                       itemBuilder: (context, index){
                       return Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Image.asset(imgP5, width: 200,height: 200, fit: BoxFit.cover,),
                           const Spacer(),
                           "Laptop 4gb/64gb Ram".text.fontFamily(semibold).color(darkFontGrey).make(),
                           10.heightBox,
                           "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                         ],
                       ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make();


                   }),


             
                 ],
               ),
             ),
           )

          
          ],
          )
         ),
    );
  }
}