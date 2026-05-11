import 'package:flutter_test/flutter_test.dart';
import 'package:trustmee_app/models/location_model.dart';
import 'package:trustmee_app/models/single_location_model.dart';

void main() {
  final startTime = DateTime(2024, 1, 1, 9, 0);
  final endTime = DateTime(2024, 1, 1, 17, 0);

  final sampleLocationMap = {
    'name': 'Office',
    'address': '123 Main St',
    'long': 151.123456,
    'lat': -33.856789,
    'startTime': startTime,
    'endTime': endTime,
  };

  group('SingleLocationModel', () {
    test('constructor sets all fields', () {
      final model = SingleLocationModel(
        'Office',
        '123 Main St',
        151.123456,
        -33.856789,
        startTime,
        endTime,
      );

      expect(model.name, 'Office');
      expect(model.address, '123 Main St');
      expect(model.long, 151.123456);
      expect(model.lat, -33.856789);
      expect(model.startTime, startTime);
      expect(model.endTime, endTime);
    });

    test('loadNew parses valid map', () {
      final model = SingleLocationModel.loadNew(sampleLocationMap);

      expect(model.name, 'Office');
      expect(model.address, '123 Main St');
      expect(model.long, 151.123456);
      expect(model.lat, -33.856789);
      expect(model.startTime, startTime);
      expect(model.endTime, endTime);
    });

    test('loadNew throws FormatException on missing fields', () {
      expect(
        () => SingleLocationModel.loadNew({'name': 'Only Name'}),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('LoactionModel', () {
    test('constructor sets all fields', () {
      final timestamp = DateTime(2024, 1, 1);
      final model = LoactionModel(timestamp, const []);

      expect(model.timestamp, timestamp);
      expect(model.locations, isEmpty);
    });

    test('fromJson parses single location', () {
      final json = {
        'date_id': '2024-01-01',
        'location': [sampleLocationMap],
      };

      final model = LoactionModel.fromJson(json);

      expect(model.timestamp, DateTime(2024, 1, 1));
      expect(model.locations.length, 1);
      expect(model.locations[0].name, 'Office');
      expect(model.locations[0].address, '123 Main St');
    });

    test('fromJson parses multiple locations', () {
      final json = {
        'date_id': '2024-06-15',
        'location': [
          sampleLocationMap,
          {
            'name': 'Home',
            'address': '1 Home St',
            'long': 151.0,
            'lat': -33.0,
            'startTime': DateTime(2024, 6, 15, 18, 0),
            'endTime': DateTime(2024, 6, 15, 23, 0),
          },
        ],
      };

      final model = LoactionModel.fromJson(json);

      expect(model.locations.length, 2);
      expect(model.locations[0].name, 'Office');
      expect(model.locations[1].name, 'Home');
    });

    test('fromJson parses empty locations list', () {
      final json = {
        'date_id': '2024-01-01',
        'location': <dynamic>[],
      };

      final model = LoactionModel.fromJson(json);

      expect(model.locations, isEmpty);
    });

    test('fromJson throws FormatException on missing fields', () {
      expect(
        () => LoactionModel.fromJson({'invalid': 'data'}),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
