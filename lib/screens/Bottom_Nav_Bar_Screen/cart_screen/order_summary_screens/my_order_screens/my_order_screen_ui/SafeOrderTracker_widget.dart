import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';

class SafeOrderTracker extends StatefulWidget {
  final Status status;
  final Color activeColor;
  final Color? inActiveColor;
  final TextStyle headingDateTextStyle;
  final TextStyle headingTitleStyle;
  final TextStyle subDateTextStyle;
  final TextStyle subTitleTextStyle;

  final List<TextDto> orderList;
  final List<TextDto> shippedList;
  final List<TextDto> outOfDeliveryList;
  final List<TextDto> deliveredList;

  const SafeOrderTracker({
    super.key,
    required this.status,
    required this.activeColor,
    required this.headingDateTextStyle,
    required this.headingTitleStyle,
    required this.subDateTextStyle,
    required this.subTitleTextStyle,
    required this.inActiveColor,
    required this.orderList,
    required this.shippedList,
    required this.outOfDeliveryList,
    required this.deliveredList,
  });

  @override
  _SafeOrderTrackerState createState() => _SafeOrderTrackerState();
}

class _SafeOrderTrackerState extends State<SafeOrderTracker> {
  @override
  Widget build(BuildContext context) {
    return TickerMode(
      enabled: mounted,
      child: OrderTracker(
        status: widget.status,
        activeColor: widget.activeColor,
        inActiveColor: widget.inActiveColor,
        headingDateTextStyle: widget.headingDateTextStyle,
        headingTitleStyle: widget.headingTitleStyle,
        subDateTextStyle: widget.subDateTextStyle,
        subTitleTextStyle: widget.subTitleTextStyle,
        orderTitleAndDateList: widget.orderList,
        shippedTitleAndDateList: widget.shippedList,
        outOfDeliveryTitleAndDateList: widget.outOfDeliveryList,
        deliveredTitleAndDateList: widget.deliveredList,
      ),
    );
  }
}
