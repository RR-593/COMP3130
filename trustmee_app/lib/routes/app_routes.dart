import 'package:flutter/material.dart';
import 'package:trustmee_app/screens/history/location_history_screen.dart';
import 'package:trustmee_app/screens/login/login_screen.dart';
import 'package:trustmee_app/screens/map/map_screen.dart';
import 'package:trustmee_app/screens/register/register_screen.dart';
import 'package:trustmee_app/screens/settings/account_settings_screen.dart';
import 'package:trustmee_app/screens/settings/clear_data_screen.dart';
import 'package:trustmee_app/screens/settings/data_retention_screen.dart';
import 'package:trustmee_app/screens/settings/export_history_screen.dart';
import 'package:trustmee_app/screens/settings/location_accuracy_screen.dart';
import 'package:trustmee_app/screens/settings/settings_screen.dart';
import 'package:trustmee_app/screens/settings/update_frequency_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String register = '/register';
  static const String map = '/map';
  static const String history = '/history';
  static const String settings = '/settings';
  static const String accountSettings = '/settings/account';
  static const String locationAccuracy = '/settings/accuracy';
  static const String updateFrequency = '/settings/frequency';
  static const String dataRetention = '/settings/retention';
  static const String exportHistory = '/settings/export';
  static const String clearData = '/settings/clear';

  static Map<String, WidgetBuilder> all() => {
        login: (_) => LoginScreen(),
        register: (_) => RegisterScreen(),
        map: (_) => const MapScreen(),
        history: (_) => const LocationHistoryScreen(),
        settings: (_) => const SettingsScreen(),
        accountSettings: (_) => const AccountSettingsScreen(),
        locationAccuracy: (_) => const LocationAccuracyScreen(),
        updateFrequency: (_) => const UpdateFrequencyScreen(),
        dataRetention: (_) => const DataRetentionScreen(),
        exportHistory: (_) => const ExportHistoryScreen(),
        clearData: (_) => const ClearDataScreen(),
      };
}
