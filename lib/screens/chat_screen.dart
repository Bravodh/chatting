import 'package:chatting_lec/chatting/chat/message.dart';
import 'package:chatting_lec/chatting/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  CollectionReference messages = FirebaseFirestore.instance
      .collection('/chats/xy5nLfBNzXN3lvXarPL5/message/');
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        debugPrint(loggedUser!.email);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      FocusScope.of(context).unfocus();
    },
      child: Scaffold(
          appBar: AppBar(
            title:const Text('Chat messages'),
            actions: [
              IconButton(
                onPressed: () {
                  _authentication.signOut();
                },
                icon: const Icon(Icons.exit_to_app),
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(8),
            child: const Column(
              children: [
                Expanded(child: Messages()),
                NewMessage(),
              ],
            ),
          ),
      ),
    );
  }
}
