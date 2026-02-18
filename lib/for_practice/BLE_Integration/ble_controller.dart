import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BleController extends GetxController {
  var isScanning = false.obs;
  var connectedDevice = Rx<BluetoothDevice?>(null);
  var heartRate = 0.obs;

  final String ringDeviceName = "Altipase";
  final Guid heartRateCharUUID = Guid("00002a37-0000-1000-8000-00805f9b34fb");

  Future<void> requestPermissions() async {
    await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location
    ].request();
  }

  void startScan() async {
    await requestPermissions();

    isScanning.value = true;
    FlutterBluePlus.startScan(timeout: Duration(seconds: 5));
    FlutterBluePlus.scanResults.listen((results) async {
      for (ScanResult r in results) {
        if (r.device.name == ringDeviceName) {
          FlutterBluePlus.stopScan();
          connectedDevice.value = r.device;
          await r.device.connect();
          discoverServices(r.device);
          break;
        }
      }
    });
  }

  void discoverServices(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    for (var service in services) {
      for (var characteristic in service.characteristics) {
        if (characteristic.uuid == heartRateCharUUID) {
          await characteristic.setNotifyValue(true);
          characteristic.onValueReceived.listen((value) {
            if (value.isNotEmpty) {
              heartRate.value = value[1];
            }
          });
        }
      }
    }
  }

  void disconnect() {
    connectedDevice.value?.disconnect();
    connectedDevice.value = null;
    heartRate.value = 0;
  }
}
