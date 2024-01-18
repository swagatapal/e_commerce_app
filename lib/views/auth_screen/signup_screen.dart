import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget_Common/appLogo_Widget.dart';
import '../../Widget_Common/bg_widget.dart';
import '../../Widget_Common/customTextField_widget.dart';
import '../../Widget_Common/ourButton_widget.dart';
import '../../consts/list.dart';
import '../Home_Screen/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return bgWidget(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight*0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Join the $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Column(
                children: [
                  customTextField(hint: nameHint, title: name),
                  customTextField(hint: emailHint, title: email),
                  customTextField(hint: passwordHint, title: password),
                  customTextField(hint: passwordHint, title: retypePassword),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                          checkColor: Colors.white,
                          value: isCheck,
                          onChanged: (newValue){
                            setState(() {
                              isCheck = newValue;
                            });
                      }),
                      10.widthBox,
                      Expanded(
                        child: RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "I agree to the ", style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,

                            )),
                            TextSpan(text: termAndCond, style: TextStyle(
                              fontFamily: regular,
                              color: redColor,

                            )),
                            TextSpan(text: " & ", style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,

                            )),
                            TextSpan(text: privacyPolicy, style: TextStyle(
                              fontFamily: regular,
                              color: redColor,

                            )),

                          ]
                        )),
                      )
                    ],
                  ),
                  5.heightBox,
                  ourButton(color:isCheck == true? redColor:lightGrey, title: signup, textColor: whiteColor, onPress: (){
                    Get.to(()=>HomeScreen());
                  })
                      .box.width(context.screenWidth - 50).make(),

                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      allreadyHaveAccount.text.color(fontGrey).make(),
                      login.text.color(redColor).make().onTap(() {
                        Get.back();
                      })
                    ],
                  ),

                ]
            ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),



          ],
        ),
      ),

    ));
  }
}