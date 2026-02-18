import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/hive_database_practice/Hive_model/note_model.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/TextField_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDatabaseS2 extends StatefulWidget {
  const HiveDatabaseS2({super.key});

  @override
  State<HiveDatabaseS2> createState() => _HiveDatabaseS2State();
}

class _HiveDatabaseS2State extends State<HiveDatabaseS2> {
  TextEditingController titleCtr = TextEditingController();
  TextEditingController descCtr = TextEditingController();
  TextEditingController editTitleCtr = TextEditingController();
  TextEditingController editDescCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorUtils.white,
        backgroundColor: ColorUtils.white,
        centerTitle: true,
        title:MyText(
          text: 'Hive Database Screen Two',
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
        // margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(10),
        width: screenWidth(context),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          // gradient: LinearGradient(
          //   begin: Alignment(0.12, -1.0),
          //   end: Alignment(-1.0, 1.0),
          //   colors: [
          //     Color(0xFF965DE9),
          //     Color(0xFF6358EE),
          //   ],
          //   stops: [0.108, 0.943],
          // ),
        ),
        child: Column(
          children: [
            MyTextField(
              controller: titleCtr,
              borderRadius: 10,
              hintText: "Title",
              keyboardType: TextInputType.emailAddress,
            ),
            VerticalSpace(height: 10),
            MyTextField(
              controller: descCtr,
              borderRadius: 10,
              hintText: "Description",
              keyboardType: TextInputType.emailAddress,
            ),
            VerticalSpace(height: 10),
            MyButton(
              buttonColor: ColorUtils.primaryColor,
                navigateTo: (){
                if(titleCtr.text.isNotEmpty && descCtr.text.isNotEmpty){
                  final data = NotesModel(title: titleCtr.text.toString(), description: descCtr.text);
                  final box = HiveBoxes.noteBox();
                  box.add(data) ;
                  titleCtr.clear();
                  descCtr.clear();
                }
                },
                buttonName: 'Save'
            ),
            VerticalSpace(height: 10),

            ValueListenableBuilder<Box<NotesModel>>(
                valueListenable: HiveBoxes.noteBox().listenable(),
                builder: (context, box, child) {
                  var data = box.values.toList().cast<NotesModel>();
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: box.length,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: ColorUtils.black,width: 1.3)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: data[index].title,
                                  fontSize: 14,
                                  // textAlign: TextAlign.start,
                                  textColor: ColorUtils.black,
                                  softSwap: true,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.visible,
                                ),
                                MyText(
                                  text: data[index].description,
                                  fontSize: 14,
                                  // textAlign: TextAlign.start,
                                  textColor: ColorUtils.black,
                                  softSwap: true,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: (){
                                  _editDialog(data[index], data[index].title, data[index].description);
                                }, icon:Icon(Icons.edit),color: ColorUtils.black,),
                                IconButton(onPressed: (){delete(data[index]);}, icon:Icon(Icons.delete),color: ColorUtils.red,)
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
  void delete(NotesModel notesModel)async{
    return notesModel.delete();
  }

  Future<void> _editDialog(NotesModel notesModel,String title,String description)async{
    return showDialog(context: context,
      builder:(context) {
         return AlertDialog(
           backgroundColor: ColorUtils.white,
           surfaceTintColor: ColorUtils.white,
           title: Text('Edit Note'),
           content: SingleChildScrollView(
             child:  Column(
               children: [
                 MyTextField(
                   controller: editTitleCtr,
                   borderRadius: 10,
                   hintText: "Title",
                   keyboardType: TextInputType.emailAddress,
                 ),
                 VerticalSpace(height: 10),
                 MyTextField(
                   controller: editDescCtr,
                   borderRadius: 10,
                   hintText: "Description",
                   keyboardType: TextInputType.emailAddress,
                 ),
               ],
             ),
           ),
           actions: [
             TextButton(
                 onPressed: (){
                   Navigator.pop(context);
                 },
                 child:  MyText(
                   text: 'Cancel',
                   fontSize: 14,
                   // textAlign: TextAlign.start,
                   textColor: ColorUtils.black,
                   softSwap: true,
                   fontWeight: FontWeight.bold,
                   overflow: TextOverflow.visible,
                 )
             ),
             TextButton(
                 onPressed: (){
                   notesModel.title = editTitleCtr.text ;
                   notesModel.description = editDescCtr.text ;
                   if(editTitleCtr.text.isNotEmpty && editDescCtr.text.isNotEmpty){
                     notesModel.save();
                     editTitleCtr.clear();
                     editDescCtr.clear();
                     Navigator.pop(context);
                   }

                 },
                 child:  MyText(
                   text: 'Save',
                   fontSize: 14,
                   // textAlign: TextAlign.start,
                   textColor: ColorUtils.black,
                   softSwap: true,
                   fontWeight: FontWeight.bold,
                   overflow: TextOverflow.visible,
                 )
             )
           ],
         );
      },
    );
  }
}
