class SingleLocationModel {
  const SingleLocationModel(this.name, this.address, this.long, this.lat,
      this.startTime, this.endTime);

  final String name;
  final String address;
  final double long;
  final double lat;
  final DateTime startTime;
  final DateTime endTime;

  factory SingleLocationModel.loadNew(Map<String, dynamic> locationData) {
    return switch (locationData) {
      {
        'name': String name,
        'address': String address,
        'long': double long,
        'lat': double lat,
        'startTime': DateTime startTime,
        'endTime': DateTime endTime,
      } =>
        SingleLocationModel(name, address, long, lat, startTime, endTime),
      _ => throw const FormatException('Failed to parse QuizQuestion'),
    };
  }
}
