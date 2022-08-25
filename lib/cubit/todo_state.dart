// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  String todo;
  List<String> todoList;
  
  TodoState(this.todo, this.todoList);

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {
  TodoInitial() : super('', []);
}


