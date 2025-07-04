import 'package:flutter/widgets.dart';

class CountryFlags {
  // ایجاد مپ معکوس از کد کشور به نام
  static final Map<String, String> nameToCode = Map.fromEntries(
    countryMappings.entries.map((e) => MapEntry(e.key, e.value)),
  );

  /// Get country code from various input formats
  static String? getCountryCode(String input) {
    if (input.isEmpty) return null;

    final cleanInput = input.toLowerCase().trim();

    // Check if it's already a 2-letter ISO code
    if (cleanInput.length == 2) {
      final upperCode = cleanInput.toUpperCase();
      if (countryMapping.containsKey(upperCode)) {
        return upperCode;
      }
    }

    // Check if it's a 3-letter ISO code
    if (cleanInput.length == 3) {
      final upperCode = cleanInput.toUpperCase();
      // Convert 3-letter to 2-letter using reverse mapping
      for (final entry in countryMapping.entries) {
        if (entry.key == upperCode) {
          return entry.key;
        }
      }
    }

    // Check if it's a country name (with or without dashes)
    final nameVariations = [
      cleanInput,
      cleanInput.replaceAll(' ', '-'),
      cleanInput.replaceAll('-', ' '),
      cleanInput.replaceAll('_', '-'),
    ];

    for (final variation in nameVariations) {
      if (countryMappings.containsKey(variation)) {
        return countryMappings[variation];
      }
    }

    // Try partial matching for country names
    for (final entry in countryMappings.entries) {
      if (entry.key.contains(cleanInput) || cleanInput.contains(entry.key)) {
        return entry.value;
      }
    }

    return null;
  }

  /// Get country name from code
  static String? getCountryName(String code) {
    return countryMapping[code.toUpperCase()];
  }

  /// Get all available country codes
  static List<String> getAllCountryCodes() {
    return countryMapping.keys.toList()..sort();
  }

  /// Get all available country names
  static List<String> getAllCountryNames() {
    return countryMapping.values.toList()..sort();
  }

  // برای دیباگ: چاپ تمام کلیدهای موجود
  static void printAllCountries() {
    debugPrint('Available countries:');
    nameToCode.keys.toList()
      ..sort()
      ..forEach(debugPrint);
  }
}

