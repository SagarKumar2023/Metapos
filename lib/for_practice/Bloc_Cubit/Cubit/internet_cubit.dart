// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:connectivity/connectivity.dart';
//
// enum MyInternetState{initial,Lost,Gained}
//
// class InternetCubit extends Cubit<MyInternetState>{
//
//   Connectivity _connectivity =Connectivity();
//   StreamSubscription? connectivitySubscription ;
//
//   InternetCubit(): super(MyInternetState.initial){
//
//     connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
//       if(result == ConnectivityResult.mobile || result ==  ConnectivityResult.wifi){
//         emit(MyInternetState.Gained);
//       }else{
//         emit(MyInternetState.Lost);
//       }
//     });
//   }
//
//   @override
//   Future<void> close() {
//     connectivitySubscription!.cancel() ;
//     return super.close();
//   }
// }

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum MyInternetState { initial, lost, gained }

class InternetCubit extends Cubit<MyInternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? connectivitySubscription;

  InternetCubit() : super(MyInternetState.initial) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((results) {
          final result = results.isNotEmpty ? results.first : ConnectivityResult.none;

          if (result == ConnectivityResult.mobile ||
              result == ConnectivityResult.wifi) {
            emit(MyInternetState.gained);
          } else {
            emit(MyInternetState.lost);
          }
        });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}


