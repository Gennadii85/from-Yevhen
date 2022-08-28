import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial(list: const []));

 

  void remove(String name) {
    state.list.removeWhere((element) => element == name);
    state.list.add(name);
    emit(TodoInitial(list: state.list));
  }
}
