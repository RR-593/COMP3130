import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trustmee_app/screens/history/location_history_screen.dart';
import 'package:trustmee_app/screens/map/map_sheet_summary.dart';

class MapBottomSheet extends StatefulWidget {
  final String? address;

  const MapBottomSheet({super.key, this.address});

  @override
  State<MapBottomSheet> createState() => _MapBottomSheetState();
}

class _MapBottomSheetState extends State<MapBottomSheet> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  double _extent = 0.22;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => _extent = _controller.size);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool expanded = _extent > 0.6;

    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: 0.22,
      minChildSize: 0.22,
      maxChildSize: 0.93,
      snap: true,
      snapSizes: const [0.22, 0.93],
      builder: (context, scrollController) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.35),
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withValues(alpha: 0.5),
                    width: 0.5,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(painter: _NoisePainter()),
                  ),
                  SingleChildScrollView(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        MapSheetSummary(expanded: expanded, address: widget.address),
                        const SizedBox(height: 16),
                        if (expanded)
                          const Padding(
                            padding: EdgeInsets.only(bottom: 24),
                            child: LocationHistoryBody(showDragHandle: false),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NoisePainter extends CustomPainter {
  static final _points = _buildPoints();

  static List<Offset> _buildPoints() {
    final rng = math.Random(7);
    return List.generate(
      4000,
      (_) => Offset(rng.nextDouble(), rng.nextDouble()),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withValues(alpha: 0.045);
    for (final p in _points) {
      canvas.drawCircle(
          Offset(p.dx * size.width, p.dy * size.height), 0.5, paint);
    }
  }

  @override
  bool shouldRepaint(_NoisePainter old) => false;
}
