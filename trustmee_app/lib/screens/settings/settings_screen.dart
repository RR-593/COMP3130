import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';
import 'package:trustmee_app/widgets/settings_row.dart';
import 'package:trustmee_app/screens/settings/account_settings_screen.dart';
import 'package:trustmee_app/screens/settings/location_accuracy_screen.dart';
import 'package:trustmee_app/screens/settings/update_frequency_screen.dart';
import 'package:trustmee_app/screens/settings/data_retention_screen.dart';
import 'package:trustmee_app/screens/settings/export_history_screen.dart';
import 'package:trustmee_app/screens/settings/clear_data_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _backgroundTracking = true;
  bool _shareLocation = false;
  bool _locationReminders = true;
  bool _weeklySummary = true;

  void _push(Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
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
          'Settings',
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
          // Profile card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => _push(const AccountSettingsScreen()),
              child: Container(
                height: 72,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppTheme.iosCardBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(0xFFD1D1D6),
                      // TODO: add asset
                      child: Icon(Icons.person, color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Alex Johnson',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.iosLabel,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'alex@email.com',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.iosSecondaryLabel,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.chevron_right,
                      color: AppTheme.iosSecondaryLabel,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SettingsSection(
            title: 'TRACKING',
            children: [
              SettingsRow(
                title: 'Location Accuracy',
                onTap: () => _push(const LocationAccuracyScreen()),
              ),
              SettingsRow(
                title: 'Background Tracking',
                trailing: Switch(
                  value: _backgroundTracking,
                  activeColor: AppTheme.iosGreen,
                  onChanged: (v) => setState(() => _backgroundTracking = v),
                ),
              ),
              SettingsRow(
                title: 'Update Frequency',
                onTap: () => _push(const UpdateFrequencyScreen()),
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: 24),
          SettingsSection(
            title: 'PRIVACY',
            children: [
              SettingsRow(
                title: 'Share Location',
                trailing: Switch(
                  value: _shareLocation,
                  activeColor: AppTheme.iosGreen,
                  onChanged: (v) => setState(() => _shareLocation = v),
                ),
              ),
              SettingsRow(
                title: 'Data Retention',
                onTap: () => _push(const DataRetentionScreen()),
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: 24),
          SettingsSection(
            title: 'NOTIFICATIONS',
            children: [
              SettingsRow(
                title: 'Location Reminders',
                trailing: Switch(
                  value: _locationReminders,
                  activeColor: AppTheme.iosGreen,
                  onChanged: (v) => setState(() => _locationReminders = v),
                ),
              ),
              SettingsRow(
                title: 'Weekly Summary',
                trailing: Switch(
                  value: _weeklySummary,
                  activeColor: AppTheme.iosGreen,
                  onChanged: (v) => setState(() => _weeklySummary = v),
                ),
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: 24),
          SettingsSection(
            title: 'DATA',
            children: [
              SettingsRow(
                title: 'Export History',
                onTap: () => _push(const ExportHistoryScreen()),
              ),
              SettingsRow(
                title: 'Clear All Data',
                isDestructive: true,
                onTap: () => _push(const ClearDataScreen()),
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Center(
            child: Text(
              'TrustMee v1.0.0',
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.iosSecondaryLabel,
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
