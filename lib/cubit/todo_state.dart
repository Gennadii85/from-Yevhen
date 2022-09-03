
part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  final List<String> list;
  const TodoState({
    required this.list,
  });
  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {
  const TodoInitial({required super.list});
}
class TodoNewState extends TodoState{
  TodoNewState({required super.list});
 

}