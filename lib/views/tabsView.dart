import 'package:flutter/material.dart';
import 'package:todo_bloc/views/add_task.dart';
import 'package:todo_bloc/views/completed_task.dart';
import 'package:todo_bloc/views/favorite_task.dart';
import 'package:todo_bloc/views/pending_task.dart';
import 'my_drawer.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);
  static const id = "tabs_screen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTaskView(), "title": "Pending Tasks"},
    {'pageName': const CompletedTaskView(), "title": "Completed Tasks"},
    {'pageName': const FavoriteTaskView(), "title": "Favorite Tasks"},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: ((context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child:  AddTaskView(),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () {
              _addTask(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                _addTask(context);
              },
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_sharp),
              label: 'Pending Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Tasks'),
        ],
      ),
    );
  }
}