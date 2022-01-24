class GraphModel {
  final int value;
  final DateTime date;
  GraphModel({
    required this.value,
    required this.date,
  });

  int get day {
    final _now = DateTime.now();

    return _now.difference(date).inDays;
  }
}
