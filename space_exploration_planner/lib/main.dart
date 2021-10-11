import 'package:flutter/material.dart';

import 'homepage.dart';

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
