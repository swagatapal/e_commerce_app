import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Widget_Common/loading_indicator.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/services/firestore_service.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Orders".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),

      body: StreamBuilder(
        stream: FireStoreServices.getAllOrders(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
          if(!snapshot.hasData){
            return Center(child: LoadingIndicator(),);
          }else if(snapshot.data!.docs.isEmpty){
            return "No orders Yet !!!".text.color(darkFontGrey).makeCentered();
          }else{

            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
                itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: data[index]['order_code'].toString().text.color(redColor).fontFamily(semibold).make(),
                  subtitle: data[index]['total_amount'].toString().numCurrency.text.fontFamily(bold).make(),
                );
                }
            );
          }

        },
      ),
    );
  }
}
