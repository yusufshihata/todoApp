import 'package:flutter/material.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  final List<String> tasks;
  final List<bool> taskStatus;
  final Function(int) onToggleTaskStatus;
  final Function(int) onDeleteTask;

  TaskList({
    required this.tasks,
    required this.taskStatus,
    required this.onToggleTaskStatus,
    required this.onDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            task: tasks[index],
            isCompleted: taskStatus[index],
            onToggleStatus: () => onToggleTaskStatus(index),
            onDeleteTask: () => onDeleteTask(index),  // Handle task deletion
          );
        },
      ),
    );
  }
}
