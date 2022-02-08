import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_state.dart';
import 'package:flutter_cubit/model/data_model.dart';
import 'package:flutter_cubit/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
      late final place;
     void getData() async {
        try{
          emit(LoadingState());
          place = await  data.getInfo();
          emit(LoadedState(place));
        }  catch(e){
    }
}
detailPage(DataModel data){
       emit(DetailState(data));
}
goHome(){
       emit(LoadedState(place));
}
}