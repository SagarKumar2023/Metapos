import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/get_category_screen/get_category_screen.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';

class HiveDatabaseS1 extends StatefulWidget {
  const HiveDatabaseS1({super.key});

  @override
  State<HiveDatabaseS1> createState() => _HiveDatabaseS1State();
}

class _HiveDatabaseS1State extends State<HiveDatabaseS1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorUtils.white,
        backgroundColor: ColorUtils.white,
        centerTitle: true,
        title:MyText(
          text: 'Hive Database Screen One',
          fontSize: 16,
          // textAlign: TextAlign.start,
          textColor: ColorUtils.black,
          softSwap: true,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.visible,
        ),
      ),
      body: Container(
        height: screenHeight(context),
        padding: EdgeInsets.all(10),
        // margin: EdgeInsets.all(12),
        width: screenWidth(context),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment(0.12, -1.0),
            end: Alignment(-1.0, 1.0),
            colors: [
              Color(0xFF965DE9),
              Color(0xFF6358EE),
            ],
            stops: [0.108, 0.943],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// Ui me hive dataBase me store dato ko display karne ke liye 
              FutureBuilder(
                future: Hive.openBox('Sagar'),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      AllCategoriesText(
                        title: 'Name',
                        discription:snapshot.data!.get('Name').toString(),
                      ),
                      AllCategoriesText(
                        title: 'Age',
                        discription:snapshot.data!.get('Age').toString(),
                      ),
                      AllCategoriesText(
                        title: 'Profession',
                        discription:snapshot.data!.get('details')['Profession'].toString(),
                      ),
                      AllCategoriesText(
                        title: 'Working At',
                        discription:snapshot.data!.get('details')['Working At'].toString(),
                      ),
                    ],
                  );
                },
              ),
              VerticalSpace(height: 100),
              // Spacer(),
              MyButton(
                  navigateTo: ()async{
                    var box = await Hive.openBox('Sagar'); /// directory create karne ke liye.
                    box.put('Name','Sagar kumar'); /// Data store karne ke liye.
                    box.put('Age','23');
                    box.put('details',{
                      'Profession':'App Developer',
                      'Working At': 'CodegenIt',        /// Object  Data store karne ke liye.
                      'Experience':'Two Year'
                    });
                    print(box.get('Name'));
                    print(box.get('Age'));
                    print(box.get('details'));
                    print(box.get('details')['Profession']);  /// Object particular Data hi chaiye uske liye
                  },
                  buttonName: 'Add Data in Hive '
              ),
              VerticalSpace(height: 20),
              MyButton(
                 navigateTo: (){
                   // Navigator.push(context,MaterialPageRoute(builder: (context) =>HiveDatabaseS2(),));
                 },
                  buttonName: 'HiveDatabaseS2'
              ),
              VerticalSpace(height: 20),

              MyButton(
                  navigateTo: (){
                    // Navigator.push(context,MaterialPageRoute(builder: (context) =>UserScreen(),));
                  },
                  buttonName: 'user screen'
              )
            ],
          ),
        ),
      ),
    );
  }
}
