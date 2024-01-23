import 'package:e_commerce_app/Controllers/auth_controller.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget_Common/appLogo_Widget.dart';
import '../../Widget_Common/bg_widget.dart';
import '../../Widget_Common/customTextField_widget.dart';
import '../../Widget_Common/ourButton_widget.dart';
import '../../consts/list.dart';
import '../Home_Screen/Home.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;

  var controller = Get.put(authController());

  // text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();


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
            Obx(()=> Column(
                  children: [
                    customTextField(hint: nameHint, title: name, controller: nameController, isPass: false),
                    customTextField(hint: emailHint, title: email, controller: emailController, isPass: false),
                    customTextField(hint: passwordHint, title: password, controller: passwordController, isPass: true),
                    customTextField(hint: passwordHint, title: retypePassword, controller: passwordRetypeController, isPass: true),
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
                    controller.isloading.value? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ):
                    ourButton(color:isCheck == true? redColor:lightGrey, title: signup, textColor: whiteColor, onPress: () async{
                      if(isCheck != false){
                        controller.isloading(true);
                        try{
                          await controller.signupMethod(context: context, email: emailController.text, password: passwordController.text).then((value){
                            return controller.storedUserData(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
                          }).then((value){
                            VxToast.show(context, msg: loggedin);
                            Get.offAll(()=> Home());
                          });

                        } catch(e){
                          auth.signOut();
                          VxToast.show(context, msg: e.toString());
                          controller.isloading(false);
                        }
                      }
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
            ),



          ],
        ),
      ),

    ));
  }
}
