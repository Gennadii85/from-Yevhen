import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treeyni/cubit/todo_cubit.dart';
import 'package:treeyni/firstskreen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Firstskreen(),
      ),
    );
  }
}
