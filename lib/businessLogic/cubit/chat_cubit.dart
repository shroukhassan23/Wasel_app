import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatCubit extends Cubit<void> {
  ChatCubit() : super(null);

  // استرجاع الرسائل بين المرسل والمستقبل فقط
  Stream<QuerySnapshot> getMessages(String receiverId) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return Stream.empty();

    String chatId = _getChatId(user.uid, receiverId);
    debugPrint("🔍 Fetching messages for chatId: $chatId");

    return FirebaseFirestore.instance
        .collection('messages')
        .where('chatId', isEqualTo: chatId) // تأكد من أنه يعمل بشكل صحيح
        .orderBy('timestamp', descending: true)
        .snapshots()
        .handleError((error) {
      debugPrint("❌ Error fetching messages: $error");
    });
  }

  // إرسال رسالة
  Future<void> sendMessage(String message, String receiverId) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    String chatId = _getChatId(user.uid, receiverId);
    debugPrint("🚀 Sending message to chatId: $chatId");

    try {
      DocumentReference messageRef =
          await FirebaseFirestore.instance.collection('messages').add({
        'text': message,
        'chatId': chatId,
        'senderId': user.uid,
        'receiverId': receiverId,
        'participants': [user.uid, receiverId], // تأكد أن القيم صحيحة
        'timestamp': FieldValue.serverTimestamp(),
      });

      debugPrint("✅ Message sent successfully: ${messageRef.id}");
    } catch (e) {
      debugPrint("❌ Error sending message: $e");
    }
  }

  // إنشاء معرف موحد لكل محادثة لمنع تكرار الرسائل
  String _getChatId(String userId1, String userId2) {
    List<String> ids = [userId1, userId2];
    ids.sort(); // تأكد من أن ترتيب الـ IDs ثابت دائمًا
    return ids.join("_");
  }
}
