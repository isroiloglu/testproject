import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'router_event.dart';

part 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(RouterInitial());

  @override
  Stream<RouterState> mapEventToState(
    RouterEvent event,
  ) async* {
    if (event is ItemPressed) {
      yield* _openProcess(event);
    }
  }

  Stream<RouterState> _openProcess(ItemPressed event) async* {
    yield PageOpened();
  }
}
