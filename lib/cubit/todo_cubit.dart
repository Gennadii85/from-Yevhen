import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  var exemplState = TodoInitial();
  
  void convertList() {
    exemplState.todoList.add(exemplState.todo);
    print(exemplState.todoList);
    print(exemplState.todoList.length);
  }
}
