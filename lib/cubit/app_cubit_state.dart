import 'package:equatable/equatable.dart';
import 'package:flutter_cubit/model/data_model.dart';

abstract class CubitStates extends Equatable{}
class InitialState extends CubitStates{

  @override
  // TODO: implement props
  List<Object> get props => [];

}
class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class LoadedState extends CubitStates{
  LoadedState (this.place);
  final List<DataModel>place;
  @override
  // TODO: implement props
  List<Object?> get props => [place];

}
class DetailState extends CubitStates{
  DetailState (this.place);
  final DataModel place;
  @override
  // TODO: implement props
  List<Object?> get props => [place];
}
