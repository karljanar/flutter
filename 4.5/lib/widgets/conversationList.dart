import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/conversation.dart';

class ConversationList extends StatefulWidget {
  Conversation conversation;

  ConversationList({Key? key, required this.conversation}) : super(key: key);

  @override
  ConversationListState createState() => ConversationListState();
}

class ConversationListState extends State<ConversationList> {
  late bool isTextMessage;

  @override
  Widget build(BuildContext context) {
    isTextMessage = widget.conversation.messageType == MessageType.text;
    return Column(
      children: [
        const CircleAvatar(
          radius: 38,
          backgroundColor: Colors.blue,
        ),
        Card(
            child: Row(
          children: [
            SizedBox(
              width: isTextMessage ? 12 : 0,
            ),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(height: 7),
                  Center(
                    child: Text(
                      "${widget.conversation.from} ${isTextMessage ? "said" : "sent"} on ${formatDate(widget.conversation.time, [
                            MM,
                            ' ',
                            d,
                            ' at ',
                            HH,
                            ':',
                            nn
                          ])} ",
                    ),
                  ),
                  const SizedBox(height: 7),
                  isTextMessage
                      ? SelectableText(
                          widget.conversation.message!,
                          textScaleFactor: 1.5,
                        )
                      : Container(
                          alignment: Alignment.topCenter,
                          child: widget.conversation.mediaLocation ==
                                      MediaLocation.network ||
                                  kIsWeb
                              ? Image.network(widget.conversation.fileName!,
                                  fit: BoxFit.fill)
                              : Image.file(
                                  fit: BoxFit.fill,
                                  File(widget.conversation.fileName!)
                          ),
                        ),
                  const SizedBox(height: 14),
                ]))
          ],
        ))
      ],
    );
  }
}
