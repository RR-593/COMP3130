import 'package:trustmee_app/models/single_location_model.dart';

class LoactionModel {
  const LoactionModel(this.timestamp, this.locations);

  final DateTime timestamp;
  final List<SingleLocationModel> locations;

  // create a quiz question from parsed JSON data
  factory LoactionModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'date_id': String day,
        'location': List<dynamic> locations,
      } =>
        LoactionModel(DateTime.parse(day), [
          for (var location in locations) SingleLocationModel.loadNew(location)
        ]),
      _ => throw const FormatException('Failed to parse LoactionModel'),
    };
  }
}
