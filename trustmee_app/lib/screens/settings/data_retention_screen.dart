import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';
import 'package:trustmee_app/widgets/settings_row.dart';

class DataRetentionScreen extends StatefulWidget {
  const DataRetentionScreen({super.key});

  @override
  State<DataRetentionScreen> createState() => _DataRetentionScreenState();
}

class _DataRetentionScreenState extends State<DataRetentionScreen> {
  String _selected = '3 Months';

  static const List<String> _options = [
    '1 Week',
    '1 Month',
    '3 Months',
    '6 Months',
    '1 Year',
    'Forever',
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
          'Data Retention',
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
              'Choose how long TrustMee keeps your location history. Older data will be automatically removed.',
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
                SettingsRow(
                  title: _options[i],
                  onTap: () => setState(() => _selected = _options[i]),
                  trailing: _selected == _options[i]
                      ? const Icon(Icons.check, color: AppTheme.iosBlue)
                      : const SizedBox.shrink(),
                  showDivider: i != _options.length - 1,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
