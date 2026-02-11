import 'package:flutter/material.dart';
import 'chat_detail_screen.dart';
import '../widgets/chat_search_bar.dart';
import '../widgets/chat_list_tile.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  static const _chats = [
    {'name': 'Kresna', 'subtitle': 'Seen 1h ago'},
    {'name': 'Victor', 'subtitle': 'Active 7m ago'},
    {'name': 'Vincent', 'subtitle': 'Active 13m ago'},
    {'name': 'Arji', 'subtitle': 'poosssttty · 5w'},
    {'name': 'Andre', 'subtitle': 'Sent a reel · 5w'},
    {'name': 'Edbert', 'subtitle': 'Seen'},
    {'name': 'Andry Hakim', 'subtitle': 'Sent'},
    {'name': 'Prajogo Pangestu', 'subtitle': 'Seen'},
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> get _filteredChats {
    final q = _searchController.text.trim().toLowerCase();
    if (q.isEmpty) return _chats.cast<Map<String, String>>();
    return _chats
        .where((c) => c['name']!.toLowerCase().contains(q))
        .map((e) => e.cast<String, String>())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final chats = _filteredChats;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        title: const Text(
          'ckyesaya',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.edit, color: Colors.black, size: 26),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Messages',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Requests (1)',
                  style: TextStyle(
                    color: Color(0xFF3856F6),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: ChatSearchBar(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: chats.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: Color(0xFFEAEAEA)),
              itemBuilder: (context, index) {
                final chat = chats[index];
                final name = chat['name']!;
                final subtitle = chat['subtitle']!;

                return ChatListTile(
                  name: name,
                  subtitle: subtitle,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatDetailScreen(name: name),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
