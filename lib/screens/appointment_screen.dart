import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String? selectedDoctor;
  DateTime? selectedDate;
  String? selectedTime;

  final doctors = ['Dr. Aliyeva', 'Dr. Karimov', 'Dr. Rahimova'];
  final times = ['09:00', '10:00', '11:00', '14:00', '15:00', '16:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Navbat olish')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Shifokor tanlang', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 12),
            ...doctors.map((d) => _optionTile(d, selectedDoctor == d, () => setState(() => selectedDoctor = d))),
            const SizedBox(height: 24),
            const Text('Vaqt tanlang', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: times.map((t) => ChoiceChip(
                label: Text(t),
                selected: selectedTime == t,
                onSelected: (_) => setState(() => selectedTime = t),
                selectedColor: const Color(0xFF4A90E2).withOpacity(0.2),
              )).toList(),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedDoctor != null && selectedTime != null
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Navbat so\'rovi yuborildi!')),
                        );
                      }
                    : null,
                child: const Text('Navbatni tasdiqlash'),
              ),
            ).animate().fadeIn(delay: 300.ms),
          ],
        ),
      ),
    );
  }

  Widget _optionTile(String title, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4A90E2).withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: selected ? const Color(0xFF4A90E2) : Colors.transparent),
        ),
        child: Row(
          children: [
            Icon(selected ? Icons.check_circle : Icons.circle_outlined, color: const Color(0xFF4A90E2)),
            const SizedBox(width: 12),
            Text(title, style: TextStyle(fontWeight: selected ? FontWeight.w600 : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
