import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Controllers/chat_controllers.dart';
import 'package:e_commerce_app/Widget_Common/loading_indicator.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/services/firestore_service.dart';
import 'package:e_commerce_app/views/chat_screen/components/sender_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller  = Get.put(chatController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "${controller.friendName}".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(()=>
                controller.isLoading.value ? Center(
                child: LoadingIndicator(),
    ):
                Expanded(
                  child: StreamBuilder(
                    stream: FireStoreServices.getChatMessages(controller.chatDocId.toString()),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
                      if(!snapshot.hasData){
                        return Center(
                          child: LoadingIndicator(),
                        );
                      }else if(snapshot.data!.docs.isEmpty){
                        return Center(
                          child: "Send a message".text.color(darkFontGrey).make(),
                        );
                      }else{
                        return ListView(
                          children: snapshot.data!.docs.mapIndexed((currentValue, index){
                            var data = snapshot.data!.docs[index];
                            return Align(
                                alignment: data['uid']== currentUser!.uid? Alignment.centerRight : Alignment.centerLeft,
                                child: senderBubble(data));
                          }).toList(),
                        );
                      }

                    },

                  )
              ),
            ),
            10.heightBox,
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      controller: controller.msgController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: textfieldGrey,
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: textfieldGrey,
                            )
                        ),
                        hintText: "Type a message...."
                      ),
                    )
                ),
                IconButton(onPressed: (){
                  controller.sendMsg(controller.msgController.text);
                  controller.msgController.clear();
                }, icon: const Icon(Icons.send, color: redColor,))
              ],
            ).box.height(80).padding(const EdgeInsets.all(12)).margin(EdgeInsets.only(bottom: 8)).make(),
          ],

        ),
      ),
    );
  }
}
