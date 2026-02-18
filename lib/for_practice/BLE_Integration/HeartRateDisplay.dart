import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/BLE_Integration/ble_controller.dart';

class HeartRateDisplay extends StatelessWidget {
  final BleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
      "Heart Rate: ${controller.heartRate.value} bpm",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ));
  }
}
