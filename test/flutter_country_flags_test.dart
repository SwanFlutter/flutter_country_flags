import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_flags/flutter_country_flags.dart';

void main() {
  group('FlutterCountryFlags Tests', () {
    testWidgets('should display flag widget with string', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FlutterCountryFlags(country: 'ir', width: 50, height: 35),
          ),
        ),
      );

      expect(find.byType(FlutterCountryFlags), findsOneWidget);
    });

    testWidgets('should display flag widget with enum', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FlutterCountryFlags(
              country: Country.iran,
              width: 50,
              height: 35,
            ),
          ),
        ),
      );

      expect(find.byType(FlutterCountryFlags), findsOneWidget);
    });

    testWidgets('should display fallback for invalid country', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FlutterCountryFlags(
              country: 'invalid',
              width: 50,
              height: 35,
              fallbackText: 'No Flag',
            ),
          ),
        ),
      );

      expect(find.text('No Flag'), findsOneWidget);
    });

    testWidgets('should display country name when enabled', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FlutterCountryFlags(
              country: 'ir',
              width: 50,
              height: 35,
              showCountryName: true,
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('CountryFlag widget should work with string', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: CountryFlag(country: 'us', size: 24)),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('CountryFlag widget should work with enum', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CountryFlag(country: Country.unitedStates, size: 24),
          ),
        ),
      );

      expect(find.byType(CountryFlag), findsOneWidget);
    });

    testWidgets('CircularCountryFlag widget should work', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: CircularCountryFlag(country: 'gb', size: 40)),
        ),
      );

      expect(find.byType(CircularCountryFlag), findsOneWidget);
    });

    testWidgets('CountryFlagWithName widget should work', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CountryFlagWithName(
              country: 'de',
              flagWidth: 50,
              flagHeight: 35,
            ),
          ),
        ),
      );

      expect(find.byType(CountryFlagWithName), findsOneWidget);
    });
  });

  group('CountryFlags Utility Tests', () {
    test('should get country code from various inputs', () {
      expect(CountryFlags.getCountryCode('ir'), equals('IR'));
      expect(CountryFlags.getCountryCode('IR'), equals('IR'));
      expect(CountryFlags.getCountryCode('iran'), equals('IR'));
      expect(CountryFlags.getCountryCode('us'), equals('US'));
      expect(CountryFlags.getCountryCode('united states'), equals('US'));
      expect(CountryFlags.getCountryCode('invalid'), isNull);
    });

    test('should get country name from code', () {
      expect(CountryFlags.getCountryName('IR'), equals('iran'));
      expect(CountryFlags.getCountryName('US'), equals('united-states'));
      expect(CountryFlags.getCountryName('GB'), equals('united-kingdom'));
      expect(CountryFlags.getCountryName('INVALID'), isNull);
    });

    test('should return all country codes', () {
      final codes = CountryFlags.getAllCountryCodes();
      expect(codes, isNotEmpty);
      expect(codes, contains('IR'));
      expect(codes, contains('US'));
      expect(codes, contains('GB'));
    });

    test('should return all country names', () {
      final names = CountryFlags.getAllCountryNames();
      expect(names, isNotEmpty);
      expect(names, contains('iran'));
      expect(names, contains('united-states'));
      expect(names, contains('united-kingdom'));
    });
  });

  group('Country Enum Tests', () {
    test('should get country from code', () {
      expect(Country.fromCode('IR'), equals(Country.iran));
      expect(Country.fromCode('US'), equals(Country.unitedStates));
      expect(Country.fromCode('GB'), equals(Country.unitedKingdom));
      expect(Country.fromCode('INVALID'), isNull);
    });

    test('should get country from name', () {
      expect(Country.fromName('iran'), equals(Country.iran));
      expect(Country.fromName('united states'), equals(Country.unitedStates));
      expect(Country.fromName('United Kingdom'), equals(Country.unitedKingdom));
      expect(Country.fromName('invalid'), isNull);
    });

    test('should get display name', () {
      expect(Country.iran.displayName, equals('Iran'));
      expect(Country.unitedStates.displayName, equals('United States'));
      expect(Country.unitedKingdom.displayName, equals('United Kingdom'));
    });

    test('should get country code', () {
      expect(Country.iran.code, equals('IR'));
      expect(Country.unitedStates.code, equals('US'));
      expect(Country.unitedKingdom.code, equals('GB'));
    });

    test('should get all codes', () {
      final codes = Country.allCodes;
      expect(codes, isNotEmpty);
      expect(codes, contains('IR'));
      expect(codes, contains('US'));
      expect(codes, contains('GB'));
    });

    test('should get all display names', () {
      final names = Country.allDisplayNames;
      expect(names, isNotEmpty);
      expect(names, contains('Iran'));
      expect(names, contains('United States'));
      expect(names, contains('United Kingdom'));
    });
  });
}
