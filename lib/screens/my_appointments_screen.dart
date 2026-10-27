import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  final List<Map<String, String>> appointments = const [
    {'doctor': 'Dr. Aliyeva', 'date': 'Bugun', 'time': '15:30', 'status': 'Tasdiqlangan'},
    {'doctor': 'Dr. Karimov', 'date': 'Ertaga', 'time': '10:00', 'status': 'Kutilmoqda'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Mening navbatlarim')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final apt = appointments[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(apt['doctor']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text('${apt['date']} • ${apt['time']}', style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4A90E2).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(apt['status']!, style: const TextStyle(color: Color(0xFF4A90E2), fontSize: 12)),
                ),
              ],
            ),
          ).animate().fadeIn(delay: (100 * index).ms);
        },
      ),
    );
  }
}
