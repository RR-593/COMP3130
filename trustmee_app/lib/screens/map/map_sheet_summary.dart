import 'package:flutter/material.dart';

class MapSheetSummary extends StatelessWidget {
  final bool expanded;
  final String? address;

  const MapSheetSummary({super.key, required this.expanded, this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '35h 45m 34.43s',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Most Visited This Week',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 2),
                if (address != null)
                  Text(
                    address!,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined, color: Colors.grey.shade600),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
