import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wasel_app/themeing/mycolors.dart';
import '../../businessLogic/cubit/chat_cubit.dart';
import '../Components/my_circular_button.dart';
import '../Components/my_txtfield.dart';

class ChatScreen extends StatelessWidget {
  final String receiverId;
  final String receiverEmail;
  final String fullName;

  ChatScreen({
    required this.receiverId,
    required this.receiverEmail,
    required this.fullName,
  });

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat with $fullName")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: context.read<ChatCubit>().getMessages(receiverId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No messages yet"));
                }

                var messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index];
                    String senderId = message['senderId'];
                    bool isMe =
                        senderId == FirebaseAuth.instance.currentUser!.uid;

                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: isMe ? MyColors.lightpurple : MyColors.purble,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(message['text']),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 45,
                    decoration: BoxDecoration(
                      color: MyColors.lightpurple,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: MyColors.purble, width: 2),
                    ),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type a message...",
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                InkWell(
                  child: Container(
                    width: 50,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.purble,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    if (messageController.text.trim().isNotEmpty) {
                      context.read<ChatCubit>().sendMessage(
                            messageController.text.trim(),
                            receiverId,
                          );
                      messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
