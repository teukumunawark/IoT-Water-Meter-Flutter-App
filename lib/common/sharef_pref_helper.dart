import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getDevID() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('devID');
}
