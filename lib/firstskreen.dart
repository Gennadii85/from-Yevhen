// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:treeyni/calendar.dart';
import 'package:treeyni/cubit/todo_cubit.dart';
import 'package:treeyni/secondskreen.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${data.day} / ${data.month} / ${data.year}'),
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
              itemCount: state.list.isEmpty ? 0 : state.list.length,
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemBuilder: (context, index) {
                final item = state.list[index];
                return Dismissible(
                  onDismissed: (direction) {
                    setState(() {
                      state.list.removeAt(index);
                    });
                  },
                  background: Container(color: Colors.red),
                  key: Key(item),
                  child: Card(
                    color: Colors.grey[300],
                    elevation: 2,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(
                          maxRadius: 12,
                          backgroundColor: Colors.amber,
                          child: Text('${index + 1}')),
                      title: Text(
                        style: const TextStyle(fontSize: 18),
                        state.list.isEmpty ? '' : state.list[index],
                      ),
                      trailing: const Icon(Icons.arrow_back),
                      onLongPress: () {},
                    ),
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
