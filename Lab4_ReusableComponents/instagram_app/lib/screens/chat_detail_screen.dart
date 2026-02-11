import 'package:flutter/material.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input_bar.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key, required this.name});

  final String name;

  List<Map<String, dynamic>> _messages() {
    return [
      {
        'fromMe': false,
        'text': 'Hai, ini $name. Bisa ngobrol sebentar?'
      },
      {
        'fromMe': true,
        'text': 'Halo $name, bisa. Ada apa?'
      },
      {
        'fromMe': false,
        'text': 'Aku mau share detailnya, cek ya.'
      },
      {
        'fromMe': true,
        'text': 'Siap, kirim saja. Nanti kubalas lagi.'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final messages = _messages();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[300],
              child: Text(
                name.substring(0, 1),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'Active now',
                  style: TextStyle(
                    color: Color(0xFF7A7A7A),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final fromMe = msg['fromMe'] as bool;
                final text = msg['text'] as String;

                return ChatBubble(text: text, fromMe: fromMe);
              },
            ),
          ),
          const ChatInputBar(),
        ],
      ),
    );
  }
}
