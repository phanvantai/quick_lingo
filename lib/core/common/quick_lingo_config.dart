import 'package:flutter_dotenv/flutter_dotenv.dart';

class QuickLingoConfig {
  String baseUrl = dotenv.env['BASE_URL'] ?? 'http://localhost:3000';
}
