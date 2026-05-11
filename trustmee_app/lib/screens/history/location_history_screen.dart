import 'package:flutter/material.dart';
import 'package:trustmee_app/widgets/graphs/simple_location_statistic.dart';

class LocationEntry {
  final String name;
  final String timeRange;
  final String duration;

  const LocationEntry({
    required this.name,
    required this.timeRange,
    required this.duration,
  });
}

const List<LocationEntry> _sampleEntries = [
  LocationEntry(name: 'Home', timeRange: '7:00 – 9:00', duration: '2h 00m'),
  LocationEntry(name: 'Gym', timeRange: '9:15 – 10:30', duration: '1h 15m'),
  LocationEntry(name: 'Cafe', timeRange: '11:00 – 12:30', duration: '1h 30m'),
  LocationEntry(name: 'Office', timeRange: '13:00 – 17:45', duration: '4h 45m'),
];

class LocationHistoryScreen extends StatelessWidget {
  const LocationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LocationHistoryBody(),
      ),
    );
  }
}

class LocationHistoryBody extends StatelessWidget {
  final bool showDragHandle;

  const LocationHistoryBody({super.key, this.showDragHandle = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 255, 255, 255),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showDragHandle) ...[
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
          const Text(
            "Today's Locations",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          const SimpleLocationStatistic(),
          const SizedBox(height: 20),
          _buildEntriesList(),
        ],
      ),
    );
  }

  Widget _buildEntriesList() {
    return Column(
      children: List.generate(_sampleEntries.length, (index) {
        final entry = _sampleEntries[index];
        final isLast = index == _sampleEntries.length - 1;
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: isLast
                  ? BorderSide.none
                  : BorderSide(color: Colors.grey.shade200),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  entry.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                entry.timeRange,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                entry.duration,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
