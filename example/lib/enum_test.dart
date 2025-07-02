import 'package:flutter/material.dart';
import 'package:flutter_country_flags/flutter_country_flags.dart';

void main() {
  runApp(const EnumTestApp());
}

class EnumTestApp extends StatelessWidget {
  const EnumTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Enum Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const EnumTestPage(),
    );
  }
}

class EnumTestPage extends StatelessWidget {
  const EnumTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Enum Test'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Testing Country Enum',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Text(
              'Type-Safe Enum Usage:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),

            Row(
              children: [
                FlutterCountryFlags(
                  country: Country.iran,
                  width: 60,
                  height: 40,
                  showCountryName: true,
                ),
                SizedBox(width: 16),
                FlutterCountryFlags(
                  country: Country.unitedStates,
                  width: 60,
                  height: 40,
                  showCountryName: true,
                ),
                SizedBox(width: 16),
                FlutterCountryFlags(
                  country: Country.unitedKingdom,
                  width: 60,
                  height: 40,
                  showCountryName: true,
                ),
              ],
            ),

            SizedBox(height: 20),

            Text(
              'Circular Flags with Enum:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),

            Row(
              children: [
                CircularCountryFlag(country: Country.germany, size: 50),
                SizedBox(width: 16),
                CircularCountryFlag(country: Country.france, size: 50),
                SizedBox(width: 16),
                CircularCountryFlag(country: Country.japan, size: 50),
                SizedBox(width: 16),
                CircularCountryFlag(country: Country.china, size: 50),
              ],
            ),

            SizedBox(height: 20),

            Text(
              'Special Regions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),

            Row(
              children: [
                CountryFlagWithName(
                  country: Country.england,
                  flagWidth: 50,
                  flagHeight: 35,
                ),
                SizedBox(width: 16),
                CountryFlagWithName(
                  country: Country.scotland,
                  flagWidth: 50,
                  flagHeight: 35,
                ),
                SizedBox(width: 16),
                CountryFlagWithName(
                  country: Country.wales,
                  flagWidth: 50,
                  flagHeight: 35,
                ),
              ],
            ),

            SizedBox(height: 20),

            Text(
              'Mixed Usage (Enum vs String):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),

            Column(
              children: [
                Row(
                  children: [
                    Text('Enum: '),
                    FlutterCountryFlags(
                      country: Country.brazil,
                      width: 40,
                      height: 28,
                    ),
                    SizedBox(width: 20),
                    Text('String: '),
                    FlutterCountryFlags(country: 'br', width: 40, height: 28),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Enum: '),
                    FlutterCountryFlags(
                      country: Country.canada,
                      width: 40,
                      height: 28,
                    ),
                    SizedBox(width: 20),
                    Text('String: '),
                    FlutterCountryFlags(
                      country: 'canada',
                      width: 40,
                      height: 28,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
