import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treeyni/cubit/todo_cubit.dart';
import 'package:treeyni/firstskreen.dart';

class Secondskreen extends StatefulWidget {
  const Secondskreen({Key? key}) : super(key: key);

  @override
  State<Secondskreen> createState() => SecondskreenState();
}

class SecondskreenState extends State<Secondskreen> {
  final todocontroler = TextEditingController();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
          body: ListView.separated(
            itemCount: 1,
            separatorBuilder: (context, index) =>
                const SizedBox(height: 8),
            itemBuilder: (context, index) => TextField(
              controller: todocontroler,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<TodoCubit>(context).remove(todocontroler.text);
              todocontroler.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstScreen()));
            },
            child: const Text('save'),
          ),
        ),
      ),
    );
  }
}
