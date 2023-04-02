import 'package:flutter/material.dart';
import 'package:untitled/screens/conversation.dart';

import '../models/chats.dart';

class ChatsList extends StatefulWidget {
  Chats chat;

  ChatsList({super.key, required this.chat});

  @override
  ChatsListState createState() => ChatsListState();
}

class ChatsListState extends State<ChatsList> {
  late bool seenMessage;

  @override
  Widget build(BuildContext context) {
    seenMessage = widget.chat.seenMessage;
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ConversationScreen(name: widget.chat.name);
          }));
          setState(() {
            if (seenMessage == false) {
              widget.chat.seenMessage = true;
            }
          });
        },
        child: Container(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
            height: 100,
            child: Card(
              color: seenMessage ? Colors.green.shade400 : Colors.green,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: seenMessage
                          ? Colors.green.shade400
                          : Colors.green.shade900,
                      width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    maxRadius: 38,
                    child: Text(
                      widget.chat.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.chat.time,
                            style: TextStyle(
                                fontWeight: seenMessage
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                                fontSize: 22)),
                        Text(widget.chat.message,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: seenMessage
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
