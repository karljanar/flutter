import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/detailedChat.dart';

class DetailedChatList extends StatefulWidget {
  DetailedChat detailedChat;

  DetailedChatList({super.key, required this.detailedChat});

  @override
  DetailedChatListState createState() => DetailedChatListState();
}

class DetailedChatListState extends State<DetailedChatList> {
  late bool isTextMessage;

  @override
  Widget build(BuildContext context) {
    isTextMessage = widget.detailedChat.messageType == MessageType.text;
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
                      "${widget.detailedChat.from} ${isTextMessage ? "said" : "sent"} on ${formatDate(widget.detailedChat.time, [
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
                          widget.detailedChat.message!,
                          textScaleFactor: 1.5,
                        )
                      : Container(
                          alignment: Alignment.topCenter,
                          child: widget.detailedChat.mediaLocation ==
                                      MediaLocation.network ||
                                  kIsWeb
                              ? Image.network(widget.detailedChat.fileName!,
                                  fit: BoxFit.fill)
                              : Image.file(
                                  fit: BoxFit.fill,
                                  File(widget.detailedChat.fileName!)),
                        ),
                  const SizedBox(height: 14),
                ]))
          ],
        ))
      ],
    );
  }
}
