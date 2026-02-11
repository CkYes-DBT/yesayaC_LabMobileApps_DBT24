import 'message_model.dart';

class User {
  final int id;
  final String name;
  final String lastMessage;
  final String time;
  final String imageUrl;
  final List<MessageModel> messages;

  User({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.imageUrl,
    required this.messages,
  });
}