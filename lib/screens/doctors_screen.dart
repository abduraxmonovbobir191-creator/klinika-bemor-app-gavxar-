import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  final List<Map<String, String>> doctors = const [
    {'name': 'Dr. Aliyeva Nodira', 'specialty': 'Terapevt', 'experience': '12 yil'},
    {'name': 'Dr. Karimov Jasur', 'specialty': 'Kardiolog', 'experience': '8 yil'},
    {'name': 'Dr. Rahimova Malika', 'specialty': 'Pediatr', 'experience': '10 yil'},
    {'name': 'Dr. Toshmatov Akmal', 'specialty': 'Stomatolog', 'experience': '15 yil'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Shifokorlar')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 4)),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: const Color(0xFF4A90E2).withOpacity(0.1),
                  child: const Icon(Icons.person, color: Color(0xFF4A90E2), size: 30),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctor['name']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(doctor['specialty']!, style: TextStyle(color: Colors.grey[600])),
                      Text('${doctor['experience']} tajriba', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
          ).animate().fadeIn(delay: (100 * index).ms).slideX(begin: 0.1);
        },
      ),
    );
  }
}
