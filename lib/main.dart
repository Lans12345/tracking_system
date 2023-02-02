import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_system/screens/home_screen.dart';

const apiKey = 'AIzaSyD1wT4D93-Rz5pmb_UEjFBh1_QD1lX5g0U';
const projectId = 'autoworkx-tracking-system';

void main() async {
  Firestore.initialize(projectId);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autoworkx',
      home: HomeScreen(),
    );
  }
}
