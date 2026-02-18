import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/specials_deals_order_summary_screen.dart';

class UserCurrentAddress extends StatefulWidget {
  const UserCurrentAddress({super.key});

  @override
  State<UserCurrentAddress> createState() => _UserCurrentAddressState();
}

class _UserCurrentAddressState extends State<UserCurrentAddress> {
  // GoogleMapController? _mapController;
  // LatLng _initialPosition = const LatLng(28.6139, 77.2090); // Default: Delhi
  // bool _isLoading = true;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _getCurrentLocation();
  // }
  //
  // Future<void> _getCurrentLocation() async {
  //   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission != LocationPermission.whileInUse &&
  //         permission != LocationPermission.always) {
  //       return Future.error('Location permission not granted');
  //     }
  //   }
  //
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //
  //   setState(() {
  //     _initialPosition = LatLng(position.latitude, position.longitude);
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      appBar: AppBar(
        backgroundColor: ColorUtils.black,
        title: MyText(
          text: "Your Location",
          textColor: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      // body: _isLoading
      //     ? const Center(child: CircularProgressIndicator())
      //     : GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //     target: _initialPosition,
      //     zoom: 16,
      //   ),
      //   onMapCreated: (GoogleMapController controller) {
      //     _mapController = controller;
      //   },
      //   myLocationEnabled: true,
      //   myLocationButtonEnabled: true,
      //   compassEnabled: true,
      //   zoomControlsEnabled: false,
      //   mapType: MapType.normal,
      // ),
    );
  }
}