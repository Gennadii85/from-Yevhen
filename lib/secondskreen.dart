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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(),
        body: ListView.separated(
          itemCount: 1,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            return TextField(
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              maxLines: 50,
              minLines: 5,
              controller: todocontroler,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<TodoCubit>(context).save(todocontroler.text);
            todocontroler.clear();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FirstScreen()));
          },
          child: const Text('save'),
        ),
      ),
      // ),
    );
  }
}
