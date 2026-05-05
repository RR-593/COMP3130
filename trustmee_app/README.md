# TrustMee — Flutter Template

Personal location tracker app scaffolded from the Pencil wireframes in `../Pencil_mock_TrustMee_app.pen`.

## Getting started

```bash
cd trustmee_app
flutter pub get
flutter run
```

## Project layout

```
lib/
├── main.dart                  # App entry — MaterialApp with named routes
├── theme/
│   └── app_theme.dart         # Brand (dark) + iOS-light palettes
├── routes/
│   └── app_routes.dart        # All named route constants + builder map
├── widgets/
│   └── settings_row.dart      # SettingsRow + SettingsSection (iOS-grouped)
└── screens/
    ├── login/login_screen.dart
    ├── map/map_screen.dart                    # Home — DraggableScrollableSheet glass panel
    ├── history/location_history_screen.dart   # Slide-up history reveal
    └── settings/
        ├── settings_screen.dart
        ├── account_settings_screen.dart
        ├── location_accuracy_screen.dart
        ├── update_frequency_screen.dart
        ├── data_retention_screen.dart
        ├── export_history_screen.dart
        └── clear_data_screen.dart
```

## What still needs your hand

- **Images**: every screen has `// TODO: add image asset` comments where branding / map / illustration assets should be dropped into `assets/images/`.
- **Map**: the Map screen renders a grey placeholder. Swap the `Container` for a `GoogleMap` widget once you uncomment `google_maps_flutter` in `pubspec.yaml`.
- **Auth**: the Login screen has wired controllers but no backend call.
- **Persistence**: settings toggles update local state only. Wire `shared_preferences` (or your store of choice) before shipping.
- **Date pickers**: Export History rows have `// TODO: showDatePicker` markers.

## Routes

All routes are defined in `lib/routes/app_routes.dart`. The app boots into `AppRoutes.login`; after login push `AppRoutes.map` (the home screen). Settings sub-screens are pushed from `SettingsScreen` via `MaterialPageRoute`s — switch to named routes if you prefer.
