import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Controllers/product_controller.dart';
import 'package:e_commerce_app/Widget_Common/bg_widget.dart';
import 'package:e_commerce_app/Widget_Common/loading_indicator.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/services/firestore_service.dart';
import 'package:e_commerce_app/views/Category_screen/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: StreamBuilder(
          stream: FireStoreServices.getProducts(title),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(
                child: LoadingIndicator(),
              );
            }else if(snapshot.data!.docs.isEmpty){
              return Center(
                child: "No Products Found".text.color(darkFontGrey).make(),
              );
            }else{
              var data = snapshot.data!.docs;

              return Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            controller.subcat.length, (index) => "${controller.subcat[index]}".text.size(16).fontFamily(semibold).color(darkFontGrey).makeCentered().box.white.rounded.size(120, 60).margin(EdgeInsets.symmetric(horizontal: 4)).make()
                        ),
                      ),
                    ),

                    20.heightBox,

                    //items container
                    Expanded(child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 250, mainAxisSpacing: 8, crossAxisSpacing: 8), itemBuilder: (context, index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            data[index]['p_imgs'][0],
                            width: 200,height: 150, fit: BoxFit.fill,),
                          10.heightBox,
                          "${data[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                          5.heightBox,
                          "${data[index]['p_price']}".numCurrency.text.color(redColor).fontFamily(bold).size(16).make(),
                        ],
                      ).box.white.margin(EdgeInsets.symmetric(horizontal: 4))
                          .roundedSM.outerShadowSm
                          .padding(const EdgeInsets.all(8))
                          .make()
                          .onTap(() {
                            controller.checkIfFav(data[index]);
                        Get.to(()=>ItemDetails(title: "${data[index]['p_name']}", data: data[index]));
                      });
                    }))
                  ],
                ),
              );
            }

          },

        ),
      )
    );
  }
}
