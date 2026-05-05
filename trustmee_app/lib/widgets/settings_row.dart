import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';

/// Single tappable list row used inside [SettingsSection].
///
/// - [trailing] takes precedence over the auto-chevron behaviour.
/// - When [onTap] is given and [trailing] is null, a chevron is shown.
/// - When [value] is provided it appears in secondary grey to the left of the trailing.
class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.title,
    this.value,
    this.trailing,
    this.isDestructive = false,
    this.onTap,
    this.showDivider = true,
  });

  final String title;
  final String? value;
  final Widget? trailing;
  final bool isDestructive;
  final VoidCallback? onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final Widget? autoTrailing = trailing ??
        (onTap != null
            ? const Icon(Icons.chevron_right,
                size: 18, color: Color(0xFFC7C7CC))
            : null);

    final row = InkWell(
      onTap: onTap,
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: showDivider
              ? const Border(
                  bottom: BorderSide(color: AppTheme.iosSeparator, width: 0.5),
                )
              : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: isDestructive
                      ? AppTheme.iosRed
                      : AppTheme.iosLabel,
                ),
              ),
            ),
            if (value != null) ...[
              Text(
                value!,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppTheme.iosSecondaryLabel,
                ),
              ),
              if (autoTrailing != null) const SizedBox(width: 4),
            ],
            if (autoTrailing != null) autoTrailing,
          ],
        ),
      ),
    );

    return Material(color: AppTheme.iosCardBackground, child: row);
  }
}

/// Grouped iOS-style section with an uppercase label header and a rounded white card.
class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowsWithoutLastDivider = List<Widget>.from(children);
    // Strip trailing divider on the last SettingsRow if present.
    if (rowsWithoutLastDivider.isNotEmpty &&
        rowsWithoutLastDivider.last is SettingsRow) {
      final SettingsRow last =
          rowsWithoutLastDivider.last as SettingsRow;
      rowsWithoutLastDivider[rowsWithoutLastDivider.length - 1] = SettingsRow(
        title: last.title,
        value: last.value,
        trailing: last.trailing,
        isDestructive: last.isDestructive,
        onTap: last.onTap,
        showDivider: false,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 4, top: 16),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: AppTheme.iosTertiaryLabel,
                ),
              ),
            ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(children: rowsWithoutLastDivider),
          ),
        ],
      ),
    );
  }
}
