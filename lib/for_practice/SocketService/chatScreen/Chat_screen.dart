import 'dart:io';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatController/ChatProvider.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatModel/ChatMessage.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatScreen/chat_View_image_screen.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatSocketServices/SocketService.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ChatScreen extends StatefulWidget {
  final String currentUserId;
  final String chattingWithUserId;
  final String userName ;


  const ChatScreen({
    super.key,
    required this.currentUserId,
    required this.chattingWithUserId, required this.userName,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _controller = TextEditingController();
  late SocketService _socketService;
  final ChatController chatController = Get.put(ChatController());
  final ScrollController _scrollController = ScrollController();


  void _setupSocket() {
    _socketService = SocketService(userId: widget.currentUserId);
    _socketService.connect();

    _socketService.onMessageReceived((msg) {
      if ((msg.fromUserId == widget.chattingWithUserId && msg.toUserId == widget.currentUserId) ||
          (msg.fromUserId == widget.currentUserId && msg.toUserId == widget.chattingWithUserId)) {
          chatController.addMessage(msg);
      }
    });
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    final message = ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fromUserId: widget.currentUserId,
      toUserId: widget.chattingWithUserId,
      message: _controller.text.trim(),
      timestamp: DateTime.now(),
      image: '',
    );

    _socketService.sendMessage(message);
    chatController.addMessage(message);
    _controller.clear();
  }


  void _editMessage(ChatMessageModel msg, BuildContext context) {
    final editController = TextEditingController(text: msg.message);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: ColorUtils.white,
        surfaceTintColor: ColorUtils.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        title: Text("Edit Message"),
        content: TextField(
          controller: editController,
          cursorColor: ColorUtils.white.withOpacity(0.8),
          style: GoogleFonts.playfairDisplay(
            textStyle:  TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: ColorUtils.black.withOpacity(0.8),
            ),
          ),
          decoration: InputDecoration(
              hintText: 'Message',
              hintStyle: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorUtils.black.withOpacity(0.8),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelStyle: GoogleFonts.playfairDisplay(
                textStyle:  TextStyle(
                  fontSize: 16,
                  color:ColorUtils.black,
                ),
              )
          ),
        ),
        actionsAlignment: MainAxisAlignment.start,
        titleTextStyle: GoogleFonts.playfairDisplay(color: ColorUtils.black,fontSize: 20,fontWeight: FontWeight.w600),
        titlePadding:EdgeInsets.only(left: 12,right: 12,bottom: 15,top: 15),
        contentPadding: EdgeInsets.only(left: 12,right: 12),
        actionsPadding: EdgeInsets.only(left: 8,right: 12,bottom: 20),
        actions: [
          TextButton(
              child:  MyText(
                text: 'Cancel',
                fontSize: 15,
                textColor: ColorUtils.black,
                fontWeight: FontWeight.w600,
              ),
              onPressed: () => Navigator.pop(context)
          ),
          TextButton(
              child:  MyText(
                text: 'Save',
                fontSize: 15,
                textColor: ColorUtils.black,
                fontWeight: FontWeight.w600,
              ),
              onPressed: () {
                chatController.editMessage(msg.id, editController.text);
                Navigator.pop(context);
              }
              ),
        ],
      ),
    );
  }

  Future<void> _sendImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageMsg = ChatMessageModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        fromUserId: widget.currentUserId,
        toUserId: widget.chattingWithUserId,
        message: _controller.text.trim(),
        timestamp: DateTime.now(),
        image: pickedFile.path,
      );

      _socketService.sendMessage(imageMsg);
      chatController.addMessage(imageMsg);
    }
  }

  @override
  void initState() {
    super.initState();
    _setupSocket() ;
    chatController.initialize(currentUser: widget.currentUserId, chattingWithUser: widget.chattingWithUserId);
  }

  @override
  void dispose() {
    _socketService.dispose();
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    chatController.initialize(currentUser: widget.currentUserId, chattingWithUser: widget.chattingWithUserId);
    _setupSocket();
    return Scaffold(
      resizeToAvoidBottomInset: true,
     backgroundColor: Color(0xff000000),
      appBar: AppBar(
        elevation: 4,
        leading: Container(
          height: 30,
          width: 30,
          margin: const EdgeInsets.only(left: 12),
          padding: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
              color: ColorUtils.colorWhite.withOpacity(0.2),
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
        centerTitle: true,
        // backgroundColor: Color(0xff28B3D5),
        // surfaceTintColor: Color(0xff28B3D5),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: MyText(
          text: widget.userName,
          fontSize: 17,
          textAlign: TextAlign.center,
          textColor: Color(0xffffffff),
          fontWeight: FontWeight.w300,
        ),
      ),
      body: Container(
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
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                });
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: chatController.messages.length,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemBuilder: (_, index) {
                    final msg = chatController.messages[index];
                    final isMe = msg.fromUserId == widget.currentUserId;
                    return GestureDetector(
                      onLongPress: () {
                        if (isMe) {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(8)),
                              context: context,
                              builder: (_) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                      leading: Icon(Icons.edit),
                                      title:  CommonKhandText(
                                        title: 'Edit',
                                        fontSize: 15,
                                        textColor: ColorUtils.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                        _editMessage(msg, context);
                                      }),
                                  ListTile(
                                      leading: Icon(Icons.delete,),
                                      title:  CommonKhandText(
                                        title: 'Delete',
                                        fontSize: 15,
                                        textColor: ColorUtils.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      onTap: () {
                                        chatController.deleteMessage(msg.id);
                                        Navigator.pop(context);
                                      }),
                                ],
                              )
                          );
                        }
                      },
                      child: Container  (
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Column(
                          crossAxisAlignment:isMe? CrossAxisAlignment.end :CrossAxisAlignment.start,
                          children: [
                            VerticalSpace(height:2),
                            if (msg.image != null && msg.image!.isNotEmpty)
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                                ),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient:isMe? LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF6956CB),
                                      Color(0xFF744FCE),
                                    ],
                                  ):LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      ColorUtils.colorWhite.withOpacity(0.15),
                                      ColorUtils.colorWhite.withOpacity(0.15)
                                      // Color(0xFF6956CB).withOpacity(0.5),
                                      // Color(0xFF744FCE).withOpacity(0.5),
                                    ],
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap:(){
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: ChatViewImageScreen(
                                          image : msg.image!
                                      ),
                                      withNavBar: false,
                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:isMe? CrossAxisAlignment.end :CrossAxisAlignment.end,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: SizedBox(
                                          height: 150,
                                          width:MediaQuery.of(context).size.width * 0.7 ,
                                          child: Image.file(
                                            File(msg.image!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      VerticalSpace(height: 5),
                                      CommonKhandText(
                                        title: DateFormat('hh:mm a').format(msg.timestamp),
                                        fontSize: 10,
                                        textColor: ColorUtils.colorWhite ,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            VerticalSpace(height:2),
                            if (msg.message.isNotEmpty)

                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                                ),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient:isMe? LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF6956CB),
                                      Color(0xFF744FCE),
                                    ],
                                  ):LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      ColorUtils.colorWhite.withOpacity(0.15),
                                      ColorUtils.colorWhite.withOpacity(0.15)
                                      // Color(0xFF6956CB).withOpacity(0.5),
                                      // Color(0xFF744FCE).withOpacity(0.5),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:isMe? CrossAxisAlignment.end :CrossAxisAlignment.end,
                                  children: [
                                    CommonKhandText(
                                      title: msg.message ,
                                      fontSize: 14,
                                      textColor: isMe ? ColorUtils.white : ColorUtils.white ,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonKhandText(
                                      title: DateFormat('hh:mm a').format(msg.timestamp),
                                      fontSize: 10,
                                      textColor: ColorUtils.colorWhite ,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            SizedBox(height: 4),
                          ],
                        ),
                      ),
                    );
                  },
                ) ;
              }),
            ),
           Padding(
             padding: EdgeInsets.all(10),
             child:  Row(
               children: [
                 Expanded(
                     flex: 4,
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(100),
                         border: Border.all(color: ColorUtils.colorWhite.withOpacity(0.2)),
                         gradient: LinearGradient(
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           colors: [
                             Color(0xFF3D61AD),
                             Color(0xFF93BCE0),
                           ],
                         ),
                       ),
                       height: 52,
                       child: TextField(
                         controller: _controller,
                         cursorColor: ColorUtils.colorWhite,
                         style: GoogleFonts.playfairDisplay(
                           textStyle:  TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w300,
                             color: ColorUtils.colorWhite,
                           ),
                         ),
                         decoration: InputDecoration(
                             suffixIcon: InkWell(
                                 onTap: _sendImage,
                                 child: Container(
                                     padding:EdgeInsets.all(7),
                                   decoration: BoxDecoration(
                                     color: ColorUtils.black,
                                     shape: BoxShape.circle
                                   ),
                                   height: 30,
                                   width: 30,
                                     child: Image(image: AssetImage('assets/icons/gallery_icon.png',),height: 20,)
                                 )
                             ),
                             hintText: 'Type a message',
                             hintStyle: GoogleFonts.playfairDisplay(
                               textStyle: TextStyle(
                                 fontSize: 14,
                                 fontWeight: FontWeight.w600,
                                 color: ColorUtils.colorWhite,
                               ),
                             ),
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(100),
                               borderSide: BorderSide(color: Colors.transparent),
                             ),
                             focusedBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(100),
                               borderSide: BorderSide(color: Colors.transparent),
                             ),
                             floatingLabelBehavior: FloatingLabelBehavior.auto,
                             labelStyle: GoogleFonts.playfairDisplay(
                               textStyle:  TextStyle(
                                 fontSize: 14,
                                 color:ColorUtils.white,
                               ),
                             )
                         ),
                       ),
                     )
                 ),
                 HorizontalSpace(width: 8),
                 InkWell(
                     onTap: _sendMessage,
                     child: Container(
                         padding:EdgeInsets.all(8),
                         height: 52,
                         width: 52,
                         decoration: BoxDecoration(
                           border: Border.all(color: ColorUtils.colorWhite.withOpacity(0.2)),
                           shape: BoxShape.circle,
                           gradient: RadialGradient(
                             colors: [
                               Color(0xFF93BCE0),
                               Color(0xFF3D61AD),
                             ],
                             center: Alignment.center,
                             radius: 0.8,
                           ),
                         ),
                         child: Image(image: AssetImage('assets/icons/message_send.png',),height: 20,)
                     )
                 )
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}

