// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  List<String> list;
  TodoState({
    required this.list,
  });
  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {
  TodoInitial({required super.list});
  
  
}

