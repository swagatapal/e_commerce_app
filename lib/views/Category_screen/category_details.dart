import 'package:e_commerce_app/Widget_Common/bg_widget.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/views/Category_screen/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) => "Baby Clothing".text.size(12).fontFamily(semibold).color(darkFontGrey).makeCentered().box.white.rounded.size(120, 60).margin(EdgeInsets.symmetric(horizontal: 4)).make()
                  ),
                ),
              ),

              20.heightBox,

              //items container
              Expanded(child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 250, mainAxisSpacing: 8, crossAxisSpacing: 8), itemBuilder: (context, index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(imgP5, width: 200,height: 150, fit: BoxFit.cover,),

                    "Laptop 4gb/64gb Ram".text.fontFamily(semibold).color(darkFontGrey).make(),
                    10.heightBox,
                    "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                  ],
                ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.outerShadowSm.padding(const EdgeInsets.all(8)).make().onTap(() { 
                  Get.to(()=>const ItemDetails(title: "Dummy Item"));
                });
              }))
            ],
          ),
        ),
      )
    );
  }
}
