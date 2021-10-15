import 'package:flutter/material.dart';

void main() => runApp(const SpaceExplorationPlanner());

class SpaceExplorationPlanner extends StatelessWidget {
  const SpaceExplorationPlanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Exploration Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          backgroundColor: Colors.white,
        ),
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final tasks = [
    Task(task: 'Build a rocket'),
    Task(task: 'Test the rocket\'s boosters'),
    Task(task: 'Fly to the moon'),
    Task(task: 'Come back to earth'),
    Task(task: 'Visit Mars'),
  ];

  int countChecked() {
    int count = 0;
    for (Task t in tasks) {
      if (t.isSelected) count++;
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
            minHeight: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (context, index) => CheckboxListTile(
              value: tasks[index].isSelected,
              onChanged: (_) => setState(
                () => tasks[index].select(),
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

class Task {
  String task;
  bool isSelected = false;

  Task({required this.task});

  select() {
    isSelected = !isSelected;
  }
}
