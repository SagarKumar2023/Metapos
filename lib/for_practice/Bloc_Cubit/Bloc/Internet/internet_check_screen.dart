import 'package:flutter/material.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/Bloc_Cubit/Cubit/internet_cubit.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';

class InternetCheckScreen extends StatelessWidget {
  const InternetCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: MyText(text: 'USING BLOC ',textColor: ColorUtils.colorWhite,),),
      // body: Container(
      //   height: screenHeight(context),
      //   width: screenWidth(context),
      //   color: ColorUtils.colorBlack,
      //   child: Center(
      //     child: BlocConsumer<InternetBloc,InternetState>(
      //       builder: (context, state) {
      //         if(state is  InternetGainedState){
      //           return MyText(text: 'Internet Connected!',textColor: ColorUtils.colorWhite,);
      //         }else if(state is InternetLostState){
      //          return  MyText(text: 'Internet not Connected!',textColor: ColorUtils.colorWhite,);
      //         }else{
      //          return MyText(text: 'Loading...',textColor: ColorUtils.colorWhite,);
      //         }
      //       },
      //
      //       listener: (context, state) {
      //         if(state is InternetGainedState){
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             SnackBar(content: MyText(text: 'Internet Connected!',textColor: ColorUtils.colorWhite,),backgroundColor: ColorUtils.green,)
      //           );
      //         }else if(state is InternetLostState){
      //           ScaffoldMessenger.of(context).showSnackBar(
      //               SnackBar(content: MyText(text: 'Internet not Connected!',textColor: ColorUtils.colorWhite,),backgroundColor: ColorUtils.red,)
      //           );
      //         }
      //       },
      //     )
      //   ),
      // ),
      appBar: AppBar(title: MyText(text: ' CUBIT',textColor: ColorUtils.colorBlack,),),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        color: ColorUtils.colorBlack,
        child: Center(
            // child: BlocConsumer<InternetCubit,MyInternetState>(
            //   builder: (context, state) {
            //     if(state == MyInternetState.Gained){
            //       return MyText(text: 'Internet Connected!',textColor: ColorUtils.colorWhite,);
            //     }else if(state == MyInternetState.Lost){
            //       return  MyText(text: 'Internet not Connected!',textColor: ColorUtils.colorWhite,);
            //     }else{
            //       return MyText(text: 'Loading...',textColor: ColorUtils.colorWhite,);
            //     }
            //   },
            //
            //   listener: (context, state) {
            //     if(state == MyInternetState.Gained){
            //       ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(content: MyText(text: 'Internet Connected!',textColor: ColorUtils.colorWhite,),backgroundColor: ColorUtils.green,)
            //       );
            //     }else if(state == MyInternetState.Lost){
            //       ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(content: MyText(text: 'Internet not Connected!',textColor: ColorUtils.colorWhite,),backgroundColor: ColorUtils.red,)
            //       );
            //     }
            //   },
            // )
          child: BlocConsumer<InternetCubit, MyInternetState>(
            listener: (context, state) {
              if (state == MyInternetState.gained) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: MyText(
                      text: 'Internet Connected!',
                      textColor: ColorUtils.colorWhite,
                    ),
                    backgroundColor: ColorUtils.green,
                  ),
                );
              } else if (state == MyInternetState.lost) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: MyText(
                      text: 'Internet not Connected!',
                      textColor: ColorUtils.colorWhite,
                    ),
                    backgroundColor: ColorUtils.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state == MyInternetState.gained) {
                return MyText(
                  text: 'Internet Connected!',
                  textColor: ColorUtils.colorWhite,
                );
              } else if (state == MyInternetState.lost) {
                return MyText(
                  text: 'Internet not Connected!',
                  textColor: ColorUtils.colorWhite,
                );
              } else {
                return MyText(
                  text: 'Loading...',
                  textColor: ColorUtils.colorWhite,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
