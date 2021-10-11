import 'package:flutter/material.dart';

import 'task.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Task> tasks = [
    Task(task: 'Build a rocket'),
    Task(task: 'Test the rocket\'s boosters'),
    Task(task: 'Fly to the moon'),
    Task(task: 'Come back to earth'),
    Task(task: 'Visit Mars'),
  ];

  int countChecked() {
    int count = 0;
    for (Task t in tasks) {
      if (t.checked) count++;
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Space Exploration Planner'),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: countChecked() / tasks.length,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (context, index) => CheckboxListTile(
              value: tasks[index].checked,
              onChanged: (_) => setState(
                () => tasks[index].toggleChecked(),
              ),
              title: Text(
                tasks[index].task,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
