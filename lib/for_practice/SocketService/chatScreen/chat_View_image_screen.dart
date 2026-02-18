import 'dart:io';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:flutter/material.dart';

class ChatViewImageScreen extends StatefulWidget {
  final String image ;
  const ChatViewImageScreen({super.key, required this.image});

  @override
  State<ChatViewImageScreen> createState() => _ChatViewImageScreenState();
}

class _ChatViewImageScreenState extends State<ChatViewImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xff000000),
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: (){Navigator.pop(context);},
          child: Container(
            height: 45,
            width: 45,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorUtils.white.withOpacity(0.3),
                // image: DecorationImage(image: AssetImage('assets/icons/user_profile.jpg'),fit: BoxFit.fitHeight)
            ),
            child: Center(
              child:Icon(Icons.arrow_back_ios,color: ColorUtils.white,),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        padding: const EdgeInsets.all(8.0),
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VerticalSpace(height: 140),
              Image.file(
                File(widget.image),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
