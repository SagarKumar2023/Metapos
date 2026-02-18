import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';

class TraditionalGourmetLargeViewScreen extends StatefulWidget {
  const TraditionalGourmetLargeViewScreen({super.key});

  @override
  State<TraditionalGourmetLargeViewScreen> createState() => _TraditionalGourmetLargeViewScreenState();
}

class _TraditionalGourmetLargeViewScreenState extends State<TraditionalGourmetLargeViewScreen> {
  String? firstHalfSelect;
  String? secondHalfSelect;
  String? selectedFirstHalfData;
  String? selectedSecondHalfData;
  final List<String> firstHalfSelectedAddons = [];
  final List<String> secondHalfSelectedAddons = [];
  final List<String> firstHalfRemoveSelected = [];
  final List<String> secondHalfRemoveSelected = [];

  final List<String> firstHalfData = [
    'Aussie (Large)  \$22.00', 'Pepperoni (Large)  \$22.00',
    'Hawaiian (Large) \$22.00', 'Aussie (Large)  \$258.00',
    'Aussie (Large)  \$278.00', 'AL Fresco \$24.00','Tandoori Chicken (Large) \$24.00',
    'Moroccan Lamb (Large) \$24.00',
  ];

  final List<String> secondHalfData = [
    'Aussie (Large)  \$22.00', 'Pepperoni (Large)  \$22.00',
    'Hawaiian (Large) \$22.00', 'Aussie (Large)  \$258.00',
    'Aussie (Large)  \$278.00', 'AL Fresco \$24.00','Tandoori Chicken (Large) \$24.00',
    'Moroccan Lamb (Large) \$24.00',
  ];

  final List<String> firstHalfAddonsData = [
    'Anchovies \$2.00', 'Avocado \$2.00', 'Bacon \$2.00', 'BBQ Sauce \$2.00', 'Capsicum \$2.00',
    'cHICKEN \$2.00','Chirozo sausage \$2.00', 'Mozarella \$2.00',
  ];

  final List<String> secondHalfAddonsData = [
    'Anchovies \$2.00', 'Avocado \$2.00', 'Bacon \$2.00', 'BBQ Sauce \$2.00', 'Capsicum \$2.00',
    'cHICKEN \$2.00','Chirozo sausage \$2.00', 'Mozarella \$2.00',
  ];

  final List<String> firstHalfRemoveData = [
    'Capsicum', 'Ham','Mozzarella','Mushrooms','Olives','Onions','Pepperoni','Tomatoes'
  ];

