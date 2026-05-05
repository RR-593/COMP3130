import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';
import 'package:trustmee_app/widgets/settings_row.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool _twoFactor = false;

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
          'Account',
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
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFD1D1D6),
                  // TODO: add asset
                  child: Icon(Icons.person, color: Colors.white, size: 48),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // TODO: change photo
                  },
                  child: const Text(
                    'Change Photo',
                    style: TextStyle(
                      color: AppTheme.accent,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SettingsSection(
            title: 'PROFILE',
            children: [
              SettingsRow(
                title: 'Full Name',
                value: 'Alex Johnson',
                onTap: () {
                  // TODO: edit name
                },
              ),
              SettingsRow(
                title: 'Email Address',
                value: 'alex@email.com',
                onTap: () {
                  // TODO: edit email
                },
              ),
              SettingsRow(
                title: 'Phone Number',
                value: 'Not set',
                onTap: () {
                  // TODO: edit phone
                },
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: 24),
          SettingsSection(
            title: 'SECURITY',
            children: [
              SettingsRow(
                title: 'Change Password',
                onTap: () {
                  // TODO: change password
                },
              ),
              SettingsRow(
                title: 'Two-Factor Auth',
                trailing: Switch(
                  value: _twoFactor,
                  activeColor: AppTheme.iosGreen,
                  onChanged: (v) => setState(() => _twoFactor = v),
                ),
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: 24),
          SettingsSection(
            title: 'DANGER ZONE',
            children: [
              SettingsRow(
                title: 'Delete Account',
                isDestructive: true,
                onTap: () {
                  // TODO: delete account
                },
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
