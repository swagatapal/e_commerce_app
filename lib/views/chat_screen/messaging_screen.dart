import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Widget_Common/loading_indicator.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/services/firestore_service.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Messages".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),

      body: StreamBuilder(
        stream: FireStoreServices.getAllMessages(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
          if(!snapshot.hasData){
            return Center(child: LoadingIndicator(),);
          }else if(snapshot.data!.docs.isEmpty){
            return "No Messages Yet !!!".text.color(darkFontGrey).makeCentered();
          }else{
            return Container();
          }

        },
      ),
    );
  }
}
