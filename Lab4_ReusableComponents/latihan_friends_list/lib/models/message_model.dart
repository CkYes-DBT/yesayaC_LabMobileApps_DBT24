class MessageModel {
  final String text;
  final bool isFromUser;
  final String time;

  MessageModel({
    required this.text,
    required this.isFromUser,
    required this.time,
  });
}