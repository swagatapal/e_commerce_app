import 'package:e_commerce_app/Controllers/product_controller.dart';
import 'package:e_commerce_app/Widget_Common/ourButton_widget.dart';
import 'package:e_commerce_app/consts/colors.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/list.dart';
import 'package:e_commerce_app/views/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({super.key, required this.title, this.data});

  @override
  Widget build(BuildContext context) {
    var controller  = Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async{
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          leading: IconButton(onPressed:(){
            controller.resetValues();
            Get.back();
          },icon: const Icon(Icons.arrow_back)),
          title: title!.text.fontFamily(bold).make(),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.share,)),
            Obx(()=> IconButton(onPressed: (){
                if(controller.isFav.value){
                  controller.removeFromWishlist(data.id, context);
                  controller.isFav(false);
                }else{
                  controller.addToWishlist(data.id, context);
                  controller.isFav(true);
                }

              }, icon: Icon(
                Icons.favorite_outlined,
                color: controller.isFav.value? redColor: darkFontGrey,
              )),
            )
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
                            viewportFraction: 1.0,
                            itemCount: data['p_imgs'].length, itemBuilder: (context,index){
                          return Image.network(
                            data['p_imgs'][index],
                            width: double.infinity,fit: BoxFit.cover,);
                        }),

                        10.heightBox,
                        title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                        10.heightBox,
                        VxRating(
                          isSelectable: false,
                          value: double.parse(data['p_rating']),
                          onRatingUpdate: (value){},
                          normalColor: textfieldGrey,
                          selectionColor: golden,
                          count: 5,
                          maxRating: 5,
                          size: 25,
                          stepInt: false,
                        ),

                        10.heightBox,
                        "${data["p_price"]}".numCurrency.text.color(redColor).fontFamily(bold).size(18).make(),

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
                                    "${data["p_seller"]}".text.fontFamily(semibold).color(darkFontGrey).size(16).make(),
                                  ],
                                )
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.message_rounded, color: darkFontGrey,),
                            ).onTap(() {
                              Get.to(()=> const ChatScreen(),
                              arguments: [data['p_seller'], data['vendor_id']],
                              );

                            }),
                          ],
                        ).box.height(60).padding(EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),

                        // Colour Section
                        20.heightBox,
                        Obx(()=> Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: "Color : ".text.color(textfieldGrey).make(),
                                  ),
                                  Row(
                                    children: List.generate(data["p_colors"].length,
                                            (index) => Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                VxBox().
                                                size(40, 40).
                                                roundedFull.
                                                color(Color(data["p_colors"][index]).withOpacity(1.0)).
                                                margin(EdgeInsets.symmetric(horizontal: 6)).make().onTap(() {
                                                  controller.changeColorIndex(index);
                                                }),
                                                Visibility(
                                                  visible: index == controller.colorIndex.value,
                                                    child: const Icon(Icons.done, color: Colors.white,)),
                                              ],
                                            )
                                    ),

                                  ),
                                ],
                              ).box.padding(const EdgeInsets.all(8)).make(),

                              //quantity row
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: "Quantity : ".text.color(textfieldGrey).make(),
                                  ),
                                  Obx(()=> Row(
                                      children: [
                                        IconButton(onPressed: (){
                                          controller.decreaseQuantity();
                                          controller.calculateTotalPrice(int.parse(data['p_price']));
                                        }, icon: const Icon(Icons.remove)),
                                        controller.quantity.value.text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                        IconButton(onPressed: (){
                                          controller.increaseQuantity(int.parse(data['p_quantity']));
                                          controller.calculateTotalPrice(int.parse(data['p_price']));
                                        }, icon: const Icon(Icons.add)),
                                        10.widthBox,
                                        "(${data['p_quantity']} available)".text.color(textfieldGrey).make(),
                                      ],
                                    ),
                                  ),
                                ],
                              ).box.padding(const EdgeInsets.all(8)).make(),

                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: "Total : ".text.color(textfieldGrey).make(),
                                  ),
                                  "${controller.totalPrice.value}".numCurrency.text.color(redColor).size(16).fontFamily(bold).make(),
                                ],
                              ).box.padding(const EdgeInsets.all(8)).make(),
                            ],
                          ).box.shadowSm.white.make(),
                        ),

                        //description section
                        10.heightBox,
                        "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                        10.heightBox,
                        "${data["p_description"]}".text.color(darkFontGrey).make(),

                        //buttons section
                        10.heightBox,
                        ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: List.generate(
                                  itemDetailsButtonList.length,
                                  (index) => ListTile(
                            title: itemDetailsButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                            trailing: const Icon(Icons.arrow_forward),
                          )),
                        ),

                        20.heightBox,
                        productsyoumaylike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
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
                        ),

                      ],
                    ),
                  ),
            )),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButton(
                color: redColor,
                onPress: (){
                  controller.addToCart(
                    color: data['p_colors'][controller.colorIndex.value],
                    context: context,
                     vendorID: data['vendor_id'],
                    img: data['p_imgs'][0],
                    qty: controller.quantity.value,
                    sellername: data['p_seller'],
                    title: data['p_name'],
                    tprice: controller.totalPrice.value
                  );
                  VxToast.show(context, msg: "Added to Cart");
                },
                textColor: whiteColor,
                title: "Add to Cart",
              ),
            )
          ],
        ),
      ),
    );
  }
}
