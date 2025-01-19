import 'package:flutter/material.dart';
import '../widgets/add_task.dart';
import '../widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tasks = [];
  List<bool> taskStatus = [];

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
      taskStatus.add(false); // New task starts as incomplete
    });
  }

  void _toggleTaskStatus(int index) {
    setState(() {
      taskStatus[index] = !taskStatus[index];  // Toggle task completion status
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);      // Remove task from the list
      taskStatus.removeAt(index); // Remove the corresponding status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task List')),
      body: Column(
        children: [
          TaskList(
            tasks: tasks,               // Task list widget
            taskStatus: taskStatus,     // Task completion statuses
            onToggleTaskStatus: _toggleTaskStatus, // Toggle task completion status
            onDeleteTask: _deleteTask,  // Handle task deletion
          ),

          AddTask(onAddTask: _addTask),  // Add task widget
        ],
      ),
    );
  }
}
