import 'package:e_commerce_app/Controllers/auth_controller.dart';
import 'package:e_commerce_app/Widget_Common/appLogo_Widget.dart';
import 'package:e_commerce_app/Widget_Common/bg_widget.dart';
import 'package:e_commerce_app/Widget_Common/customTextField_widget.dart';
import 'package:e_commerce_app/Widget_Common/ourButton_widget.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/list.dart';
import 'package:e_commerce_app/views/Home_Screen/Home.dart';
import 'package:e_commerce_app/views/auth_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(authController());

    return bgWidget(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight*0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "log in to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Obx(()=> Column(
                children: [
                  customTextField(hint: emailHint, title: email, isPass: false, controller: controller.emailController),
                  customTextField(hint: passwordHint, title: password, isPass: true, controller: controller.passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){}, child: forgetPass.text.make())
                  ),
                  5.heightBox,

                  controller.isloading.value? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ): ourButton(color: redColor, title: login, textColor: whiteColor, onPress: ()
                  async {
                    controller.isloading(true);
                    await controller.loginMethod(context: context).then((value){
                       if(value!=null){
                         VxToast.show(context, msg: loggedin);
                         Get.offAll(()=>const Home());
                       }else{
                         controller.isloading(false);
                       }
                    });
                  })
                  .box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(color: lightGolden, title: signup, textColor: redColor, onPress: (){
                    Get.to(()=>SignupScreen());
                  })
                      .box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                          child: Image.asset(socialIconList[index],
                          width: 30,),
                        ),
                    ))
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
