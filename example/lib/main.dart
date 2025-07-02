import 'package:flutter/material.dart';
import 'package:flutter_country_flags/flutter_country_flags.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Country Flags Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FlagsDemo(),
    );
  }
}

class FlagsDemo extends StatefulWidget {
  const FlagsDemo({super.key});

  @override
  State<FlagsDemo> createState() => _FlagsDemoState();
}

class _FlagsDemoState extends State<FlagsDemo> {
  final TextEditingController _controller = TextEditingController(text: 'ir');

  final List<Country> popularCountries = [
    Country.iran,
    Country.unitedStates,
    Country.unitedKingdom,
    Country.germany,
    Country.france,
    Country.japan,
    Country.china,
    Country.india,
    Country.brazil,
    Country.canada,
    Country.australia,
    Country.italy,
    Country.spain,
    Country.russia,
    Country.southKorea,
    Country.mexico,
    Country.turkey,
    Country.saudiArabia,
    Country.egypt,
    Country.southAfrica,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Country Flags Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Test Country Input',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText:
                            'Enter country code or name (e.g., ir, iran, IR)',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => setState(() {}),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        FlutterCountryFlags(
                          country: _controller.text,
                          width: 60,
                          height: 40,
                        ),
                        const SizedBox(width: 16),
                        CountryFlagWithName(
                          country: _controller.text,
                          flagWidth: 50,
                          flagHeight: 35,
                        ),
                        const SizedBox(width: 16),
                        CircularCountryFlag(
                          country: _controller.text,
                          size: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Different Styles Section
            const Text(
              'Different Flag Styles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Standard Flags:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: popularCountries
                          .take(10)
                          .map(
                            (country) => FlutterCountryFlags(
                              country: country,
                              width: 40,
                              height: 28,
                            ),
                          )
                          .toList(),
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      'Circular Flags:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: popularCountries
                          .take(10)
                          .map(
                            (country) =>
                                CircularCountryFlag(country: country, size: 35),
                          )
                          .toList(),
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      'Small Flags:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: popularCountries
                          .map(
                            (country) =>
                                CountryFlag(country: country, size: 20),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Flags with Names Section
            const Text(
              'Flags with Country Names',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: popularCountries
                      .take(8)
                      .map(
                        (country) => CountryFlagWithName(
                          country: country,
                          flagWidth: 50,
                          flagHeight: 35,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Custom Styles Section
            const Text(
              'Custom Styles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rounded Corners:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        FlutterCountryFlags(
                          country: Country.iran,
                          width: 60,
                          height: 40,
                          borderRadius: 8,
                        ),
                        const SizedBox(width: 16),
                        FlutterCountryFlags(
                          country: Country.unitedStates,
                          width: 60,
                          height: 40,
                          borderRadius: 12,
                        ),
                        const SizedBox(width: 16),
                        FlutterCountryFlags(
                          country: Country.unitedKingdom,
                          width: 60,
                          height: 40,
                          borderRadius: 16,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      'Different Sizes:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FlutterCountryFlags(
                          country: Country.germany,
                          width: 30,
                          height: 20,
                        ),
                        const SizedBox(width: 8),
                        FlutterCountryFlags(
                          country: Country.france,
                          width: 45,
                          height: 30,
                        ),
                        const SizedBox(width: 8),
                        FlutterCountryFlags(
                          country: Country.japan,
                          width: 60,
                          height: 40,
                        ),
                        const SizedBox(width: 8),
                        FlutterCountryFlags(
                          country: Country.china,
                          width: 75,
                          height: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Enum Usage Section
            const Text(
              'Using Country Enum (Type-Safe)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Type-safe country selection:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        CountryFlagWithName(
                          country: Country.iran,
                          flagWidth: 40,
                          flagHeight: 28,
                        ),
                        CountryFlagWithName(
                          country: Country.unitedStates,
                          flagWidth: 40,
                          flagHeight: 28,
                        ),
                        CountryFlagWithName(
                          country: Country.unitedKingdom,
                          flagWidth: 40,
                          flagHeight: 28,
                        ),
                        CountryFlagWithName(
                          country: Country.germany,
                          flagWidth: 40,
                          flagHeight: 28,
                        ),
                        CountryFlagWithName(
                          country: Country.france,
                          flagWidth: 40,
                          flagHeight: 28,
                        ),
                        CountryFlagWithName(
                          country: Country.japan,
                          flagWidth: 40,
                          flagHeight: 28,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Special regions:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        CountryFlagWithName(
                          country: Country.england,
                          flagWidth: 40,
                          flagHeight: 28,
                        ),
                        const SizedBox(width: 16),
                        CountryFlagWithName(
                          country: Country.scotland,
                          flagWidth: 40,
                          flagHeight: 28,
                        ),
                        const SizedBox(width: 16),
                        CountryFlagWithName(
                          country: Country.wales,
                          flagWidth: 40,
                          flagHeight: 28,
                        ),
                        const SizedBox(width: 16),
                        CountryFlagWithName(
                          country: Country.europeanUnion,
                          flagWidth: 40,
                          flagHeight: 28,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Error Handling Section
            const Text(
              'Error Handling',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Invalid Country Codes:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        FlutterCountryFlags(
                          country: 'xyz',
                          width: 50,
                          height: 35,
                          fallbackText: 'N/A',
                        ),
                        const SizedBox(width: 16),
                        FlutterCountryFlags(
                          country: '',
                          width: 50,
                          height: 35,
                          fallbackText: 'Empty',
                        ),
                        const SizedBox(width: 16),
                        FlutterCountryFlags(
                          country: 'invalid',
                          width: 50,
                          height: 35,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
