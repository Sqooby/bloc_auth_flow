import 'package:bloc_auth_flow/auth/auth_service.dart';
import 'package:bloc_auth_flow/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
