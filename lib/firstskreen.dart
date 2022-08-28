import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treeyni/calendar.dart';
import 'package:treeyni/cubit/todo_cubit.dart';
import 'package:treeyni/secondskreen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);
  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            return ListView.separated(
              itemCount: state.list.isEmpty ? 1 : state.list.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 5),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.grey[300],
                  elevation: 2,
                  margin: const EdgeInsets.all(10),
                  key: ValueKey(state.list.isEmpty ? 0 : state.list[index]),
                  child: ListTile(
                    leading: CircleAvatar(
                        maxRadius: 12,
                        backgroundColor: Colors.amber,
                        child: Text('${index + 1}')),
                    title: Text(''),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Secondskreen()));
          },
          child: const Text('nev'),
        ),
      ),
    );
  }
}
