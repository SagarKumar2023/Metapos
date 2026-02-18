// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:metapos_sync_order_online_ofline/Bloc_Cubit/Bloc/Internet/internet_event.dart';
// import 'package:metapos_sync_order_online_ofline/Bloc_Cubit/Bloc/Internet/internet_state.dart';
//
// class InternetBloc extends Bloc<InternetEvent,InternetState>{
//
//   Connectivity _connectivity = Connectivity();
//   StreamSubscription? connectivitySubscription ;
//
//   InternetBloc(): super(InternetInitialState()){
//     on<InternetLostEvent>((event, emit) => emit(InternetLostState()),);
//     on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()),);
//
//     connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
//       if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
//         add(InternetGainedEvent());
//       }else{
//         add(InternetLostEvent());
//       }
//     });
//   }
//
//   @override
//   Future<void> close() {
//     connectivitySubscription!.cancel();
//     return super.close();
//   }
// }

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/Bloc_Cubit/Bloc/Internet/internet_event.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/Bloc_Cubit/Bloc/Internet/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((results) {
          // results is now a List<ConnectivityResult>
          final result = results.isNotEmpty ? results.first : ConnectivityResult.none;

          if (result == ConnectivityResult.mobile ||
              result == ConnectivityResult.wifi) {
            add(InternetGainedEvent());
          } else {
            add(InternetLostEvent());
          }
        });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}

