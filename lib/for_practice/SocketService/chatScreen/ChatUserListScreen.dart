import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatController/ChatProvider.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatModel/userChatListModel.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'Chat_screen.dart';
import 'package:get/get.dart';

class ChattingUserListScreen extends StatefulWidget {
  ChattingUserListScreen({super.key});

  @override
  State<ChattingUserListScreen> createState() => _ChattingUserListScreenState();
}

class _ChattingUserListScreenState extends State<ChattingUserListScreen> {
  final chatController = Get.put(ChatController());

  late List<UserChatListModel> users = [
    UserChatListModel(name: 'Sagar Kumar', userId: 'userS', chatWithUserId: 'userR'),
    UserChatListModel(name: 'Ravi', userId: 'userR', chatWithUserId: 'userS'),
  ];

  @override
  void initState() {
    super.initState();
    final userChatListBox = HiveBoxes.userChatListBox();
    final storedUsers = userChatListBox.values.toList();

    if (storedUsers.isNotEmpty) {
      users = storedUsers;
    }
    chatController.loadLastMessagesForUsers(users);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        elevation: 4,
        leading: Container(
          height: 30,
          width: 30,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              shape: BoxShape.circle
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // leading: Container(
        //   height: 45,
        //   width: 45,
        //   margin: EdgeInsets.all(8),
        //   decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: ColorUtils.red,
        //       image: DecorationImage(image: AssetImage('assets/icons/user_profile.jpg'),fit: BoxFit.fitHeight)
        //   ),
        // ),
        centerTitle: true,
        backgroundColor: Color(0xff28B3D5),
        surfaceTintColor: Color(0xff28B3D5),
        automaticallyImplyLeading: false,
        title:CommonKhandText(
          title: "Followed MLAs",
          textColor: Color(0xffffffff),
          fontWeight: FontWeight.w300,
          fontSize: 17,
        ),
      ),

      body: GetBuilder<ChatController>(
        init: chatController,
        builder: (chatCtr) {
          return Container(
            height: screenHeight(context),
            width: screenWidth(context),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.112, 0.789, 1.0],
                colors: [
                  Color(0xFF000000), // Black
                  Color(0xFF3F3D3D), // Dark Grey
                  Color(0xFF606060), // Medium Grey
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (_, index) {
                  final user = users[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(
                              currentUserId: user.userId,
                              chattingWithUserId: user.chatWithUserId,
                              userName: user.name,
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                        decoration: BoxDecoration(
                          color: ColorUtils.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtils.red,
                                  image: DecorationImage(image: AssetImage('assets/icons/user_profile.jpg'),fit: BoxFit.fitHeight)
                              ),
                            ),
                            HorizontalSpace(width: 12),
                            SizedBox(
                              width: screenWidth(context)*0.55,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: user.name,
                                    fontSize: 15,
                                    textAlign: TextAlign.start,
                                    textColor: Color(0xff00ff00),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  if (user.lastMessage != null)
                                    MyText(
                                      text: user.lastMessage!,
                                      fontSize: 13,
                                      maxLine: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textColor: ColorUtils.colorWhite,
                                      fontWeight: FontWeight.w400,
                                    ),
                                ],
                              ),
                            ),
                            Spacer(),
                            if (user.lastTimestamp != null)
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: MyText(
                                  text: chatCtr.formatTime(user.lastTimestamp!),
                                  fontSize: 12,
                                  maxLine: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textColor: ColorUtils.colorWhite,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ) ;
        },
      ),
    );
  }
}
