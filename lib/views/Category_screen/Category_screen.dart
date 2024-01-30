import 'package:e_commerce_app/Controllers/product_controller.dart';
import 'package:e_commerce_app/Widget_Common/bg_widget.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/list.dart';
import 'package:e_commerce_app/views/Category_screen/category_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),

        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            itemCount: 9,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200, ), itemBuilder: (context, index){
            return Column(
              children: [
                Image.asset(
                    categoryImage[index],
                    height: 120,
                    width: 200,
                    fit: BoxFit.cover,
                ),
                10.heightBox,
                categoryList[index].text.color(darkFontGrey).align(TextAlign.center).make(),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
              controller.getSubCategories(categoryList[index]);
              Get.to(()=> CategoryDetails(title: categoryList[index]));
            });
          }),
        ),
      )
    );
  }
} 