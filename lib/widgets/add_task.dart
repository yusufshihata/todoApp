import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();
  final Function(String) onAddTask;

  AddTask({required this.onAddTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, top: 20.0, left: 20.0, right: 20.0),
      child: Row(
        children: [
          // The TextField is inside the Row
          Expanded(
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: 'Enter a task',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      onAddTask(taskController.text);  // Add the task
                      taskController.clear();  // Clear the input field after adding the task
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}