import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';
import 'package:trustmee_app/screens/history/location_history_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();
  double _sheetExtent = 0.22;

  @override
  void initState() {
    super.initState();
    _sheetController.addListener(_onSheetChange);
  }

  void _onSheetChange() {
    setState(() {
      _sheetExtent = _sheetController.size;
    });
  }

  @override
  void dispose() {
    _sheetController.removeListener(_onSheetChange);
    _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool expanded = _sheetExtent > 0.6;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: [
          // Bottom layer — map placeholder
          // TODO: replace with google_maps_flutter GoogleMap widget
          // TODO: add image asset here — see assets/images/ (map placeholder image)
          Container(
            color: const Color(0xFFDADADA),
            child: const Center(
              child: Icon(
                Icons.location_on,
                size: 48,
                color: AppTheme.accent,
              ),
            ),
          ),
          // SafeArea handles the status bar
          const SafeArea(child: SizedBox.shrink()),
          // Bottom-aligned draggable sheet
          DraggableScrollableSheet(
            controller: _sheetController,
            initialChildSize: 0.22,
            minChildSize: 0.22,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 16,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                // When the sheet is dragged above 0.6 the LocationHistoryBody
                // is shown beneath the summary, revealing the full history.
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MOST VISITED THIS WEEK',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '32h 15m spent here',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 12),
                            if (!expanded)
                              Row(
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_up,
                                    size: 18,
                                    color: Colors.grey.shade600,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Slide up for full history',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Reveal full history list once the sheet is expanded.
                      if (expanded)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 24),
                          child: LocationHistoryBody(showDragHandle: false),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
