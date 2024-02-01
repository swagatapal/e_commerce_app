import 'dart:ffi';

import 'package:e_commerce_app/Controllers/cart_controller.dart';
import 'package:e_commerce_app/Widget_Common/loading_indicator.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget_Common/ourButton_widget.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {

    var controller  = Get.find<cartController>();

    return Obx(()=>Scaffold(
        backgroundColor: whiteColor,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: controller.placingOrder.value
              ? Center(
            child: LoadingIndicator(),
          )
              :ourButton(
              onPress: (){
                controller.placeMyOrder(orderPaymentMethod: paymentMethods[controller.paymentIndex.value], totalAmount: controller.totalP.value);
              },
              color: redColor,
              textColor: whiteColor,
              title: "Place My Order"
          ),
        ),
        appBar: AppBar(
          title: "Choose Payment Method".text.fontFamily(semibold).color(darkFontGrey).make(),
        ),

        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(()=>Column(
              children:List.generate(paymentMethodList.length, (index){
                  return GestureDetector(
                    onTap: (){
                          controller.changePaymentIndex(index);
                    },

                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: controller.paymentIndex.value == index ? redColor : Colors.transparent,
                          width: 4,
                        )
                      ),
                      margin: EdgeInsets.only(bottom: 8),
                      child: Stack(
                        alignment: Alignment.topRight,
                          children: [
                            Image.asset(paymentMethodList[index],
                              width: double.infinity,
                              height: 120,
                              fit: BoxFit.cover,
                              colorBlendMode: controller.paymentIndex.value == index ? BlendMode.darken: BlendMode.color,
                              color: controller.paymentIndex.value == index ? Colors.black.withOpacity(0.5): Colors.transparent,
                            ),
                            controller.paymentIndex.value == index ?  Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                activeColor: Colors.black,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                  value: true,
                                  onChanged: (value){},
                              ),
                            ):Container(),

                            Positioned(
                                bottom: 10, right: 10,
                                child: paymentMethods[index].text.white.fontFamily(semibold).size(16).make()),

                          ]),

                    ),
                  );
                })


            ),
          ),
        ),
      ),
    );
  }
}
