import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/BLE_Integration/HeartRateDisplay.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/BLE_Integration/ble_controller.dart';


class BleScreen extends StatelessWidget {
  final BleController controller = Get.put(BleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Smart Ring App")),
      body: Center(
        child: Obx(() {
          if (controller.connectedDevice.value == null) {
            return ElevatedButton(
              onPressed: controller.startScan,
              child: controller.isScanning.value ? Text("Scanning...") : Text("Connect to Ring"),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Connected: ${controller.connectedDevice.value!.name}"),
                SizedBox(height: 20),
                HeartRateDisplay(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.disconnect,
                  child: Text("Disconnect"),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
