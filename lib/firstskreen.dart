import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treeyni/calendar.dart';
import 'package:treeyni/cubit/todo_cubit.dart';
import 'package:treeyni/secondskreen.dart';

class Firstskreen extends StatelessWidget {
  Firstskreen({Key? key}) : super(key: key);
  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var blocexe2 = BlocProvider.of<TodoCubit>(context);

    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${data.day} / ${data.hour} / ${data.year}'),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Calendar()));
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
              body: ListView.separated(
                itemCount: state.todoList.isEmpty ? 1 : state.todoList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 5),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.grey[300],
                    elevation: 8,
                    margin: const EdgeInsets.all(10),
                    key: ValueKey(blocexe2.exemplState.todoList.isEmpty
                        ? 1
                        : blocexe2.exemplState.todoList[index]),
                    child: ListTile(
                      leading: CircleAvatar(
                          maxRadius: 12,
                          backgroundColor: Colors.amber,
                          child: Text('${index + 1}')),
                      title: Text(blocexe2.exemplState.todoList.join()),
                    ),
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MySckeen()));
                },
                child: const Text('nev'),
              ),
            );
          },
        ),
      ),
    );
  }
}
