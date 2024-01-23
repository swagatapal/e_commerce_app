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
                  valueColor: AlwaysStoppedAnimation(redColor),),
                );
              }

              return Container();

            }
        )
      )

    );
  }
}