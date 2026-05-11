import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trustmee_app/routes/app_routes.dart';
import 'package:trustmee_app/screens/settings/account_settings_screen.dart';
import 'package:trustmee_app/screens/settings/clear_data_screen.dart';
import 'package:trustmee_app/screens/settings/data_retention_screen.dart';
import 'package:trustmee_app/screens/settings/export_history_screen.dart';
import 'package:trustmee_app/screens/settings/location_accuracy_screen.dart';
import 'package:trustmee_app/screens/settings/update_frequency_screen.dart';
import 'package:trustmee_app/theme/app_theme.dart';
import 'package:trustmee_app/widgets/settings_row.dart';

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

  Future<void> _logout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text(
              'Log Out',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await FirebaseAuth.instance.signOut();
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.login,
          (route) => false,
        );
      }
    }
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
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(0xFFD1D1D6),
                      // TODO: add asset
                      child: Icon(Icons.person, color: Colors.white, size: 28),
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                    Spacer(),
                    Icon(
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
                  activeThumbColor: AppTheme.iosGreen,
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
                  activeThumbColor: AppTheme.iosGreen,
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
                  activeThumbColor: AppTheme.iosGreen,
                  onChanged: (v) => setState(() => _locationReminders = v),
                ),
              ),
              SettingsRow(
                title: 'Weekly Summary',
                trailing: Switch(
                  value: _weeklySummary,
                  activeThumbColor: AppTheme.iosGreen,
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
          const SizedBox(height: 24),
          SettingsSection(
            title: '',
            children: [
              SettingsRow(
                title: 'Log Out',
                isDestructive: true,
                showDivider: false,
                onTap: _logout,
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
