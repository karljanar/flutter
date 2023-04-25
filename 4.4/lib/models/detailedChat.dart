enum MessageType { text, media }

enum MediaLocation { network, local }

class DetailedChat {
  String? message;
  DateTime time;
  String? fileName;
  MediaLocation? mediaLocation;
  String from;
  MessageType messageType;

  DetailedChat(
      {this.message,
      required this.time,
      required this.from,
      required this.messageType,
      this.fileName,
      this.mediaLocation});
}
