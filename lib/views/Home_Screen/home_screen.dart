import 'package:e_commerce_app/Controllers/home_controller.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      Container(color: Colors.blue,),
      Container(color: Colors.amber,),
      Container(color: Colors.purple,),
      Container(color: Colors.cyan,),


    ];

    return Scaffold(
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

    );
  }
}
