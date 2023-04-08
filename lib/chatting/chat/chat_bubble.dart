import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble(this.message, this.isMe, {Key? key}) : super(key: key);
  final String message;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 145,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[300] : Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft:const Radius.circular(12),
              topRight:const Radius.circular(12),
              bottomRight: isMe ?const Radius.circular(0) :const Radius.circular(12),
              bottomLeft: isMe ?const Radius.circular(12):const Radius.circular(0),
            ),
          ),
          child: Text(
            message,
            style: TextStyle(color: isMe ? Colors.black : Colors.white),
          ),
        ),
      ],
    );
  }
}
