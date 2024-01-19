import 'package:e_commerce_app/Widget_Common/ourButton_widget.dart';
import 'package:e_commerce_app/consts/colors.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline,))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VxSwiper.builder(
                          autoPlay: true,
                          height: 350,
                          aspectRatio: 16/9,
                          itemCount: 3, itemBuilder: (context,index){
                        return Image.asset(
                          imgFc5, width: double.infinity,fit: BoxFit.cover,);
                      }),

                      10.heightBox,
                      title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                      10.heightBox,
                      VxRating(onRatingUpdate: (value){},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        size: 25,
                        stepInt: true,),

                      10.heightBox,
                      "\$30.000".text.color(redColor).fontFamily(bold).size(18).make(),

                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Seller".text.white.fontFamily(semibold).make(),
                                  5.heightBox,
                                  "In house brand".text.fontFamily(semibold).color(darkFontGrey).size(16).make(),
                                ],
                              )
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.message_rounded, color: darkFontGrey,),
                          ),
                        ],
                      ).box.height(60).padding(EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),

                      // Colour Section

                    ],
                  ),
                ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: redColor,
              onPress: (){},
              textColor: whiteColor,
              title: "Add to Cart",

            ),
          )
        ],
      ),
    );
  }
}
