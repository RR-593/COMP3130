import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';
import 'package:trustmee_app/widgets/settings_row.dart';

class ExportHistoryScreen extends StatefulWidget {
  const ExportHistoryScreen({super.key});

  @override
  State<ExportHistoryScreen> createState() => _ExportHistoryScreenState();
}

class _ExportHistoryScreenState extends State<ExportHistoryScreen> {
  String _from = 'Jul 1, 2025';
  String _to = 'Today';
  String _format = 'CSV';

  Future<void> _pickFrom() async {
    // TODO: showDatePicker
  }

  Future<void> _pickTo() async {
    // TODO: showDatePicker
  }

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
          'Export History',
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
          SettingsSection(
            title: 'DATE RANGE',
            children: [
              SettingsRow(
                title: 'From',
                value: _from,
                onTap: _pickFrom,
              ),
              SettingsRow(
                title: 'To',
                value: _to,
                onTap: _pickTo,
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: 24),
          SettingsSection(
            title: 'FORMAT',
            children: [
              SettingsRow(
                title: 'CSV',
                onTap: () => setState(() => _format = 'CSV'),
                trailing: _format == 'CSV'
                    ? const Icon(Icons.check, color: AppTheme.iosBlue)
                    : const SizedBox.shrink(),
              ),
              SettingsRow(
                title: 'JSON',
                onTap: () => setState(() => _format = 'JSON'),
                trailing: _format == 'JSON'
                    ? const Icon(Icons.check, color: AppTheme.iosBlue)
                    : const SizedBox.shrink(),
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: export data
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.iosBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Export Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
