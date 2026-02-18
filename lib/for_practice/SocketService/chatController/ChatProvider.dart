import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatModel/ChatMessage.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatModel/userChatListModel.dart';

class ChatController extends GetxController {
  final RxList<ChatMessageModel> messages = <ChatMessageModel>[].obs;

  late String currentUserId;
  late String chattingWithUserId;

  void initialize(
      {required String currentUser, required String chattingWithUser}) {
    currentUserId = currentUser;
    chattingWithUserId = chattingWithUser;
    loadMessages();
  }


  void loadMessages() {
    final box = HiveBoxes.chatMessageBox();
    messages.assignAll(
      box.values.where((msg) =>
      (msg.fromUserId == currentUserId && msg.toUserId == chattingWithUserId) ||
          (msg.fromUserId == chattingWithUserId &&
              msg.toUserId == currentUserId)).toList(),
    );
  }

  void addMessage(ChatMessageModel msg) {
    final box = HiveBoxes.chatMessageBox();
    box.put(msg.id, msg);
    messages.add(msg);
  }

  void deleteMessage(String msgId) {
    final box = HiveBoxes.chatMessageBox();
    box.delete(msgId);
    messages.removeWhere((msg) => msg.id == msgId);
  }

  void editMessage(String msgId, String newMessage) {
    final box = HiveBoxes.chatMessageBox();
    final old = box.get(msgId);
    if (old != null) {
      final updated = ChatMessageModel(
        id: old.id,
        fromUserId: old.fromUserId,
        toUserId: old.toUserId,
        message: newMessage,
        timestamp: old.timestamp,
      );
      box.put(msgId, updated);
      final index = messages.indexWhere((msg) => msg.id == msgId);
      if (index != -1) messages[index] = updated;
    }
  }


  Future<void> loadLastMessagesForUsers(List<UserChatListModel> users) async {
    final userChatListBox = HiveBoxes.userChatListBox();

    for (var user in users) {
      final lastMsg = await getLastMessage(user.userId, user.chatWithUserId);
      if (lastMsg != null) {
        user.lastMessage = lastMsg.message;
        user.lastTimestamp = lastMsg.timestamp;
        await userChatListBox.put(user.userId, user);

      }
    }
    update();
  }

  Future<ChatMessageModel?> getLastMessage(String userId1, String userId2) async {
    final box = HiveBoxes.chatMessageBox();
    final msgs = box.values.where((msg) =>
    (msg.fromUserId == userId1 && msg.toUserId == userId2) ||
        (msg.fromUserId == userId2 && msg.toUserId == userId1));
    if (msgs.isEmpty) return null;

    final sorted = msgs.toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return sorted.first;
  }

  String formatTime(DateTime timestamp) {
    final now = DateTime.now();
    if (now.difference(timestamp).inDays == 0 &&
        now.day == timestamp.day &&
        now.month == timestamp.month &&
        now.year == timestamp.year) {
      return DateFormat('hh:mm a').format(timestamp);
    } else {
      return DateFormat('dd/MM').format(timestamp);
    }
  }

}





