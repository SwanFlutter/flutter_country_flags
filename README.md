# Flutter Country Flags 🏳️

A comprehensive Flutter package for displaying country flags with support for multiple input formats and customizable styling options.

## Features ✨

- 🌍 **240+ Country Flags**: Complete collection of world country flags
- 🔤 **Multiple Input Formats**: Support for ISO 2-letter codes, 3-letter codes, and country names
- 🎨 **Customizable Styling**: Various sizes, shapes, and border options
- 🔄 **Smart Fallback**: Graceful error handling with customizable fallback display
- 📱 **Multiple Widgets**: Different widgets for different use cases
- 🚀 **High Performance**: Optimized asset loading and caching

## Installation 📦

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_country_flags: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage 🚀

### Basic Usage

```dart
import 'package:flutter_country_flags/flutter_country_flags.dart';

// Basic flag display
FlutterCountryFlags(
  country: 'ir', // Iran flag
  width: 60,
  height: 40,
)
```

### Different Input Formats

```dart
// Using Country enum (Type-safe, recommended)
FlutterCountryFlags(country: Country.iran)

// ISO 2-letter code
FlutterCountryFlags(country: 'ir')

// ISO 3-letter code
FlutterCountryFlags(country: 'irn')

// Country name
FlutterCountryFlags(country: 'iran')

// Country name with spaces
FlutterCountryFlags(country: 'united states')
```

### Widget Variants

#### 1. Standard Flag Widget
```dart
FlutterCountryFlags(
  country: Country.unitedStates, // Type-safe enum
  width: 60,
  height: 40,
  fit: BoxFit.cover,
  borderRadius: 8.0,
)
```

#### 2. Simple Country Flag
```dart
CountryFlag(
  country: Country.unitedKingdom,
  size: 24, // Creates 24x16.8 flag (standard ratio)
)
```

#### 3. Circular Flag
```dart
CircularCountryFlag(
  country: Country.germany,
  size: 50,
)
```

#### 4. Flag with Country Name
```dart
CountryFlagWithName(
  country: Country.france,
  flagWidth: 50,
  flagHeight: 35,
  textStyle: TextStyle(fontSize: 12),
)
```

### Advanced Customization

```dart
FlutterCountryFlags(
  country: Country.japan, // Type-safe enum
  width: 80,
  height: 60,
  fit: BoxFit.cover,
  isCircular: true,
  borderRadius: 12.0,
  showCountryName: true,
  countryNameStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
  fallbackText: 'No Flag',
)
```

## Supported Countries 🌎

The package supports 240+ countries and territories including:

- All UN member states
- Dependent territories
- Special regions (e.g., England, Scotland, Wales, Northern Ireland)
- Historical flags where applicable

### Popular Country Codes

#### Using Type-Safe Enum (Recommended)
```dart
Country.iran          // 🇮🇷 Iran
Country.unitedStates  // 🇺🇸 United States
Country.unitedKingdom // 🇬🇧 United Kingdom
Country.germany       // 🇩🇪 Germany
Country.france        // 🇫🇷 France
Country.japan         // 🇯🇵 Japan
Country.china         // 🇨🇳 China

// Special regions
Country.england       // 🏴󠁧󠁢󠁥󠁮󠁧󠁿 England
Country.scotland      // 🏴󠁧󠁢󠁳󠁣󠁴󠁿 Scotland
Country.wales         // 🏴󠁧󠁢󠁷󠁬󠁳󠁿 Wales
Country.europeanUnion // 🇪🇺 European Union
```

#### String Formats (Also Supported)
- 🇮🇷 Iran: `'ir'`, `'irn'`, `'iran'`
- 🇺🇸 United States: `'us'`, `'usa'`, `'united states'`
- 🇬🇧 United Kingdom: `'gb'`, `'gbr'`, `'united kingdom'`
- 🇩🇪 Germany: `'de'`, `'deu'`, `'germany'`
- 🇫🇷 France: `'fr'`, `'fra'`, `'france'`
- 🇯🇵 Japan: `'jp'`, `'jpn'`, `'japan'`
- 🇨🇳 China: `'cn'`, `'chn'`, `'china'`

## API Reference 📚

### FlutterCountryFlags

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `country` | `Country` or `String` | required | Country enum or code/name |
| `width` | `double?` | `50` | Flag width |
| `height` | `double?` | `35` | Flag height |
| `fit` | `BoxFit` | `BoxFit.cover` | How flag fits in bounds |
| `isCircular` | `bool` | `false` | Circular flag shape |
| `borderRadius` | `double` | `4.0` | Corner radius |
| `showCountryName` | `bool` | `false` | Show country name |
| `countryNameStyle` | `TextStyle?` | `null` | Country name styling |
| `fallbackText` | `String?` | `null` | Text when flag not found |

### Country Enum API

```dart
// Get country from code
Country? country = Country.fromCode('IR'); // Returns Country.iran

// Get country from name
Country? country = Country.fromName('iran'); // Returns Country.iran

// Get country properties
Country.iran.code;        // 'IR'
Country.iran.name;        // 'iran'
Country.iran.displayName; // 'Iran'

// Get all countries
List<String> codes = Country.allCodes;           // All ISO codes
List<String> names = Country.allNames;           // All internal names
List<String> displayNames = Country.allDisplayNames; // All display names
```

### Legacy Utility Methods

```dart
// Get country code from various inputs
String? code = CountryFlags.getCountryCode('iran'); // Returns 'IR'

// Get country name from code
String? name = CountryFlags.getCountryName('IR'); // Returns 'iran'

// Get all available country codes
List<String> codes = CountryFlags.getAllCountryCodes();

// Get all available country names
List<String> names = CountryFlags.getAllCountryNames();
```

## Error Handling 🛡️

The package gracefully handles invalid inputs:

```dart
FlutterCountryFlags(
  country: 'invalid_code',
  fallbackText: 'Unknown',
  // Shows a placeholder with "Unknown" text
)
```

## Examples 💡

Check out the `/example` folder for a comprehensive demo showing:
- Different input formats
- Various styling options
- Error handling
- Performance considerations






