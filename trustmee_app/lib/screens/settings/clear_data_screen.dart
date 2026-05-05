import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';

class ClearDataScreen extends StatelessWidget {
  const ClearDataScreen({super.key});

  static const List<String> _bullets = [
    'All location history',
    'Tracked time & durations',
    'Saved places & favourites',
    'App preferences & settings',
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
          'Clear All Data',
          style: TextStyle(
            color: AppTheme.iosRed,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Center(
                child: Icon(
                  Icons.warning_amber_rounded,
                  size: 64,
                  color: AppTheme.iosRed,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Delete All Data?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.iosLabel,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'This action cannot be undone. The following data will be permanently erased from your account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.iosSecondaryLabel,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.iosCardBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < _bullets.length; i++)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          border: i == _bullets.length - 1
                              ? null
                              : const Border(
                                  bottom: BorderSide(
                                    color: AppTheme.iosSeparator,
                                    width: 0.5,
                                  ),
                                ),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              '•',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppTheme.iosLabel,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                _bullets[i],
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: AppTheme.iosLabel,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppTheme.iosSeparator),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: AppTheme.iosLabel,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: delete everything
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.iosRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Delete Everything',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
