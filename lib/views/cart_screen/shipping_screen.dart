

import 'package:e_commerce_app/Controllers/cart_controller.dart';
import 'package:e_commerce_app/Widget_Common/customTextField_widget.dart';
import 'package:e_commerce_app/Widget_Common/ourButton_widget.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/views/cart_screen/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<cartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: (){
            if(controller.addressController.text.length>10){

              Get.to(()=> PaymentMethod());

            }else{
              VxToast.show(context, msg: "Please Fill the form");
            }
          },
          color: redColor,
          textColor: whiteColor,
          title: "Continue"
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            customTextField(hint: "Address", isPass: false, title: "Address", controller: controller.addressController),
            customTextField(hint:"City",isPass: false, title: "City", controller: controller.cityController),
            customTextField(hint: "State",isPass: false, title: "State", controller: controller.stateController),
            customTextField(hint: "Postal Code", isPass: false, title: "Postal Code", controller: controller.postalCodeController ),
            customTextField(hint: "Phone no", isPass: false, title: "Phone no", controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}
