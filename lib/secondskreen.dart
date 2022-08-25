import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treeyni/cubit/todo_cubit.dart';
import 'package:treeyni/firstskreen.dart';

class MySckeen extends StatelessWidget {
  const MySckeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: const Secondskreen(),
    );
  }
}

class Secondskreen extends StatefulWidget {
  const Secondskreen({Key? key}) : super(key: key);

  @override
  State<Secondskreen> createState() => SecondskreenState();
}

class SecondskreenState extends State<Secondskreen> {
  final todocontroler = TextEditingController();
  String text = '';
  void setText() {
    setState(() {
      text = todocontroler.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var blocexe = BlocProvider.of<TodoCubit>(context);
    void addtoList() {
      blocexe.exemplState.todo = text;
    }
/* setText() и addtoList() можно обьеденить в одну функцию но вдруг мне значение
 контроллера еще где-то нужно будет
*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              // leading: Text({blocexe.ffffff.todo.toString()}.join()),
              // title: Text(blocexe.exemplState.todo.toString()),
            ),
            body: ListView.separated(
              itemCount: 1,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 8),
              itemBuilder: (BuildContext context, int index) => TextField(
                controller: todocontroler,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setText();
                addtoList();
                BlocProvider.of<TodoCubit>(context).convertList();
                todocontroler.clear();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Firstskreen()));

              },
              child: const Text('save'),
            ),
          );
        },
      ),
    );
  }
}
