import 'package:cloudwalk_weather/intl/en_us.dart';
import 'package:cloudwalk_weather/intl/pt_br.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    'en_US': enUS,
    'pt_BR': ptBR,
  };
}
