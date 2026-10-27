import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3000'; // Keyin o'zgartiramiz

  static Future<List<dynamic>> getDoctors() async {
    final response = await http.get(Uri.parse('$baseUrl/api/doctors'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Shifokorlarni yuklab bo\'lmadi');
  }

  static Future<Map<String, dynamic>> createAppointment({
    required String doctor,
    required String time,
    String patient = 'Bemor',
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/appointments'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'doctor': doctor,
        'time': time,
        'patient': patient,
      }),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw Exception('Navbat yuborilmadi');
  }
}
