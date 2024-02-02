import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Widget_Common/loading_indicator.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/services/firestore_service.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Wishlists".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),

      body: StreamBuilder(
        stream: FireStoreServices.getAllWishlist(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
          if(!snapshot.hasData){
            return Center(child: LoadingIndicator(),);
          }else if(snapshot.data!.docs.isEmpty){
            return "No Wishlist Yet !!!".text.color(darkFontGrey).makeCentered();
          }else{
            return Container();
          }

        },
      ),
    );
  }
}
