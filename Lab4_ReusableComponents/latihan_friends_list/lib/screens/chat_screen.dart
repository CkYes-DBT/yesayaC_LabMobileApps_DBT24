import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/message_model.dart';
import '../widget/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final User contact;

  const ChatScreen({super.key, required this.contact});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  late List<MessageModel> _messages;

  @override
  void initState() {
    super.initState();
    _messages = []; // Chat dimulai kosong
    
    // Random: kadang kontak yang memulai chat duluan
    _randomFirstMessage();
  }

  void _randomFirstMessage() {
    // 50% chance kontak memulai chat duluan setelah 2 detik
    if (DateTime.now().millisecond % 2 == 0) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted && _messages.isEmpty) {
          final greetings = [
            'Hi there! 👋',
            'Hello! How are you?',
            'Hey! Good to see you online.',
            'Hi! What\'s up?',
            'Hello! How\'s your day?',
          ];
          
          final firstMessage = MessageModel(
            text: greetings[DateTime.now().second % greetings.length],
            isFromUser: false,
            time: 'Just now',
          );

          setState(() {
            _messages.add(firstMessage);
          });
        }
      });
    }
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final newMessage = MessageModel(
      text: _messageController.text.trim(),
      isFromUser: true,
      time: 'Just now',
    );

    setState(() {
      _messages.add(newMessage);
    });

    _messageController.clear();

    // Auto-reply after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        final replies = [
          'Got it!',
          'Thanks for your message!',
          'Sure, I\'ll check it out.',
          'Sounds good!',
          'Okay, no problem.',
          'I understand.',
        ];
        
        final autoReply = MessageModel(
          text: replies[_messages.length % replies.length],
          isFromUser: false,
          time: 'Just now',
        );

        setState(() {
          _messages.add(autoReply);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade100,
              Colors.blue.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                top: 40,
                left: 8,
                right: 16,
                bottom: 12,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.pink.shade100,
                    child: Text(
                      widget.contact.name[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.contact.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Messages - Menampilkan BEBERAPA MESSAGES
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(
                    message: _messages[index],
                  );
                },
              ),
            ),

            // Input
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type something...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    color: Colors.purple.shade400,
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}