import 'package:e_commerce_app/Widget_Common/bg_widget.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/list.dart';
import 'package:e_commerce_app/views/Profile_Screen/component/details.card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [

              //edit profile button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(
                    alignment: Alignment.topRight,
                    child: const Icon(Icons.edit, color: whiteColor,)
                ).onTap(() {

                }),
              ),

              //user section details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset(imgProfile2, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.fontFamily(semibold).white.make(),
                        "customer@gmail.com".text.white.make(),
                      ],
                    )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: whiteColor,
                          ),

                        ),
                        onPressed: (){}, child: logout.text.fontFamily(semibold).white.make())
                  ],
                ),
              ),

              20.heightBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    detailsCard(count: "00", title: "in your cart", width: context.screenWidth/3.4),
                    detailsCard(count: "32", title: "your wishlist", width: context.screenWidth/3.4),
                    detailsCard(count: "675", title: "your order ", width: context.screenWidth/3.4),

                  ],
                ),
              ),


              ListView.separated(
                shrinkWrap: true,
                  separatorBuilder: (context, index){
                    return Divider(
                      color: lightGrey,
                    );
                  },
                  itemCount: profileButtonList.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      leading: Image.asset(profileButtonIcon[index], width: 22,),
                      title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),

                    );
                  }
              ).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),
            ],
          ),
        ),
      )

    );
  }
}