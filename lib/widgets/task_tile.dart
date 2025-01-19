import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String task;
  final bool isCompleted;
  final Function() onToggleStatus;
  final Function() onDeleteTask;

  TaskTile({
    required this.task,
    required this.isCompleted,
    required this.onToggleStatus,
    required this.onDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task,
        style: TextStyle(
          decoration: isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              isCompleted ? Icons.check_circle : Icons.check_circle_outline,
              color: isCompleted ? Colors.green : null,
            ),
            onPressed: onToggleStatus, // Toggle task completion status
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red), // Delete button
            onPressed: onDeleteTask, // Delete the task
          ),
        ],
      ),
    );
  }
}