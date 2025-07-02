import 'package:flutter/material.dart';

import 'arc/enums/country_enum.dart';
import 'arc/tools/country_flags.dart';

export 'arc/enums/country_enum.dart';
export 'arc/tools/country_flags.dart';

/// Main widget for displaying country flags
class FlutterCountryFlags extends StatelessWidget {
  /// Country enum or code (ISO 2-letter, 3-letter, or country name)
  final dynamic country;

  /// Width of the flag
  final double? width;

  /// Height of the flag
  final double? height;

  /// How the flag should fit within its bounds
  final BoxFit fit;

  /// Whether to display the flag in circular shape
  final bool isCircular;

  /// Border radius for rounded corners (ignored if isCircular is true)
  final double borderRadius;

  /// Text to show when flag is not found
  final String? fallbackText;

  /// Whether to show country name below the flag
  final bool showCountryName;

  /// Style for country name text
  final TextStyle? countryNameStyle;

  /// Package name for assets (usually 'flutter_country_flags')
  final String package;

  const FlutterCountryFlags({
    super.key,
    required this.country,
    this.width = 50,
    this.height = 35,
    this.fit = BoxFit.cover,
    this.isCircular = false,
    this.borderRadius = 4.0,
    this.fallbackText,
    this.showCountryName = false,
    this.countryNameStyle,
    this.package = 'flutter_country_flags',
  });

  @override
  Widget build(BuildContext context) {
    final flagCode = _getCountryCode(country);

    if (flagCode == null) {
      return _buildFallback();
    }

    final flagWidget = ClipRRect(
      borderRadius: BorderRadius.circular(
        isCircular ? (width ?? 50) / 2 : borderRadius,
      ),
      child: Image.asset(
        'assets/${flagCode.toLowerCase()}.png',
        package: package,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _buildFallback();
        },
      ),
    );

    if (showCountryName) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          flagWidget,
          const SizedBox(height: 4),
          Text(
            _getCountryName(flagCode) ?? country,
            style:
                countryNameStyle ??
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return flagWidget;
  }

  Widget _buildFallback() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          isCircular ? (width ?? 50) / 2 : borderRadius,
        ),
        border: Border.all(color: Colors.grey[400]!),
      ),
      child: Center(
        child: Text(
          fallbackText ?? _getFallbackText(),
          style: TextStyle(
            fontSize: (width ?? 50) * 0.2,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  /// Get fallback text for display
  String _getFallbackText() {
    if (country is Country) {
      return (country as Country).code;
    } else if (country is String) {
      return (country as String).toUpperCase();
    }
    return 'N/A';
  }

  /// Convert various country formats to ISO 2-letter code
  String? _getCountryCode(dynamic input) {
    if (input == null) return null;

    // If it's already a Country enum
    if (input is Country) {
      return input.code;
    }

    // If it's a string
    if (input is String) {
      if (input.isEmpty) return null;

      final cleanInput = input.toLowerCase().trim();

      // Try to find by enum first
      final countryEnum =
          Country.fromCode(cleanInput) ?? Country.fromName(cleanInput);
      if (countryEnum != null) {
        return countryEnum.code;
      }

      // Fallback to old method
      final code = CountryFlags.getCountryCode(cleanInput);
      return code;
    }

    return null;
  }

  /// Get country name from code
  String? _getCountryName(String code) {
    // Try to get from enum first
    final countryEnum = Country.fromCode(code);
    if (countryEnum != null) {
      return countryEnum.displayName;
    }

    // Fallback to old method
    return countryMapping[code.toUpperCase()]
        ?.replaceAll('-', ' ')
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}

/// Simple flag widget without extra features
class CountryFlag extends StatelessWidget {
  final dynamic country;
  final double size;
  final BoxFit fit;
  final String package;

  const CountryFlag({
    super.key,
    required this.country,
    this.size = 24,
    this.fit = BoxFit.cover,
    this.package = 'flutter_country_flags',
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCountryFlags(
      country: country,
      width: size,
      height: size * 0.7, // Standard flag ratio
      fit: fit,
      package: package,
    );
  }
}

/// Circular flag widget
class CircularCountryFlag extends StatelessWidget {
  final dynamic country;
  final double size;
  final String package;

  const CircularCountryFlag({
    super.key,
    required this.country,
    this.size = 40,
    this.package = 'flutter_country_flags',
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCountryFlags(
      country: country,
      width: size,
      height: size,
      isCircular: true,
      fit: BoxFit.cover,
      package: package,
    );
  }
}

/// Flag with country name
class CountryFlagWithName extends StatelessWidget {
  final dynamic country;
  final double flagWidth;
  final double flagHeight;
  final TextStyle? textStyle;
  final String package;

  const CountryFlagWithName({
    super.key,
    required this.country,
    this.flagWidth = 60,
    this.flagHeight = 40,
    this.textStyle,
    this.package = 'flutter_country_flags',
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCountryFlags(
      country: country,
      width: flagWidth,
      height: flagHeight,
      showCountryName: true,
      countryNameStyle: textStyle,
      package: package,
    );
  }
}
