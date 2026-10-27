import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/doctors_screen.dart';
import 'screens/appointment_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/doctors',
      builder: (context, state) => const DoctorsScreen(),
    ),
    GoRoute(
      path: '/appointment',
      builder: (context, state) => const AppointmentScreen(),
    ),
  ],
);
