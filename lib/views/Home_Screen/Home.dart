import 'package:e_commerce_app/Controllers/home_controller.dart';
import 'package:e_commerce_app/Widget_Common/exit_dialog.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/views/Category_screen/Category_screen.dart';
import 'package:e_commerce_app/views/Home_Screen/home_screen.dart';
import 'package:e_commerce_app/views/Profile_Screen/profile_screen.dart';
import 'package:e_commerce_app/views/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    //init home controller
    var controller = Get.put(HomeController());

    var navbarItems = [
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26,), label:home),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26,), label:categories),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26,), label:cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26,), label:account),
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return WillPopScope(
      onWillPop: () async{
        showDialog(
            barrierDismissible: false,
            context: context, builder: (context)=>exitDialog(context));
        return false;
      },
      child: Scaffold(
        body: Column(
            children: [
              Obx(()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value),))
            ]
        ),
        bottomNavigationBar: Obx(()=>
          BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: redColor,
              selectedLabelStyle: const TextStyle(fontFamily: semibold),
              type: BottomNavigationBarType.fixed,
              backgroundColor: whiteColor,
              items: navbarItems,
              onTap: (value){
                controller.currentNavIndex.value = value;
              },
          ),

        ),

      ),
    );
  }
}
