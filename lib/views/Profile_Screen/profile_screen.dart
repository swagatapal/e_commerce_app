import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Controllers/auth_controller.dart';
import 'package:e_commerce_app/Widget_Common/bg_widget.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/list.dart';
import 'package:e_commerce_app/services/firestore_service.dart';
import 'package:e_commerce_app/views/Profile_Screen/component/details.card.dart';
import 'package:e_commerce_app/views/Profile_Screen/editProfile_screen.dart';
import 'package:e_commerce_app/views/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(profileController());
    
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
            stream: FireStoreServices.getUser(currentUser!.uid),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
                );
              }else{
                 var data = snapshot.data!.docs[0];
                return SafeArea(
                  child: Column(
                    children: [
                      // edit profile button
                      Padding(
                          padding: EdgeInsets.all(8.0),
                        child: const Align(alignment: Alignment.topRight,child: Icon(Icons.edit, color: whiteColor,),).onTap(() {

                          controller.nameController.text = data['name'];
                          // controller.passController.text = data['password'];
                          Get.to(()=> EditProfileScreen(data: data,));
                        }),
                      ),
                  
                      // user details section
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [

                            data['imageUrl'] ==''?
                            Image.asset(imgProfile2, width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make():
                            Image.network(data['imageUrl'], width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                            10.widthBox,
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Hi!! ${data['name']}".text.fontFamily(semibold).white.make(),
                                    "${data['email']}".text.white.make(),
                                  ],
                                ),
                            ),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: whiteColor,
                                  )
                                ),
                                onPressed: () async{
                                  await Get.put(authController()).signoutMethod(context);
                                  Get.offAll(()=> const LoginScreen());
                  
                                },
                                child: logout.text.fontFamily(semibold).white.make(),
                            )
                          ],
                        ),
                      ),
                  
                      40.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailsCard(count: data['cart_count'],title: "your cart", width: context.screenWidth/3.5),
                          detailsCard(count: data['wishlist_count'],title: "your wishlist", width: context.screenWidth/3.5),
                          detailsCard(count: data['order_count'],title: "your orders", width: context.screenWidth/3.5),
                        ],
                      ),
                  
                      // buttons section
                      ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index){
                            return const Divider(color: lightGrey,);
                          },
                          itemCount: profileButtonList.length,
                          itemBuilder: (BuildContext context, int index){
                            return ListTile(
                              leading: Image.asset(
                                profileButtonIcon[index],
                                width: 22,
                                color: darkFontGrey,
                              ),
                              title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                            );
                          },
                      ).box.
                      white.
                      rounded.
                      margin(const EdgeInsets.all(12)).
                      padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),
                  
                    ],
                  ),
                );

              }

            }
        )
      )

    );
  }
}