  final List<String> secondHalfRemoveData = [
    'Capsicum', 'Ham','Mozzarella','Mushrooms','Olives','Onions','Pepperoni','Tomatoes'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      bottomSheet: Container(
        height: 80,
        padding: EdgeInsets.only(top: 10,bottom: 10,right: 14,left: 14),
        width: screenWidth(context),
        decoration: BoxDecoration(
          color: ColorUtils.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: MyButton(
            buttonColor: Colors.red,
            navigateTo: (){},
            buttonName: 'Add To Cart'
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            // toolbarHeight: 0,
            backgroundColor: ColorUtils.black,
            expandedHeight: 200,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: MyText(
                text: 'Traditional/Gourmet(Large)',
                fontSize: 20,
                textColor: ColorUtils.white,
                softSwap: true,
                overflow: TextOverflow.visible,
                fontWeight: FontWeight.bold,
              ),

              background: Container(
                height: 200,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/pizza_view.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  height: 200,
                  padding: EdgeInsets.only(left: 12,right: 12,bottom: 40),
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                    color: ColorUtils.black.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){Navigator.pop(context);},
                              child: Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: ColorUtils.black.withOpacity(0.3), width: 0.7),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 6,
                                      offset: Offset(2, 4),
                                    ),
                                  ],
                                ),
                                child: Icon(Icons.arrow_back_ios),
                              ),
                            ),
                            Container()
                            // Container(
                            //   height: 30,
                            //   width: 30,
                            //   decoration: BoxDecoration(
                            //       color: ColorUtils.white,
                            //       borderRadius: BorderRadius.circular(4),
                            //       image: DecorationImage(image: AssetImage('assets/icons/veg.png'),fit: BoxFit.fill)
                            //   ),
                            // ),
                          ],
                        ),
                        Spacer(),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     MyText(
                        //       text: 'Traditional(Large)',
                        //       fontSize: 35,
                        //       textColor: ColorUtils.white,
                        //       softSwap: true,
                        //       overflow: TextOverflow.visible,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate:SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'First Half',
                            fontSize: 20,
                            textColor: ColorUtils.black,
                            softSwap: true,
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            text: 'Please choose 1 item from the list below',
                            fontSize: 14,
                            textColor: ColorUtils.red,
                            softSwap: true,
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.w400,
                          ),
                          VerticalSpace(height: 15),

                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: firstHalfData.map((label) {
                              final isSelected = selectedFirstHalfData == label;
                              return firstHalfWidget(
                                label: label,
                                isSelected: isSelected,
                                onTap: () {
                                  setState(() {
                                    selectedFirstHalfData = label;
                                  });
                                },
                              );
                            }).toList(),
                          ),

                          VerticalSpace(height: 15),
                          if(selectedFirstHalfData!=null)
                          Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             MyText(
                               text: 'Addons:',
                               fontSize: 20,
                               textColor: ColorUtils.black,
                               fontWeight: FontWeight.w700,
                             ),
                             VerticalSpace(height: 15),
                             Wrap(
                               spacing: 8,
                               runSpacing: 8,
                               children: firstHalfAddonsData.map((label) {
                                 final isSelected = firstHalfSelectedAddons.contains(label);
                                 return firstHalfAddonsWidget(
                                   label: label,
                                   isSelected: isSelected,
                                   onTap: () {
                                     setState(() {
                                       isSelected
                                           ? firstHalfSelectedAddons.remove(label)
                                           : firstHalfSelectedAddons.add(label);
                                     });
                                   },
                                 );
                               }).toList(),
                             ),
                             VerticalSpace(height: 15),

                             MyText(
                               text: 'Remove:',
                               fontSize: 20,
                               textColor: ColorUtils.black,
                               fontWeight: FontWeight.w700,
                             ),
                             VerticalSpace(height: 15),
                             Wrap(
                               spacing: 8,
                               runSpacing: 8,
                               children: firstHalfRemoveData.map((label) {
                                 final isSelected = firstHalfRemoveSelected.contains(label);
                                 return removeWidget(
                                   label: label,
                                   isSelected: isSelected,
                                   onTap: () {
                                     setState(() {
                                       isSelected
                                           ? firstHalfRemoveSelected.remove(label)
                                           : firstHalfRemoveSelected.add(label);
                                     });
                                   },
                                 );
                               }).toList(),
                             ),
                             VerticalSpace(height: 15),
                           ],
                         ),

                          MyText(
                            text: 'Second Half',
                            fontSize: 20,
                            textColor: ColorUtils.black,
                            fontWeight: FontWeight.w700,
                          ),
                          MyText(
                            text: 'Please choose 1 item from the list below',
                            fontSize: 14,
                            textColor: ColorUtils.red,
                            softSwap: true,
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.w400,
                          ),
                          VerticalSpace(height: 15),

                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: secondHalfData.map((label) {
                              final isSelected = selectedSecondHalfData == label;
                              return firstHalfWidget(
                                label: label,
                                isSelected: isSelected,
                                onTap: () {
                                  setState(() {
                                    selectedSecondHalfData = label;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                          if(selectedSecondHalfData!=null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                VerticalSpace(height: 15),

                                MyText(
                                  text: 'Addons:',
                                  fontSize: 20,
                                  textColor: ColorUtils.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                VerticalSpace(height: 15),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: secondHalfAddonsData.map((label) {
                                    final isSelected = secondHalfSelectedAddons.contains(label);
                                    return firstHalfAddonsWidget(
                                      label: label,
                                      isSelected: isSelected,
                                      onTap: () {
                                        setState(() {
                                          isSelected
                                              ? secondHalfSelectedAddons.remove(label)
                                              : secondHalfSelectedAddons.add(label);
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                                VerticalSpace(height: 15),

                                MyText(
                                  text: 'Remove:',
                                  fontSize: 20,
                                  textColor: ColorUtils.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                VerticalSpace(height: 15),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: secondHalfRemoveData.map((label) {
                                    final isSelected = secondHalfRemoveSelected.contains(label);
                                    return removeWidget(
                                      label: label,
                                      isSelected: isSelected,
                                      onTap: () {
                                        setState(() {
                                          isSelected
                                              ? secondHalfRemoveSelected.remove(label)
                                              : secondHalfRemoveSelected.add(label);
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                                VerticalSpace(height: 15),
                              ],
                            ),
                          VerticalSpace(height: 80),
                        ],
                      ),
                    )
                  ]
              )
          )
        ],
      ),
    );
  }

  Widget firstHalfWidget({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: isSelected ? ColorUtils.green : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected ? Colors.transparent : ColorUtils.black,
          ),
        ),
        child: MyText(
          text: label,
          fontSize: 16,
          textColor: isSelected ? ColorUtils.white : ColorUtils.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }


  Widget firstHalfAddonsWidget({required String label, required bool isSelected, required VoidCallback onTap,}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: isSelected ? ColorUtils.green : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected ? Colors.transparent : ColorUtils.black,
          ),
        ),
        child: MyText(
          text: label,
          fontSize: 16,
          textColor: isSelected ? ColorUtils.white : ColorUtils.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget secondHalfWidget({required String label,}) {
    bool isSelected = secondHalfSelect == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          secondHalfSelect = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
            color: isSelected ? ColorUtils.green : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border:  Border.all(color: isSelected?Colors.transparent:ColorUtils.black)
        ),
        child: MyText(
          text: label,
          fontSize: 16,
          textColor: isSelected?ColorUtils.white:ColorUtils.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget secondHalfAddonsWidget({required String label, required bool isSelected, required VoidCallback onTap,}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: isSelected ? ColorUtils.green : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected ? Colors.transparent : ColorUtils.black,
          ),
        ),
        child: MyText(
          text: label,
          fontSize: 16,
          textColor: isSelected ? ColorUtils.white : ColorUtils.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget removeWidget({required String label, required bool isSelected, required VoidCallback onTap,}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange[700] : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected ? Colors.transparent : ColorUtils.black,
          ),
        ),
        child: MyText(
          text: label,
          fontSize: 16,
          textColor: isSelected ? ColorUtils.white : ColorUtils.black,
          fontWeight: FontWeight.w500,
          textDecoration:isSelected?TextDecoration.lineThrough:TextDecoration.none,

        ),
      ),
    );
  }
}