const Map<String, String> countryMappings = {
  'andorra': 'AD',
  'united-arab-emirates': 'AE',
  'afghanistan': 'AF',
  'antigua-and-barbuda': 'AG',
  'anguilla': 'AI',
  'albania': 'AL',
  'armenia': 'AM',
  'netherlands-antilles': 'AN',
  'angola': 'AO',
  'antarctica': 'AQ',
  'argentina': 'AR',
  'american-samoa': 'AS',
  'austria': 'AT',
  'australia': 'AU',
  'aruba': 'AW',
  'aland-islands': 'AX',
  'azerbaijan': 'AZ',
  'bosnia-and-herzegovina': 'BA',
  'barbados': 'BB',
  'bangladesh': 'BD',
  'belgium': 'BE',
  'burkina-faso': 'BF',
  'bulgaria': 'BG',
  'bahrain': 'BH',
  'burundi': 'BI',
  'benin': 'BJ',
  'saint-barthelemy': 'BL',
  'bermuda': 'BM',
  'brunei': 'BN',
  'bolivia': 'BO',
  'bonaire-sint-eustatius-and-saba': 'BQ',
  'brazil': 'BR',
  'bahamas': 'BS',
  'bhutan': 'BT',
  'bouvet-island': 'BV',
  'botswana': 'BW',
  'belarus': 'BY',
  'belize': 'BZ',
  'canada': 'CA',
  'cocos-islands': 'CC',
  'democratic-republic-of-the-congo': 'CD',
  'central-african-republic': 'CF',
  'congo-brazzaville': 'CG',
  'switzerland': 'CH',
  'cote-divoire': 'CI',
  'cook-islands': 'CK',
  'chile': 'CL',
  'cameroon': 'CM',
  'china': 'CN',
  'colombia': 'CO',
  'costa-rica': 'CR',
  'cuba': 'CU',
  'cape-verde': 'CV',
  'curacao': 'CW',
  'christmas-island': 'CX',
  'cyprus': 'CY',
  'czech-republic': 'CZ',
  'germany': 'DE',
  'djibouti': 'DJ',
  'denmark': 'DK',
  'dominica': 'DM',
  'dominican-republic': 'DO',
  'algeria': 'DZ',
  'ecuador': 'EC',
  'estonia': 'EE',
  'egypt': 'EG',
  'western-sahara': 'EH',
  'eritrea': 'ER',
  'spain': 'ES',
  'ethiopia': 'ET',
  'european-union': 'EU',
  'finland': 'FI',
  'fiji': 'FJ',
  'falkland-islands': 'FK',
  'micronesia': 'FM',
  'faroe-islands': 'FO',
  'france': 'FR',
  'gabon': 'GA',
  'england': 'GB-ENG',
  'northern-ireland': 'GB-NIR',
  'scotland': 'GB-SCT',
  'wales': 'GB-WLS',
  'united-kingdom': 'GB',
  'grenada': 'GD',
  'georgia': 'GE',
  'french-guiana': 'GF',
  'guernsey': 'GG',
  'ghana': 'GH',
  'gibraltar': 'GI',
  'greenland': 'GL',
  'gambia': 'GM',
  'guinea': 'GN',
  'guadeloupe': 'GP',
  'equatorial-guinea': 'GQ',
  'greece': 'GR',
  'south-georgia-and-the-south-sandwich-islands': 'GS',
  'guatemala': 'GT',
  'guam': 'GU',
  'guinea-bissau': 'GW',
  'guyana': 'GY',
  'hong-kong': 'HK',
  'heard-island-and-mcdonald-islands': 'HM',
  'honduras': 'HN',
  'croatia': 'HR',
  'haiti': 'HT',
  'hungary': 'HU',
  'indonesia': 'ID',
  'ireland': 'IE',
  'israel': 'IL',
  'isle-of-man': 'IM',
  'india': 'IN',
  'british-indian-ocean-territory': 'IO',
  'iraq': 'IQ',
  'iran': 'IR',
  'iceland': 'IS',
  'italy': 'IT',
  'jersey': 'JE',
  'jamaica': 'JM',
  'jordan': 'JO',
  'japan': 'JP',
  'kenya': 'KE',
  'kyrgyzstan': 'KG',
  'cambodia': 'KH',
  'kiribati': 'KI',
  'comoros': 'KM',
  'saint-kitts-and-nevis': 'KN',
  'north-korea': 'KP',
  'south-korea': 'KR',
  'kuwait': 'KW',
  'cayman-islands': 'KY',
  'kazakhstan': 'KZ',
  'laos': 'LA',
  'lebanon': 'LB',
  'saint-lucia': 'LC',
  'liechtenstein': 'LI',
  'sri-lanka': 'LK',
  'liberia': 'LR',
  'lesotho': 'LS',
  'lithuania': 'LT',
  'luxembourg': 'LU',
  'latvia': 'LV',
  'libya': 'LY',
  'morocco': 'MA',
  'monaco': 'MC',
  'moldova': 'MD',
  'montenegro': 'ME',
  'saint-martin': 'MF',
  'madagascar': 'MG',
  'marshall-islands': 'MH',
  'north-macedonia': 'MK',
  'mali': 'ML',
  'myanmar': 'MM',
  'mongolia': 'MN',
  'macao': 'MO',
  'northern-mariana-islands': 'MP',
  'martinique': 'MQ',
  'mauritania': 'MR',
  'montserrat': 'MS',
  'malta': 'MT',
  'mauritius': 'MU',
  'maldives': 'MV',
  'malawi': 'MW',
  'mexico': 'MX',
  'malaysia': 'MY',
  'mozambique': 'MZ',
  'namibia': 'NA',
  'new-caledonia': 'NC',
  'niger': 'NE',
  'norfolk-island': 'NF',
  'nigeria': 'NG',
  'nicaragua': 'NI',
  'netherlands': 'NL',
  'norway': 'NO',
  'nepal': 'NP',
  'nauru': 'NR',
  'niue': 'NU',
  'new-zealand': 'NZ',
  'oman': 'OM',
  'panama': 'PA',
  'peru': 'PE',
  'french-polynesia': 'PF',
  'papua-new-guinea': 'PG',
  'philippines': 'PH',
  'pakistan': 'PK',
  'poland': 'PL',
  'saint-pierre-and-miquelon': 'PM',
  'pitcairn': 'PN',
  'puerto-rico': 'PR',
  'palestine': 'PS',
  'portugal': 'PT',
  'palau': 'PW',
  'paraguay': 'PY',
  'qatar': 'QA',
  'reunion': 'RE',
  'romania': 'RO',
  'serbia': 'RS',
  'russia': 'RU',
  'rwanda': 'RW',
  'saudi-arabia': 'SA',
  'solomon-islands': 'SB',
  'seychelles': 'SC',
  'sudan': 'SD',
  'sweden': 'SE',
  'singapore': 'SG',
  'saint-helena': 'SH',
  'slovenia': 'SI',
  'svalbard-and-jan-mayen': 'SJ',
  'slovakia': 'SK',
  'sierra-leone': 'SL',
  'san-marino': 'SM',
  'senegal': 'SN',
  'somalia': 'SO',
  'suriname': 'SR',
  'south-sudan': 'SS',
  'sao-tome-and-principe': 'ST',
  'el-salvador': 'SV',
  'sint-maarten': 'SX',
  'syria': 'SY',
  'eswatini': 'SZ',
  'turks-and-caicos-islands': 'TC',
  'chad': 'TD',
  'french-southern-territories': 'TF',
  'togo': 'TG',
  'thailand': 'TH',
  'tajikistan': 'TJ',
  'tokelau': 'TK',
  'timor-leste': 'TL',
  'turkmenistan': 'TM',
  'tunisia': 'TN',
  'tonga': 'TO',
  'turkey': 'TR',
  'trinidad-and-tobago': 'TT',
  'tuvalu': 'TV',
  'taiwan': 'TW',
  'tanzania': 'TZ',
  'ukraine': 'UA',
  'uganda': 'UG',
  'united-states-minor-outlying-islands': 'UM',
  'united-states': 'US',
  'uruguay': 'UY',
  'uzbekistan': 'UZ',
  'vatican-city': 'VA',
  'saint-vincent-and-the-grenadines': 'VC',
  'venezuela': 'VE',
  'british-virgin-islands': 'VG',
  'us-virgin-islands': 'VI',
  'vietnam': 'VN',
  'vanuatu': 'VU',
  'wallis-and-futuna': 'WF',
  'samoa': 'WS',
  'kosovo': 'XK',
  'yemen': 'YE',
  'mayotte': 'YT',
  'south-africa': 'ZA',
  'zambia': 'ZM',
  'zimbabwe': 'ZW',
};
const Map<String, String> countryMapping = {
  'AF': 'afghanistan',
  'AL': 'albania',
  'DZ': 'algeria',
  'AD': 'andorra',
  'AO': 'angola',
  'AR': 'argentina',
  'AM': 'armenia',
  'AU': 'australia',
  'AT': 'austria',
  'AZ': 'azerbaijan',
  'BH': 'bahrain',
  'BD': 'bangladesh',
  'BY': 'belarus',
  'BE': 'belgium',
  'BZ': 'belize',
  'BJ': 'benin',
  'BT': 'bhutan',
  'BO': 'bolivia',
  'BA': 'bosnia-and-herzegovina',
  'BW': 'botswana',
  'BR': 'brazil',
  'BN': 'brunei',
  'BG': 'bulgaria',
  'BF': 'burkina-faso',
  'BI': 'burundi',
  'KH': 'cambodia',
  'CM': 'cameroon',
  'CA': 'canada',
  'CV': 'cape-verde',
  'CF': 'central-african-republic',
  'TD': 'chad',
  'CL': 'chile',
  'CO': 'colombia',
  'KM': 'comoros',
  'CG': 'congo-brazzaville',
  'CD': 'congo-kinshasa',
  'CR': 'costa-rica',
  'CI': 'cote-divoire',
  'HR': 'croatia',
  'CU': 'cuba',
  'CY': 'cyprus',
  'CZ': 'czech-republic',
  'DK': 'denmark',
  'DJ': 'djibouti',
  'DO': 'dominican-republic',
  'EC': 'ecuador',
  'EG': 'egypt',
  'SV': 'el-salvador',
  'GQ': 'equatorial-guinea',
  'ER': 'eritrea',
  'EE': 'estonia',
  'ET': 'ethiopia',
  'FJ': 'fiji',
  'FI': 'finland',
  'FR': 'france',
  'GA': 'gabon',
  'GM': 'gambia',
  'GE': 'georgia',
  'DE': 'germany',
  'GH': 'ghana',
  'GR': 'greece',
  'GT': 'guatemala',
  'GN': 'guinea',
  'GW': 'guinea-bissau',
  'GY': 'guyana',
  'HT': 'haiti',
  'HN': 'honduras',
  'HU': 'hungary',
  'IS': 'iceland',
  'IN': 'india',
  'ID': 'indonesia',
  'IR': 'iran',
  'IQ': 'iraq',
  'IE': 'ireland',
  'IL': 'israel',
  'IT': 'italy',
  'JM': 'jamaica',
  'JP': 'japan',
  'JO': 'jordan',
  'KZ': 'kazakhstan',
  'KE': 'kenya',
  'KI': 'kiribati',
  'KW': 'kuwait',
  'KG': 'kyrgyzstan',
  'LA': 'laos',
  'LV': 'latvia',
  'LB': 'lebanon',
  'LS': 'lesotho',
  'LR': 'liberia',
  'LY': 'libya',
  'LI': 'liechtenstein',
  'LT': 'lithuania',
  'LU': 'luxembourg',
  'MG': 'madagascar',
  'MW': 'malawi',
  'MY': 'malaysia',
  'MV': 'maldives',
  'ML': 'mali',
  'MT': 'malta',
  'MH': 'marshall-islands',
  'MR': 'mauritania',
  'MU': 'mauritius',
  'MX': 'mexico',
  'FM': 'micronesia',
  'MD': 'moldova',
  'MC': 'monaco',
  'MN': 'mongolia',
  'ME': 'montenegro',
  'MA': 'morocco',
  'MZ': 'mozambique',
  'MM': 'myanmar',
  'NA': 'namibia',
  'NR': 'nauru',
  'NP': 'nepal',
  'NL': 'netherlands',
  'NZ': 'new-zealand',
  'NI': 'nicaragua',
  'NE': 'niger',
  'NG': 'nigeria',
  'NO': 'norway',
  'OM': 'oman',
  'PK': 'pakistan',
  'PW': 'palau',
  'PA': 'panama',
  'PG': 'papua-new-guinea',
  'PY': 'paraguay',
  'PE': 'peru',
  'PH': 'philippines',
  'PL': 'poland',
  'PT': 'portugal',
  'QA': 'qatar',
  'RO': 'romania',
  'RU': 'russia',
  'RW': 'rwanda',
  'KN': 'saint-kitts-and-nevis',
  'LC': 'saint-lucia',
  'VC': 'saint-vincent-and-the-grenadines',
  'WS': 'samoa',
  'SM': 'san-marino',
  'ST': 'sao-tome-and-principe',
  'SA': 'saudi-arabia',
  'SN': 'senegal',
  'RS': 'serbia',
  'SC': 'seychelles',
  'SL': 'sierra-leone',
  'SG': 'singapore',
  'SK': 'slovakia',
  'SI': 'slovenia',
  'SB': 'solomon-islands',
  'SO': 'somalia',
  'ZA': 'south-africa',
  'SS': 'south-sudan',
  'ES': 'spain',
  'LK': 'sri-lanka',
  'SD': 'sudan',
  'SR': 'suriname',
  'SZ': 'swaziland',
  'SE': 'sweden',
  'CH': 'switzerland',
  'SY': 'syria',
  'TW': 'taiwan',
  'TJ': 'tajikistan',
  'TZ': 'tanzania',
  'TH': 'thailand',
  'TL': 'timor-leste',
  'TG': 'togo',
  'TO': 'tonga',
  'TT': 'trinidad-and-tobago',
  'TN': 'tunisia',
  'TR': 'turkey',
  'TM': 'turkmenistan',
  'TV': 'tuvalu',
  'UG': 'uganda',
  'UA': 'ukraine',
  'AE': 'united-arab-emirates',
  'GB': 'united-kingdom',
  'US': 'united-states',
  'UY': 'uruguay',
  'UZ': 'uzbekistan',
  'VU': 'vanuatu',
  'VA': 'vatican-city',
  'VE': 'venezuela',
  'VN': 'vietnam',
  'YE': 'yemen',
  'ZM': 'zambia',
  'ZW': 'zimbabwe',
};
