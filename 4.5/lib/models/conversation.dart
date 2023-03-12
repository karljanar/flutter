enum MessageType { text, media }

enum MediaLocation { network, local }

class Conversation {
  String? message;
  DateTime time;
  String? fileName;
  MediaLocation? mediaLocation;
  String from;
  MessageType messageType;

  Conversation(
      {this.message,
      required this.time,
      required this.from,
      required this.messageType,
      this.fileName,
      this.mediaLocation});
}
