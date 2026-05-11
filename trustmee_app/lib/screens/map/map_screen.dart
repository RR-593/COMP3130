import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:trustmee_app/screens/map/map_bottom_sheet.dart';
import 'package:trustmee_app/theme/app_theme.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  late final AnimatedMapController _mapController = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeInOut,
  );
  LatLng? _deviceLocation;
  String? _address;
  bool _userPanned = false;

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  Future<void> _initLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    final pos = await Geolocator.getCurrentPosition();
    if (!mounted) return;

    final location = LatLng(pos.latitude, pos.longitude);
    final placemarks =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);
    final p = placemarks.first;
    final address = [p.street, p.locality].whereType<String>().join(', ');

    if (!mounted) return;
    setState(() {
      _deviceLocation = location;
      _address = address.isNotEmpty ? address : null;
    });
    _mapController.mapController.move(_deviceLocation!, 17);
  }

  void _onMapEvent(MapEvent event) {
    if (event is MapEventMoveStart &&
        event.source != MapEventSource.mapController) {
      if (!_userPanned) setState(() => _userPanned = true);
    }
  }

  void _recenter() {
    if (_deviceLocation == null) return;
    setState(() => _userPanned = false);
    _mapController.animateTo(
      dest: _deviceLocation!,
      zoom: 17,
      rotation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double sheetHeight = MediaQuery.of(context).size.height * 0.22;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController.mapController,
            options: MapOptions(
              initialCenter: const LatLng(-33.8688, 151.2093),
              initialZoom: 19,
              minZoom: 5,
              maxZoom: 19,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
              onMapEvent: _onMapEvent,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.maptiler.com/maps/streets-v4/{z}/{x}/{y}.png?key={api_key}',
                additionalOptions: {'api_key': dotenv.env['MAPTILER_API_KEY'] ?? ''},
                userAgentPackageName: 'com.trustmee.app',
              ),
              if (_deviceLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _deviceLocation!,
                      width: 20,
                      height: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.accent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.accent.withValues(alpha: 0.4),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          MapBottomSheet(address: _address),
          if (_userPanned)
            Positioned(
              bottom: sheetHeight + 16,
              right: 16,
              child: FloatingActionButton.small(
                onPressed: _recenter,
                backgroundColor: Colors.white,
                child: const Icon(Icons.my_location, color: Colors.black87),
              ),
            ),
        ],
      ),
    );
  }
}
