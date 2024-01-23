import 'dart:io';

import 'package:e_commerce_app/Controllers/profile_controller.dart';
import 'package:e_commerce_app/Widget_Common/bg_widget.dart';
import 'package:e_commerce_app/Widget_Common/customTextField_widget.dart';
import 'package:e_commerce_app/Widget_Common/ourButton_widget.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../consts/images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<profileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(()=> Column(
            mainAxisSize: MainAxisSize.min,
            children: [



              controller.profileImgPath.isEmpty ?
              Image.asset(imgProfile2, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make():
              Image.file(File(controller.profileImgPath.value ),
              width: 100, fit: BoxFit.cover,
               ).box.roundedFull.clip(Clip.antiAlias).make(),



               10.heightBox,
              ourButton(color: redColor, onPress: (){
                controller.changeImage(context);
              }, textColor: whiteColor, title: "change"),
              Divider(),
              20.heightBox,
              customTextField(
                   hint: nameHint,
                title: name,
                isPass: false,
              ),
              customTextField(
                hint: password,
                title: password,
                isPass: true,
              ),

              20.heightBox,
              SizedBox(
                width: context.screenWidth-40,
                  child: ourButton(color: redColor, onPress: (){}, textColor: whiteColor, title: "save")
              ),


            ],

          ).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top: 50, left: 12, right: 12)).rounded.make(),
        ),
      )
    );
  }
}
