import '../models/user_model.dart';

class MockData {
  static List<User> getContacts() {
    return [
      User(
        id: 1,
        name: 'Hajeera',
        lastMessage: 'Tap to start chatting',
        time: 'Active now',
        imageUrl: 'https://i.pravatar.cc/150?img=5',
        messages: [],
      ),
      User(
        id: 2,
        name: 'Riya',
        lastMessage: 'Tap to start chatting',
        time: 'Active now',
        imageUrl: 'https://i.pravatar.cc/150?img=9',
        messages: [],
      ),
      User(
        id: 3,
        name: 'Nakul',
        lastMessage: 'Tap to start chatting',
        time: 'Active now',
        imageUrl: 'https://i.pravatar.cc/150?img=12',
        messages: [],
      ),
      User(
        id: 4,
        name: 'Khan',
        lastMessage: 'Tap to start chatting',
        time: 'Active now',
        imageUrl: 'https://i.pravatar.cc/150?img=33',
        messages: [],
      ),
      User(
        id: 5,
        name: 'Diya',
        lastMessage: 'Tap to start chatting',
        time: 'Active now',
        imageUrl: 'https://i.pravatar.cc/150?img=47',
        messages: [],
      ),
      User(
        id: 6,
        name: 'Sahana',
        lastMessage: 'Tap to start chatting',
        time: 'Active now',
        imageUrl: 'https://i.pravatar.cc/150?img=23',
        messages: [],
      ),
    ];
  }
}