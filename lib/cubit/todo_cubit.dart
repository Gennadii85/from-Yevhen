// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial(list: []));

  void remove(String name) {
    state.list.removeWhere((element) => element == name);
    state.list.add(name);
    emit(TodoInitial(list: state.list));
  }
}
