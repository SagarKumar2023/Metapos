import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/cart_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/cart_screen_arrowBack_button_source.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/my_order_screens/my_order_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Home_screen.dart';


class BNBScreen extends StatefulWidget {
  const BNBScreen({super.key});

  @override
  State<BNBScreen> createState() => _BNBScreenState();
}

class _BNBScreenState extends State<BNBScreen> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      MyOrderScreen(),
      CartScreen(source: CartScreenArrowbackButtonSource.hideIcon,),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: ColorUtils.black,
      ),
      // PersistentBottomNavBarItem(
      //   icon: const Icon(Icons.favorite_border),
      //   title: "Favourite",
      //   activeColorPrimary: Colors.blue,
      //   inactiveColorPrimary: Colors.grey,
      // ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.reorder),
        title: "Order",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: ColorUtils.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_shopping_cart),
        title: "Cart",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: ColorUtils.black,
      ),
      // PersistentBottomNavBarItem(
      //   icon: const Icon(Icons.person),
      //   title: "Profile",
      //   activeColorPrimary: Colors.blue,
      //   inactiveColorPrimary: Colors.grey,
      // ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: PersistentTabView(
        resizeToAvoidBottomInset: true,
        decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, -3),
            ),
          ],
        ),
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}


