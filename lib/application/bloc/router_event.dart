part of 'router_bloc.dart';

@immutable
abstract class RouterEvent extends Equatable {
  const RouterEvent();

  @override
  List<Object> get props => [];
}

class ItemPressed extends RouterEvent {}
