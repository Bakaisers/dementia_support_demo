import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_memoir_event.dart';
part 'my_memoir_state.dart';

class MyMemoirBloc extends Bloc<MyMemoirEvent, MyMemoirState> {
  MyMemoirBloc() : super(MyMemoirInitial());

  @override
  Stream<MyMemoirState> mapEventToState(
    MyMemoirEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
