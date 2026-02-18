import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: ColorUtils.colorBlack.withOpacity(0.4),
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(12,6,12,6),
            child: LoadingAnimationWidget.threeArchedCircle(
              size: 50, color: ColorUtils.primaryColor,
            ),
          ),
        ));
  }
}