import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';
import 'package:trustmee_app/widgets/settings_row.dart';

class UpdateFrequencyScreen extends StatefulWidget {
  const UpdateFrequencyScreen({super.key});

  @override
  State<UpdateFrequencyScreen> createState() => _UpdateFrequencyScreenState();
}

class _UpdateFrequencyScreenState extends State<UpdateFrequencyScreen> {
  String _selected = 'Every 1 minute';

  static const List<_FrequencyOption> _options = [
    _FrequencyOption('Real-time', 'High battery usage'),
    _FrequencyOption('Every 1 minute', 'Moderate battery usage'),
    _FrequencyOption('Every 5 minutes', 'Low battery usage'),
    _FrequencyOption('Every 15 minutes', 'Minimal battery usage'),
    _FrequencyOption('Hourly', 'Very low battery usage'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.iosGroupedBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.iosLabel),
        title: const Text(
          'Update Frequency',
          style: TextStyle(
            color: AppTheme.iosLabel,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 28),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'How often TrustMee records your location. More frequent updates improve accuracy but use more battery.',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.iosSecondaryLabel,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SettingsSection(
            title: '',
            children: [
              for (int i = 0; i < _options.length; i++)
                _buildOptionRow(
                  _options[i],
                  isLast: i == _options.length - 1,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(_FrequencyOption opt, {required bool isLast}) {
    final isSelected = _selected == opt.name;
    return InkWell(
      onTap: () => setState(() => _selected = opt.name),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(
                  bottom: BorderSide(color: AppTheme.iosSeparator, width: 0.5),
                ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    opt.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.iosLabel,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    opt.batteryNote,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.iosSecondaryLabel,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: AppTheme.iosBlue),
          ],
        ),
      ),
    );
  }
}

class _FrequencyOption {
  final String name;
  final String batteryNote;
  const _FrequencyOption(this.name, this.batteryNote);
}
