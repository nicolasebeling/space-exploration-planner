class Task {
  String task;
  bool checked = false;

  Task({required this.task});

  toggleChecked() {
    checked = !checked;
  }
}
