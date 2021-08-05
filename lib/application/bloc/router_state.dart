part of 'router_bloc.dart';

@immutable
abstract class RouterState extends Equatable {
  const RouterState();

  @override
  List<Object> get props => [];
}

class PageOpened extends RouterState {}

class RouterInitial extends RouterState {}
